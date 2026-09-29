"""Generic tracing: one observable reports everything the state machine does.

With ``feature Tracing { generic = true }`` the generator gives the machine a
``trace_observable``. It delivers a ``TraceEvent`` for entering and leaving the machine, for the
start and the end of every run-to-completion step, for every state entry, exit and transition, for
raised events, for variable writes and for time events being set and unset.

An observer picks what it is interested in by looking at ``event.event_type``. The state and the
declared element come back as literals of the machine's own ``State`` and ``Feature`` enumerations,
which are plain integers in Python - ``names_of()`` below turns them back into the declared names.
"""

from light_switch import LightSwitch
from create.rx import Observer
from create.timer.timer_service import TimerService
from create.tracing import TraceEventType


def names_of(enumeration):
    """Maps the integer literals of a generated enumeration back to their declared names."""
    return {value: name for name, value in vars(enumeration).items()
            if isinstance(value, int) and not name.startswith('_')}


STATES = names_of(LightSwitch.State)
FEATURES = names_of(LightSwitch.Feature)


class TraceLogger(Observer):
    """Prints every trace event; indentation makes the run-to-completion steps visible as blocks."""

    def __init__(self):
        self.indent = ''

    def next(self, event=None):
        kind = event.event_type
        if kind == TraceEventType.MACHINE_ENTER:
            print('machine entered')
        elif kind == TraceEventType.MACHINE_EXIT:
            print('machine exited')
        elif kind == TraceEventType.MACHINE_RTS_START:
            print('step {')
            self.indent = '    '
        elif kind == TraceEventType.MACHINE_RTS_STOP:
            self.indent = ''
            print('}')
        elif kind == TraceEventType.STATE_ENTERED:
            print(self.indent + 'entered  ' + STATES[event.state])
        elif kind == TraceEventType.STATE_EXITED:
            print(self.indent + 'exited   ' + STATES[event.state])
        elif kind == TraceEventType.STATE_TRANSITION:
            print(self.indent + 'leaving  ' + STATES[event.state] + ' by a transition')
        elif kind == TraceEventType.EVENT_RAISED:
            value = '' if event.value is None else ' = ' + str(event.value)
            print(self.indent + 'raised   ' + FEATURES[event.feature] + value)
        elif kind == TraceEventType.VARIABLE_SET:
            print(self.indent + 'set      ' + FEATURES[event.feature] + ' = ' + str(event.value))
        elif kind == TraceEventType.TIME_EVENT_SET:
            print(self.indent + 'timer    started (' + str(event.value) + ')')
        elif kind == TraceEventType.TIME_EVENT_UNSET:
            print(self.indent + 'timer    cancelled (' + str(event.value) + ')')


def main():
    statemachine = LightSwitch()
    timer_service = TimerService()
    statemachine.timer_service = timer_service

    # Subscribe before entering, so that entering the machine is traced as well.
    statemachine.trace_observable.subscribe(TraceLogger())

    statemachine.enter()

    print()
    print("Type 'on' or 'off' to operate the light, 'quit' to leave.")
    while True:
        try:
            line = input()
        except EOFError:
            break
        if line.lower() == 'quit':
            break
        if line.lower() == 'on':
            statemachine.raise_on_button()
        elif line.lower() == 'off':
            statemachine.raise_off_button()

    statemachine.exit()
    timer_service.cancel()


if __name__ == '__main__':
    main()

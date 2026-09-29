/*
 * Generic tracing: one observer receives everything the state machine does.
 *
 * With `feature Tracing { generic = true }` the generator adds setTraceObserver() to the machine.
 * The observer's single traceEvent() callback is invoked for entering and leaving the machine, for
 * the start and the end of every run-to-completion step, for every state entry, exit and
 * transition, for every raised event (incoming and outgoing), for every variable write and for time
 * events being set and unset.
 *
 * The observer picks what it is interested in by switching on event.getType(). The state comes back
 * as a typed LightSwitch::State literal and the declared element as a LightSwitch::LightSwitchFeature
 * literal, so nothing has to be parsed out of strings.
 */

#include <iostream>
#include <string>

#include "LightSwitch.h"
#include "sc_timer_service.h"

using namespace std;
using namespace sc::timer;
using namespace sc::trace;

typedef TraceEvent<LightSwitch, LightSwitch::State, LightSwitch::LightSwitchFeature> LightSwitchTraceEvent;

static const char* stateNames[] = {"NO_STATE", "main_region_Off", "main_region_On"};

class TraceLogger: public TraceObserver<LightSwitch, LightSwitch::State,
		LightSwitch::LightSwitchFeature> {
public:
	void traceEvent(const LightSwitchTraceEvent &event) override {
		switch (event.getType()) {
		case TraceEventType::MACHINE_ENTER:
			cout << "machine entered" << endl;
			break;
		case TraceEventType::MACHINE_EXIT:
			cout << "machine exited" << endl;
			break;
		case TraceEventType::MACHINE_RTS_START:
			cout << "step {" << endl;
			indent = "    ";
			break;
		case TraceEventType::MACHINE_RTS_STOP:
			indent = "";
			cout << "}" << endl;
			break;
		case TraceEventType::STATE_ENTERED:
			cout << indent << "entered  " << nameOf(event.getState()) << endl;
			break;
		case TraceEventType::STATE_EXITED:
			cout << indent << "exited   " << nameOf(event.getState()) << endl;
			break;
		case TraceEventType::STATE_TRANSITION:
			cout << indent << "leaving  " << nameOf(event.getState()) << " by a transition" << endl;
			break;
		case TraceEventType::EVENT_RAISED:
			cout << indent << "raised   " << nameOf(event.getFeature()) << endl;
			break;
		case TraceEventType::VARIABLE_SET:
			// getValue() is a const void*; its static type follows from the feature, and
			// 'brightness', the only variable, is an sc::integer.
			cout << indent << "set      " << nameOf(event.getFeature()) << " = "
					<< *static_cast<const sc::integer*>(event.getValue()) << endl;
			break;
		case TraceEventType::TIME_EVENT_SET:
			cout << indent << "timer    started" << endl;
			break;
		case TraceEventType::TIME_EVENT_UNSET:
			cout << indent << "timer    cancelled" << endl;
			break;
		default:
			break;
		}
	}

private:
	string indent;

	static const char* nameOf(LightSwitch::State state) {
		return stateNames[static_cast<int>(state)];
	}

	static const char* nameOf(LightSwitch::LightSwitchFeature feature) {
		switch (feature) {
		case LightSwitch::LightSwitchFeature::ON_BUTTON:
			return "on_button";
		case LightSwitch::LightSwitchFeature::OFF_BUTTON:
			return "off_button";
		case LightSwitch::LightSwitchFeature::ON:
			return "on";
		case LightSwitch::LightSwitchFeature::OFF:
			return "off";
		case LightSwitch::LightSwitchFeature::BRIGHTNESS:
			return "brightness";
		default:
			return "?";
		}
	}
};

#define MAX_TIMERS 4

int main() {
	static TimerTask tasks[MAX_TIMERS];
	LightSwitch statemachine;
	TimerService timerService(tasks, MAX_TIMERS);
	TraceLogger logger;

	statemachine.setTimerService(&timerService);
	// Set before entering, so that entering the machine is traced as well.
	statemachine.setTraceObserver(&logger);

	statemachine.enter();

	cout << endl << "Type 'on' or 'off' to operate the light, 'quit' to leave." << endl;
	string line;
	while (getline(cin, line)) {
		if (line == "quit") {
			break;
		}
		if (line == "on") {
			statemachine.raiseOn_button();
		} else if (line == "off") {
			statemachine.raiseOff_button();
		}
	}

	statemachine.exit();
	return 0;
}

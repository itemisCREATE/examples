package itemis.create.examples.tracing;

import itemis.create.core.TimerService;
import itemis.create.core.TraceEvent;
import itemis.create.core.rx.Observer;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * Generic tracing: one observable reports everything the state machine does.
 *
 * <p>With <code>feature Tracing { generic = true }</code> the generator adds a
 * <code>getTrace()</code> observable to the machine. It delivers a {@link TraceEvent} for entering
 * and leaving the machine, for the start and the end of every run-to-completion step, for every
 * state entry, exit and transition, for every raised event (incoming and outgoing), for every
 * variable write and for time events being set and unset. A timer firing is not a trace event of
 * its own: the step it causes is.
 *
 * <p>An observer picks what it is interested in by switching on {@link TraceEvent#getType()}. The
 * state comes back as a typed <code>LightSwitch.State</code> literal and the declared element as a
 * <code>LightSwitch.Feature</code> literal, so nothing has to be parsed out of strings.
 */
public class Main {

	private static final class TraceLogger
			implements Observer<TraceEvent<LightSwitch, LightSwitch.State, LightSwitch.Feature>> {

		/** Indentation makes the run-to-completion steps visible as blocks. */
		private String indent = "";

		@Override
		public void next(TraceEvent<LightSwitch, LightSwitch.State, LightSwitch.Feature> event) {
			switch (event.getType()) {
			case MACHINE_ENTER:
				System.out.println("machine entered");
				break;
			case MACHINE_EXIT:
				System.out.println("machine exited");
				break;
			case MACHINE_RTS_START:
				System.out.println("step {");
				indent = "    ";
				break;
			case MACHINE_RTS_STOP:
				indent = "";
				System.out.println("}");
				break;
			case STATE_ENTERED:
				System.out.println(indent + "entered  " + event.getState());
				break;
			case STATE_EXITED:
				System.out.println(indent + "exited   " + event.getState());
				break;
			case STATE_TRANSITION:
				System.out.println(indent + "leaving  " + event.getState() + " by a transition");
				break;
			case EVENT_RAISED:
				System.out.println(indent + "raised   " + event.getFeature()
						+ (event.getValue() == null ? "" : " = " + event.getValue()));
				break;
			case VARIABLE_SET:
				System.out.println(indent + "set      " + event.getFeature() + " = " + event.getValue());
				break;
			case TIME_EVENT_SET:
				System.out.println(indent + "timer    started (" + event.getValue() + ")");
				break;
			case TIME_EVENT_UNSET:
				System.out.println(indent + "timer    cancelled (" + event.getValue() + ")");
				break;
			default:
				break;
			}
		}
	}

	public static void main(String[] args) throws IOException {
		LightSwitch statemachine = new LightSwitch();
		TimerService timerService = new TimerService();
		statemachine.setTimerService(timerService);

		// Subscribe before entering, so that entering the machine is traced as well.
		statemachine.getTrace().subscribe(new TraceLogger());

		statemachine.enter();

		System.out.println();
		System.out.println("Type 'on' or 'off' to operate the light, 'quit' to leave.");
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		String line;
		while ((line = in.readLine()) != null) {
			if ("quit".equalsIgnoreCase(line)) {
				break;
			}
			if ("on".equalsIgnoreCase(line)) {
				statemachine.raiseOn_button();
			} else if ("off".equalsIgnoreCase(line)) {
				statemachine.raiseOff_button();
			}
		}

		statemachine.exit();
		timerService.cancel();
	}
}

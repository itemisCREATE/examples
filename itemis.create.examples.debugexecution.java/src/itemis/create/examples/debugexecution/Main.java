package itemis.create.examples.debugexecution;

import itemis.create.core.Logger;
import itemis.create.core.TimerService;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

/**
 * Execution logging with the <code>@DebugExecution</code> annotation.
 *
 * <p>Writing <code>@DebugExecution</code> into the statechart's specification makes the generator
 * emit a log call for every expression the machine evaluates: each assignment is reported with the
 * source text it came from and with the value that was actually written. Nothing else about the
 * model or the generator model changes, and removing the annotation removes the calls again - the
 * logging is generated, not switched on at run time.
 *
 * <p>The model is written so that every kind of entry the feature produces shows up: the guard on the
 * transition out of <code>Off</code> is reported with the value of each variable it read, the assignment
 * behind it with its own reads and its result, and the <code>after timeout s</code> trigger with the
 * value the timer was actually scheduled with. The local reaction in <code>On</code> brightens on each
 * further press; its guard is reported too, and at full brightness it reports that it did not hold.
 * Switching off by hand shares the transition with the timeout, and then no time event is reported.
 *
 * <p>The machine writes through an <code>itemis.create.core.Logger</code> that the application sets
 * with <code>setDebugLog()</code>. The default logger prints to the console; the constructor taking
 * a list also appends every entry to it, which is how a test reads back what the machine reported.
 *
 * <p><code>@DebugExecution</code> and generic tracing answer different questions.
 * <code>@DebugExecution</code> shows the <em>expressions</em>, as written in the statechart, in the
 * order they were evaluated - it is a print-debugging aid. Generic tracing
 * (see the "Generic Tracing" examples) reports the <em>state machine's behaviour</em> as typed
 * events a program can react to.
 */
public class Main {

	public static void main(String[] args) throws IOException {
		LightSwitch statemachine = new LightSwitch();
		TimerService timerService = new TimerService();
		statemachine.setTimerService(timerService);

		// The log is kept as well as printed, so that it can be inspected afterwards.
		List<String> log = new ArrayList<>();
		statemachine.setDebugLog(new Logger(log));

		statemachine.enter();

		System.out.println();
		System.out.println("Press enter to push the button, type 'off' to switch off, 'quit' to leave.");
		System.out.println("The light dims itself " + statemachine.getTimeout() + " seconds after it came on.");
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		String line;
		while ((line = in.readLine()) != null) {
			if ("quit".equalsIgnoreCase(line)) {
				break;
			}
			if ("off".equalsIgnoreCase(line)) {
				statemachine.raiseOff_button();
			} else {
				statemachine.raiseOn_button();
			}
		}

		statemachine.exit();
		timerService.cancel();

		System.out.println();
		System.out.println(log.size() + " expressions were evaluated in this session.");
	}
}

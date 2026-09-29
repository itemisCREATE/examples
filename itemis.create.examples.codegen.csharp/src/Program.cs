using System;

namespace Itemis.Create.Examples.Codegen.Csharp
{
    /// <summary>
    /// An interactive console for the generated LightSwitch state machine.
    ///
    /// The steps are the same in every target language:
    ///  - instantiate the state machine
    ///  - give it a timer service, because the statechart uses 'after 30 s'
    ///  - subscribe to the out events of the 'light' interface
    ///  - enter the state machine; from here on it reacts to incoming events
    ///  - raise 'user.on_button' / 'user.off_button'
    /// </summary>
    public class Program
    {
        // The state machine is entered from the console thread and from timer callbacks,
        // so every call into it is serialized on this monitor.
        private static readonly object Monitor = new object();

        public static void Main(string[] args)
        {
            var statemachine = new LightSwitch();
            var timerService = new TimerService(Monitor);
            statemachine.SetTimerService(timerService);

            // The generator turns each out event of an interface scope into a C# event.
            statemachine.Light.On += (sender, e) =>
                Console.WriteLine($"Light is on. Brightness: {sender.Brightness}.");
            statemachine.Light.Off += (sender, e) =>
                Console.WriteLine("Light is off.");

            lock (Monitor)
            {
                statemachine.Enter();
            }

            Console.WriteLine("Type 'On' or 'Off' to switch the light on or off, 'Quit' to leave.");
            Console.WriteLine("The light switches itself off 30 seconds after the last button press.");

            string input;
            while ((input = Console.ReadLine()) != null)
            {
                if (string.Equals(input, "Quit", StringComparison.OrdinalIgnoreCase))
                {
                    break;
                }
                lock (Monitor)
                {
                    if (string.Equals(input, "On", StringComparison.OrdinalIgnoreCase))
                    {
                        statemachine.User.RaiseOn_button();
                    }
                    else if (string.Equals(input, "Off", StringComparison.OrdinalIgnoreCase))
                    {
                        statemachine.User.RaiseOff_button();
                    }
                }
            }

            lock (Monitor)
            {
                statemachine.Exit();
            }
            timerService.Shutdown();
        }
    }
}

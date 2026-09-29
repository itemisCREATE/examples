using System;
using System.Collections.Generic;

using Itemis.Create.Timer;

// The generated runtime lives in the namespace Itemis.Create.Timer, and this file is inside
// Itemis.Create.Examples..., so the plain name 'Timer' resolves to that namespace rather than to
// System.Threading.Timer. The alias keeps both reachable.
using SystemTimer = System.Threading.Timer;

namespace Itemis.Create.Examples.Codegen.Csharp
{
    /// <summary>
    /// A wall-clock ITimerService on top of System.Threading.Timer.
    ///
    /// The C# generator ships the ITimerService contract and a VirtualTimer for tests, but no
    /// real-time implementation - what "real time" means is an application decision. This one is
    /// about as small as it gets: one System.Threading.Timer per running time event, and a lock so
    /// that a timer callback never runs concurrently with the console thread.
    /// </summary>
    public class TimerService : ITimerService
    {
        private readonly Dictionary<int, SystemTimer> timers = new Dictionary<int, SystemTimer>();
        private readonly object monitor;

        /// <param name="monitor">
        /// Guards the state machine: a time event and a user event must not enter it at once.
        /// </param>
        public TimerService(object monitor)
        {
            this.monitor = monitor;
        }

        public void SetTimer(ITimed callback, int eventID, long time, bool isPeriodic)
        {
            UnsetTimer(callback, eventID);
            var period = isPeriodic ? time : System.Threading.Timeout.Infinite;
            var timer = new SystemTimer(_ =>
            {
                lock (monitor)
                {
                    callback.RaiseTimeEvent(eventID);
                }
            }, null, time, period);
            lock (timers)
            {
                timers[eventID] = timer;
            }
        }

        public void UnsetTimer(ITimed callback, int eventID)
        {
            lock (timers)
            {
                if (timers.TryGetValue(eventID, out var timer))
                {
                    timer.Dispose();
                    timers.Remove(eventID);
                }
            }
        }

        public void Shutdown()
        {
            lock (timers)
            {
                foreach (var timer in timers.Values)
                {
                    timer.Dispose();
                }
                timers.Clear();
            }
        }
    }
}

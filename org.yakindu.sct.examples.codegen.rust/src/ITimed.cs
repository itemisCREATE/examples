public interface ITimed
    {
        /// <summary>
        /// Callback method if a time event occurred.
        /// </summary>
        /// <param name="eventID">The id of the occurred event.</param>
        void RaiseTimeEvent(long eventID);

        /// <summary>
        /// Set the ITimerService for the state machine. It must be set
        /// externally on a timed state machine before Enter() is called.
        /// </summary>
        /// <param name="timerService">The timer service implementation to be set.</param>
        void SetTimerService(ITimerService timerService);
    }

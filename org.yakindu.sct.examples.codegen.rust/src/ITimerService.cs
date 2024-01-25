public interface ITimerService
{
    /// <summary>
    /// Starts the timing for a given time event id.
    /// </summary>
    /// <param name="callback">An ITimed object that is called when the timer expires.</param>
    /// <param name="eventID">The id of the state machine's time event.</param>
    /// <param name="time">Time in milliseconds after which the time event should be triggered.</param>
    /// <param name="isPeriodic">Set to true to trigger the time event periodically.</param>
    void SetTimer(ITimed callback, int eventID, long time, bool isPeriodic);
    
    /// <summary>
    /// Unsets a time event.
    /// </summary>
    /// <param name="callback">An ITimed object that is called when the timer expires.</param>
    /// <param name="eventID">The id of the state machine's time event.</param>
    void UnsetTimer(ITimed callback, int eventID);
}

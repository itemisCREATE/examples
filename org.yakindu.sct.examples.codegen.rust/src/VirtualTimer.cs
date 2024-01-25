using System;
using System.Collections.Generic;
using System.Numerics;

    public class VirtualTimer : ITimerService
    {
        private BigInteger stopTime = BigInteger.Zero;
        protected BigInteger currentTime = BigInteger.Zero;
        protected long cyclePeriod = 0;
        protected BigInteger scheduleCount = BigInteger.Zero;

        private SortedSet<VirtualTimeTask> tasks;

        public abstract class VirtualTimeTask : IComparable<VirtualTimeTask>
        {
            public BigInteger nextExecutionTime = BigInteger.Zero;
            public long interval = 0;
            public long period = -1;
            public BigInteger scheduleOrder = BigInteger.Zero;
            public bool isCanceled = false;

            public int CompareTo(VirtualTimeTask other)
            {
                BigInteger diff = BigInteger.Zero;

                if (!nextExecutionTime.Equals(other.nextExecutionTime))
                {
                    diff = nextExecutionTime - other.nextExecutionTime;
                }
                else if (other is CycleTimeEventTask && this is not CycleTimeEventTask)
                {
                    return -1;
                }
                else if (other is not CycleTimeEventTask && this is CycleTimeEventTask)
                {
                    return 1;
                }
                else
                {
                    diff = scheduleOrder - other.scheduleOrder;
                }
                return diff.CompareTo(BigInteger.Zero);
            }

            public bool IsCanceled()
            {
                return isCanceled;
            }

            public void Cancel()
            {
                isCanceled = true;
            }

            public abstract void Run();
        }

        public class VirtualTimeEventTask : VirtualTimeTask
        {
            private readonly int eventID;
            private readonly ITimed callback;

            public VirtualTimeEventTask(ITimed callback, int eventID)
            {
                this.callback = callback;
                this.eventID = eventID;
            }

            public int GetEventId()
            {
                return eventID;
            }

            public ITimed GetCallback()
            {
                return callback;
            }

            public override void Run()
            {
                callback.RaiseTimeEvent(eventID);
            }
        }

        public class CycleTimeEventTask : VirtualTimeTask
        {
            public readonly IEventDrivenStatemachine statemachine;

            public CycleTimeEventTask(IEventDrivenStatemachine statemachine)
            {
                this.statemachine = statemachine;
            }

            public override void Run()
            {
            }
        }

        public VirtualTimer()
        {
            tasks = new SortedSet<VirtualTimeTask>();
        }

        public VirtualTimer(long cyclePeriod)
        {
            tasks = new SortedSet<VirtualTimeTask>();
            this.cyclePeriod = cyclePeriod;
        }

        public void TimeLeap(long ms)
        {
            stopTime = currentTime + new BigInteger(ms);
            ProcessTasks();
        }

        public void CycleLeap(long cycles)
        {
            int elapsedCycles = 0;

            while (elapsedCycles < cycles)
            {
                VirtualTimeTask cycleTask = GetCycleTask();
                if (cycleTask == null)
                    return;

                BigInteger timeToNextCycle = BigInteger.Subtract(cycleTask.nextExecutionTime, currentTime);
                TimeLeap((long)timeToNextCycle);
                elapsedCycles += 1;
            }
        }

        public void SetTimer(ITimed callback, int eventID, long duration, bool isPeriodical)
        {
            if (duration <= 0)
                duration = 1;
            VirtualTimeEventTask timeEventTask = new(callback, eventID);
            if (isPeriodical)
            {
                SchedulePeriodicalTask(timeEventTask, duration, duration);
            }
            else
            {
                ScheduleTask(timeEventTask, duration);
            }
        }

        public void UnsetTimer(ITimed callback, int eventID)
        {
            VirtualTimeTask timerTask = GetTask(callback, eventID);
            timerTask?.Cancel();
        }

        public void ScheduleTask(VirtualTimeTask task, long interval)
        {
            task.interval = interval;
            ScheduleInternal(task, currentTime + new BigInteger(interval), -1);
        }

        public void SchedulePeriodicalTask(VirtualTimeTask task, long interval, long period)
        {
            ScheduleInternal(task, currentTime + new BigInteger(interval), period);
        }

         private void ScheduleInternal(VirtualTimeTask task, BigInteger time, long period)
        {
            task.nextExecutionTime = time;
            task.period = period;
            task.scheduleOrder = scheduleCount;
            scheduleCount += BigInteger.One;
            tasks.Add(task);
        }

        protected VirtualTimeTask GetTask(ITimed callback, int eventName)
        {
            foreach (VirtualTimeTask virtualTimeTask in tasks)
            {
                if (virtualTimeTask is not VirtualTimeEventTask)
                    continue;
                if (((VirtualTimeEventTask)virtualTimeTask).GetEventId() == eventName
                    && ((VirtualTimeEventTask)virtualTimeTask).GetCallback() == callback)
                    return virtualTimeTask;
            }
        return null;
        }

        protected CycleTimeEventTask GetCycleTask()
        {
            foreach (VirtualTimeTask task in tasks)
            {
                if (task is CycleTimeEventTask task1 && !task.IsCanceled())
                {
                    return task1;
                }
            }
            return null;
        }

        protected void ProcessTasks()
        {
            bool processTasks = tasks.Count > 0;
            while (processTasks)
            {
                VirtualTimeTask task = tasks.Min;
                if (task == null)
                    break;
                if (task.isCanceled)
                {
                    tasks.Remove(task);
                    continue;
                }

                if (task.nextExecutionTime.CompareTo(stopTime) <= 0)
                {
                    currentTime = task.nextExecutionTime;
                    tasks.Remove(task);
                    if (task.period > -1)
                    {
                        tasks.Remove(task);
                        task.nextExecutionTime = currentTime + new BigInteger(task.period);
                        tasks.Add(task);
                    }
                    task.Run();
                }
                else
                {
                    currentTime = stopTime;
                    processTasks = false;
                }
            }
        }


        public void Stop()
        {
            foreach (VirtualTimeTask timerTask in tasks)
            {
                timerTask.Cancel();
            }
            Cancel();
        }

        public void Cancel()
        {
            lock (tasks)
            {
                tasks.Clear();
            }
        }
    }


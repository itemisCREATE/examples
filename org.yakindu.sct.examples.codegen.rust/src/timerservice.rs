/** Generated by itemis CREATE code generator. */

use crate::statemachine::CycleBasedStatemachine;
//use crate::types::{EventId, Integer};
type Integer = i32;
type EventId = i32;
use std::cell::RefCell;
use std::cmp;
use std::cmp::min;
use std::ops::{Deref, DerefMut};
use std::rc::{Rc, Weak};
/*
Interface for state machines which use timed event triggers.
*/
pub trait Timed {
    //TODO remove PartialEq + Copy + Clone

    /*
    Set the timer service for the state machine. It must be set
    externally on a timed state machine before a run cycle can be executed.
    */
    fn set_timer_service(&mut self, timer_service: Rc<RefCell<dyn TimerServiceInterface>>) -> ();

    /*
    Return the currently used timer service.
    */
    fn get_timer_service(&self) -> &Rc<RefCell<dyn TimerServiceInterface>>;

    /*
    Callback method if a time event occurred.
    */
    fn raise_time_event(&mut self, event: EventId) -> (); //changed this signature

    /*
    Retrieve the number of time events that can be active at once in this state machine.
    */
    fn get_number_of_parallel_time_events(&self) -> Integer;
}

pub trait TimerServiceInterface {
    //todo remove PartialEq + Clone

    /* Start the timing for a time event.
     */
    fn set_timer(
        &mut self,
        timed: Weak<RefCell<dyn Timed>>,
        event: EventId,
        time_ms: Integer,
        is_periodic: bool,
    ) -> ();
    /* Unset the given time event.
     */
    fn unset_timer(&mut self, timed: Weak<RefCell<dyn Timed>>, event: EventId) -> ();
}

#[derive(Debug)]
pub enum Task {
    //use Rc or similar type to aceess Option<X>, look into weak; Refcell<Rc<X>>?
    Empty(),
    TimeEvent(Weak<RefCell<dyn Timed>>, EventId, Integer, bool), // time_event_handle, pt_evid, time_ms, periodic
    Runcycle(Weak<RefCell<dyn CycleBasedStatemachine>>, Integer), // run_cycle_handle, time_ms
}

impl<'a> Clone for Task {
    fn clone(&self) -> Self {
        match self {
            Task::Empty() => Task::Empty(),
            Task::TimeEvent(time_event_handle, pt_evid, time_ms, periodic) => {
                Task::TimeEvent(time_event_handle.clone(), *pt_evid, *time_ms, *periodic)
            }
            Task::Runcycle(run_cycle_handle, time_ms) => {
                Task::Runcycle(run_cycle_handle.clone(), *time_ms)
            }
        }
    }
}

impl PartialEq for Task {
    fn eq(&self, other: &Self) -> bool {
        if let (
            Task::TimeEvent(time_event_handle_self, pt_evid_self, time_ms_self, periodic_self),
            Task::TimeEvent(time_event_handle_other, pt_evid_other, time_ms_other, periodic_other),
        ) = (self, other)
        {
            if pt_evid_self == pt_evid_other
                && time_ms_self == time_ms_other
                && periodic_self == periodic_other
            {
                return Weak::<RefCell<dyn Timed>>::ptr_eq(
                    time_event_handle_self,
                    time_event_handle_other,
                ); //x.ptr_eq(y);
            }
        }
        if let (
            Task::Runcycle(run_cycle_handle_self, time_ms_self),
            Task::Runcycle(run_cycle_handle_other, time_ms_other),
        ) = (self, other)
        {
            if time_ms_self == time_ms_other {
                return Weak::<RefCell<dyn CycleBasedStatemachine>>::ptr_eq(
                    run_cycle_handle_self,
                    run_cycle_handle_other,
                ); //x.ptr_eq(y);
            }
        }
        return false;
    }
}

#[derive(PartialEq, Clone, Debug)]
pub struct TaskData {
    task: Task,
}

impl TaskData {
    fn new() -> Self {
        Self {
            task: Task::Empty(),
        }
    }

    fn with_timed(
        statemachine: Weak<RefCell<dyn Timed>>,
        event: EventId,
        time_ms: Integer,
        is_periodic: bool,
    ) -> Self {
        let task: Task = Task::TimeEvent(statemachine, event, time_ms, is_periodic);
        Self { task }
    }

    fn with_cycle_based(
        run_cycle_handle: Weak<RefCell<dyn CycleBasedStatemachine>>,
        time_ms: Integer,
    ) -> Self {
        let task: Task = Task::Runcycle(run_cycle_handle, time_ms);
        Self { task }
    }

    fn reset(&mut self) -> () {
        match &self.task {
            Task::TimeEvent(_time_event_handle, _pt_evid, _time_ms, _periodic) => {
                self.task = Task::Empty();
            }
            Task::Runcycle(_run_cycle_handle, _time_ms) => {
                self.task = Task::Empty();
            }
            Task::Empty() => {
                self.task = Task::Empty();
            }
        }
    }

    fn execute(&mut self) -> () {
        match &mut self.task {
            Task::TimeEvent(time_event_handle, pt_evid, _time_ms, _periodic) => {
                time_event_handle.upgrade().map(|x| {
                    x.deref()
                        .borrow_mut()
                        .deref_mut()
                        .raise_time_event(*pt_evid)
                });
            }
            Task::Runcycle(run_cycle_handle, _time_ms) => {
                run_cycle_handle
                    .upgrade()
                    .map(|x| x.deref().borrow_mut().deref_mut().run_cycle());
            }
            Task::Empty() => {}
        }
    }
}

#[derive(PartialEq, Clone, Debug)]
pub struct TimerTask {
    data: TaskData,
    elapsed_time_ms: Integer,
    next_task_idx: usize,
}

impl TimerTask {
    pub fn new() -> Self {
        Self {
            data: TaskData::new(),
            elapsed_time_ms: 0,
            next_task_idx: 0,
        }
    }

    pub fn with_task_data(data: TaskData) -> Self {
        Self {
            data,
            elapsed_time_ms: 0,
            next_task_idx: 0,
        }
    }

    pub fn with_task(task: Task) -> Self {
        Self {
            data: TaskData { task },
            elapsed_time_ms: 0,
            next_task_idx: 0,
        }
    }

    pub fn update_elapsed_time_ms(&mut self, elapsed_time_ms_: Integer) -> () {
        self.elapsed_time_ms += elapsed_time_ms_;
    }
    //TODO random access daten struktur (linked list) die aber parametrisierten allocator nimmt: VecDequeue
    pub const fn is_periodic(&self) -> bool {
        if let Task::TimeEvent(_, _, _, periodic) = self.data.task {
            return periodic;
        }
        matches!(self.data.task, Task::Runcycle(_, _))
    }

    pub fn is_run_cycle_event(&self) -> bool {
        matches!(self.data.task, Task::Runcycle(_, _))
    }

    pub fn reset(&mut self) -> () {
        self.data.reset();
        self.elapsed_time_ms = 0;
    }
}

pub enum TimerTaskMatcher {
    MatchTimeEvent(Weak<RefCell<dyn Timed>>, EventId),
    MatchRunCycleOf(Weak<RefCell<dyn CycleBasedStatemachine>>),
}

impl TimerTaskMatcher {
    pub fn matches(&self, other: &TimerTask) -> bool {
        match self {
            TimerTaskMatcher::MatchRunCycleOf(run_cycle_handle) => {
                match &other.data.task {
                    Task::Runcycle(other_run_cycle_handle, _time_ms) => {
                        return Weak::ptr_eq(run_cycle_handle, other_run_cycle_handle);
                    }
                    _ => {
                        return false;
                    }
                };
            }
            TimerTaskMatcher::MatchTimeEvent(time_event_handle, pt_evid) => {
                match &other.data.task {
                    Task::TimeEvent(
                        other_time_event_handle,
                        other_pt_evid,
                        _time_ms,
                        _periodic,
                    ) => {
                        return Weak::ptr_eq(time_event_handle, other_time_event_handle)
                            && pt_evid == other_pt_evid;
                    }
                    _ => {
                        return false;
                    }
                };
            }
        }
    }
}

#[derive(PartialEq)]
pub struct TimerService {
    next_active_task: usize,
    next_free_task: usize,
    tasks: Vec<RefCell<TimerTask>>, //maybe derive sized type
}

impl TimerService {
    pub fn new() -> TimerService {
        TimerService {
            next_active_task: 0,
            next_free_task: 0,
            tasks: Vec::new(),
        }
    }

    pub fn with_tasks(tasks: Vec<RefCell<TimerTask>>) -> TimerService {
        //todo tasks should be owned and consumed by this function

        for (i, task) in tasks.deref().iter().enumerate() {
            let mut borrowed_task = task.deref().borrow_mut();
            borrowed_task.deref_mut().next_task_idx = i + 1;
        }
        let timer_service: TimerService = TimerService {
            next_active_task: tasks.deref().len(),
            next_free_task: 0,
            tasks,
        };
        timer_service
    }

    pub fn set_runcycle_timer_for(
        &mut self,
        statemachine: Weak<RefCell<dyn CycleBasedStatemachine>>,
        cycle_period: Integer,
    ) -> () {
        let data: TaskData = TaskData::with_cycle_based(statemachine, cycle_period);
        self.set_generic_timer(data);
    }

    pub fn unset_runcycle_time_for(
        &mut self,
        statemachine: Weak<RefCell<dyn CycleBasedStatemachine>>,
    ) -> () {
        let matcher: TimerTaskMatcher = TimerTaskMatcher::MatchRunCycleOf(statemachine);
        self.unset_generic_timer(matcher);
    }

    pub fn proceed(&mut self, elapsed_ms: Integer) -> () {
        if self.next_active_task >= self.tasks.deref().len() {
            return;
        }
        let time_till_next_task = self.time_till_next_task();
        let mut time_to_proceed: Integer = cmp::min(time_till_next_task, elapsed_ms);
        let mut proceed_time: Integer = 0;
        while time_to_proceed > 0 {
            let mut idx: usize = self.next_active_task;
            while idx < self.tasks.deref().len() {
                let mut current_task = self.tasks.deref()[idx].borrow_mut();
                current_task
                    .deref_mut()
                    .update_elapsed_time_ms(time_to_proceed);
                idx = (*current_task).next_task_idx;
            }

            let mut task_fired: bool;
            loop {
                task_fired = false;
                let mut before_best: usize = self.tasks.deref().len();
                let mut best: usize = self.next_active_task;
                let mut best_remaining_time: i32;
                let mut last_task: usize = best;
                let mut next_task: usize;

                {
                    let current_best_task = self.tasks.deref()[best].borrow();
                    best_remaining_time = match &current_best_task.deref().data.task {
                        Task::Empty() => 0,
                        Task::Runcycle(_run_cycle_handle, time_ms) => {
                            time_ms - current_best_task.deref().elapsed_time_ms
                        }
                        Task::TimeEvent(_time_event_handle, _pt_evid, time_ms, _periodic) => {
                            time_ms - current_best_task.deref().elapsed_time_ms
                        }
                    };
                    next_task = current_best_task.deref().next_task_idx;
                }

                while next_task < self.tasks.deref().len() {
                    //TODO .into
                    let current_task = self.tasks.deref()[next_task].borrow(); //T and U do not need clone, only Task
                    let remaining_time: Integer = match &current_task.deref().data.task {
                        Task::Empty() => 0,
                        Task::Runcycle(_run_cycle_handle, time_ms) => {
                            time_ms - current_task.deref().elapsed_time_ms
                        }
                        Task::TimeEvent(_time_event_handle, _pt_evid, time_ms, _periodic) => {
                            time_ms - current_task.deref().elapsed_time_ms
                        }
                    };
                    let best_task = self.tasks.deref()[best].borrow();
                    if remaining_time < best_remaining_time
                        || (remaining_time == best_remaining_time
                            && !(best_task.deref() < current_task.deref()))
                    {
                        best = next_task;
                        before_best = last_task;
                        best_remaining_time = remaining_time;
                    }
                    last_task = next_task;
                    next_task = current_task.next_task_idx;
                }

                //</>
                if best_remaining_time <= 0 {
                    let len = self.tasks.deref().len();
                    //TODO check if following code for splitting array and using both slices works for before_best == best
                    let (left, right) = self.tasks.deref().split_at(before_best);
                    let mut array_index_offset = 0;
                    let (mut best_task, rest) = if before_best < best {
                        array_index_offset = 0;
                        (right[best].borrow_mut(), left)
                    } else {
                        array_index_offset = before_best;
                        (left[best].borrow_mut(), right)
                    };

                    let mut data: TaskData = TaskData {
                        task: best_task.deref().data.task.clone(),
                    };
                    if best_task.deref().is_periodic() {
                        // reset periodic time
                        best_task.deref_mut().elapsed_time_ms = 0;
                    } else {
                        // remove the task
                        best_task.deref_mut().reset();
                        if before_best < len {
                            let mut before_best_task =
                                rest[before_best - array_index_offset].borrow_mut(); //TODO: we do not know, which part of the array we get, but need to ensure the correct index(decrease index if right side)
                            before_best_task.deref_mut().next_task_idx =
                                best_task.deref().next_task_idx;
                        } else {
                            // remove head
                            self.next_active_task = best_task.deref().next_task_idx;
                        }
                        best_task.deref_mut().next_task_idx = self.next_free_task;
                        self.next_free_task = best;
                    }

                    // execute the task
                    data.execute();
                    task_fired = true;
                }
                if !(task_fired && self.next_active_task < self.tasks.deref().len()) {
                    break;
                }
            }

            proceed_time += time_to_proceed;
            time_to_proceed = min(self.time_till_next_task(), elapsed_ms - proceed_time);
        }
    }

    pub fn cancel(&mut self) -> () {
        for idx in 0..self.tasks.deref().len() {
            self.tasks.deref()[idx].borrow_mut().deref_mut().reset();
            self.tasks.deref()[idx]
                .borrow_mut()
                .deref_mut()
                .next_task_idx = idx + 1;
        }
        self.next_active_task = self.tasks.deref().len();
        self.next_free_task = 0;
    }

    pub fn time_till_next_task(&self) -> Integer {
        //if there is no next active task:
        if self.next_active_task == self.tasks.deref().len() {
            return -1;
        }
        let next_active_task_borrowed = self.tasks.deref()[self.next_active_task].borrow();
        //time > 0: time until task is scheduled
        //time < 0: overtime since task was scheduled. Task must happen now
        let mut time: Integer = match next_active_task_borrowed.deref().data.task {
            Task::Empty() => 0,
            Task::Runcycle(ref _run_cycle_handle, time_ms) => {
                time_ms - next_active_task_borrowed.deref().elapsed_time_ms
            }
            Task::TimeEvent(ref _time_event_handle, _pt_evid, time_ms, _periodic) => {
                time_ms - next_active_task_borrowed.deref().elapsed_time_ms
            }
        };
        let mut task_id: usize = next_active_task_borrowed.deref().next_task_idx;
        while task_id < self.tasks.deref().len() {
            let current_task = self.tasks.deref()[task_id].borrow();
            let remaining_time: Integer = match current_task.deref().data.task {
                Task::Empty() => 0,
                Task::Runcycle(ref _run_cycle_handle, time_ms) => {
                    time_ms - current_task.deref().elapsed_time_ms
                }
                Task::TimeEvent(ref _time_event_handle, _pt_evid, time_ms, _periodic) => {
                    time_ms - current_task.deref().elapsed_time_ms
                }
            };
            if remaining_time < time {
                time = remaining_time;
            }
            task_id = current_task.deref().next_task_idx;
        }
        return time;
    }

    pub fn set_generic_timer(&mut self, data: TaskData) -> () {
        // do nothing if there are no free slots
        if self.next_free_task >= self.tasks.deref().len() {
            return;
        }

        // Insert the task at the front
        let inserted_task_idx: usize = self.next_free_task;
        let mut inserted_task = self.tasks.deref()[inserted_task_idx].borrow_mut();
        inserted_task.deref_mut().data = data;
        self.next_free_task = inserted_task.deref().next_task_idx;
        inserted_task.deref_mut().next_task_idx = self.next_active_task;
        self.next_active_task = inserted_task_idx;
    }

    pub fn unset_generic_timer(&mut self, matcher: TimerTaskMatcher) -> () {
        let mut last_position: usize = self.tasks.deref().len();
        let mut next_position: usize = self.next_active_task;
        let len = self.tasks.deref().len();

        while next_position < len {
            let split = self.tasks.deref().split_at(next_position); //is split at mut in place? if copy, avoid!
            let mut current_task = split.1[next_position - next_position].borrow_mut();
            if matcher.matches(current_task.deref()) {
                current_task.deref_mut().reset();
                if last_position < len {
                    if last_position < next_position {
                        split.0[last_position]
                            .borrow_mut()
                            .deref_mut()
                            .next_task_idx = current_task.deref().next_task_idx;
                    } else {
                        split.1[last_position - next_position]
                            .borrow_mut()
                            .deref_mut()
                            .next_task_idx = current_task.deref().next_task_idx;
                    }
                } else {
                    self.next_active_task = current_task.deref().next_task_idx;
                }
                let current_position: usize = next_position;
                next_position = current_task.deref().next_task_idx;
                current_task.deref_mut().next_task_idx = self.next_free_task;
                self.next_free_task = current_position;
            } else {
                last_position = next_position;
                next_position = current_task.deref().next_task_idx;
            }
        }
    }
}

impl TimerServiceInterface for TimerService {
    fn set_timer(
        &mut self,
        statemachine: Weak<RefCell<dyn Timed>>,
        event: EventId,
        time_ms: Integer,
        is_periodic: bool,
    ) -> () {
        let data: TaskData = TaskData::with_timed(statemachine, event, time_ms, is_periodic);
        self.set_generic_timer(data);
    }

    fn unset_timer(&mut self, statemachine: Weak<RefCell<dyn Timed>>, event: EventId) -> () {
        let matcher: TimerTaskMatcher = TimerTaskMatcher::MatchTimeEvent(statemachine, event);
        self.unset_generic_timer(matcher);
    }
}

impl<'a> PartialOrd for TimerTask {
    fn partial_cmp(&self, other: &TimerTask) -> Option<std::cmp::Ordering> {
        if !self.is_run_cycle_event() && other.is_run_cycle_event() {
            Some(std::cmp::Ordering::Less)
        } else {
            Some(std::cmp::Ordering::Greater)
        }
    }
}

	

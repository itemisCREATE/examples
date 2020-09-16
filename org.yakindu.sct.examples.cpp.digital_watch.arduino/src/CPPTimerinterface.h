#ifndef SRC_CPPTIMERINTERFACE_H_
#define SRC_CPPTIMERINTERFACE_H_

#include "sc_timer.h"

#define MAX_TIMER 10

class TimerTask {

private:

	/* internal arguments of a timer task */
	sc_integer time_ms;
	sc_boolean periodic;
	sc_eventid pt_evid;
	sc_integer elapsed_time_ms = 0;
	sc::timer::TimedInterface* handle;

public:

	/* Constructor, which creates a new timer task */
	TimerTask(sc::timer::TimedInterface* statemachine, sc_eventid event, sc_integer time, sc_boolean isPeriodic){
		this->handle = statemachine;
		this->pt_evid = event;
		this->periodic = isPeriodic;
		this->time_ms = time;
	}

	/* Destructor */
	~TimerTask(){}

	/*! Getter and Setter functions. */
	sc_integer getTimeMs() const {
		return time_ms;
	}

	void setTimeMs(sc_integer timeMs) {
		time_ms = timeMs;
	}

	sc_integer getElapsedTimeMs() const {
		return elapsed_time_ms;
	}

	void updateElapsedTimeMs(sc_integer elapsedTimeMs = 0) {
		elapsed_time_ms += elapsedTimeMs;
	}

	void setElapsedTimeMs(sc_integer elapsedTimeMs = 0) {
		elapsed_time_ms = elapsedTimeMs;
	}

	sc_eventid getPtEvid() const {
		return pt_evid;
	}

	void setPtEvid(sc_eventid ptEvid) {
		pt_evid = ptEvid;
	}

	sc_boolean isPeriodic() const {
		return periodic;
	}

	void setPeriodic(sc_boolean periodic) {
		this->periodic = periodic;
	}

	const sc::timer::TimedInterface* getHandle() const {
		return handle;
	}
};

class CPPTimerInterface : public sc::timer::TimerServiceInterface{
private:
	TimerTask* tasks[MAX_TIMER];
public:

	/* Constructor */
	CPPTimerInterface(){
		for(int i = 0; i<MAX_TIMER;i++)
		{
			this->tasks[i] = sc_null;
		}
	}

	/* Destructor */
    virtual ~CPPTimerInterface()
    {
        cancel();
    }

    /*!
    	This function will be called for each time event that is relevant for a state when a state will be entered.
    	\param evid An unique identifier of the event.
    	\time_ms The time in milli seconds
    	\periodic Indicates the the time event must be raised periodically until the timer is unset
    */
    virtual void setTimer(sc::timer::TimedInterface* statemachine, sc_eventid event, sc_integer time_ms, sc_boolean isPeriodic);

    /*!
    	This function will be called for each time event that is relevant for a state when a state will be left.
    	\param evid An unique identifier of the event.
    */
    virtual void unsetTimer(sc::timer::TimedInterface* statemachine, sc_eventid event);

    /*!
    	This function must be called by the user. The elapsed time must be calculated every time, the function gets
    	gets called.
     */
    void updateActiveTimer(sc::timer::TimedInterface* statemachine,
    		long elapsed_ms);

    /* ! Cancel timer service. */
    virtual void cancel();
};


#endif /* SRC_CPPTIMERINTERFACE_H_ */

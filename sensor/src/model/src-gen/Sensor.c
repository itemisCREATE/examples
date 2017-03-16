
#include <stdlib.h>
#include <string.h>
#include "../src/sc_types.h"
#include "Sensor.h"
/*! \file Implementation of the state machine 'sensor'
*/

/* prototypes of all internal functions */
static void sensor_react_main_region_measure_distance(Sensor* handle);
static void sensor_react_main_region_calc_mean(Sensor* handle);
static void sensor_react_main_region_calc_stddev(Sensor* handle);
static void sensor_react_main_region_wait(Sensor* handle);
static void sensor_react_main_region__choice_0(Sensor* handle);
static void sensor_clearInEvents(Sensor* handle);
static void sensor_clearOutEvents(Sensor* handle);


void sensor_init(Sensor* handle)
{
	sc_integer i;

	for (i = 0; i < SENSOR_MAX_ORTHOGONAL_STATES; ++i)
	{
		handle->stateConfVector[i] = Sensor_last_state;
	}
	
	
	handle->stateConfVectorPosition = 0;

	sensor_clearInEvents(handle);
	sensor_clearOutEvents(handle);

	/* Default init sequence for statechart sensor */
	handle->ifaceStddev.sum = 0.0;
	handle->ifaceStddev.mean = 0.0;
	handle->ifaceStddev.sd = 0.0;
	handle->ifaceSensor.val = 0;
	handle->internal.index = 0;

}

void sensor_enter(Sensor* handle)
{
	/* Default enter sequence for statechart sensor */
	/* 'default' enter sequence for region main region */
	/* Default react sequence for initial entry  */
	/* 'default' enter sequence for state wait */
	handle->stateConfVector[0] = Sensor_main_region_wait;
	handle->stateConfVectorPosition = 0;
}

void sensor_exit(Sensor* handle)
{
	/* Default exit sequence for statechart sensor */
	/* Default exit sequence for region main region */
	/* Handle exit of all possible states (of sensor.main_region) at position 0... */
	switch(handle->stateConfVector[ 0 ])
	{
		case Sensor_main_region_measure_distance :
		{
			/* Default exit sequence for state measure_distance */
			handle->stateConfVector[0] = Sensor_last_state;
			handle->stateConfVectorPosition = 0;
			break;
		}
		case Sensor_main_region_calc_mean :
		{
			/* Default exit sequence for state calc_mean */
			handle->stateConfVector[0] = Sensor_last_state;
			handle->stateConfVectorPosition = 0;
			break;
		}
		case Sensor_main_region_calc_stddev :
		{
			/* Default exit sequence for state calc_stddev */
			handle->stateConfVector[0] = Sensor_last_state;
			handle->stateConfVectorPosition = 0;
			/* Exit action for state 'calc_stddev'. */
			handle->ifaceStddev.sd = root(handle->ifaceStddev.sd);
			break;
		}
		case Sensor_main_region_wait :
		{
			/* Default exit sequence for state wait */
			handle->stateConfVector[0] = Sensor_last_state;
			handle->stateConfVectorPosition = 0;
			break;
		}
		default: break;
	}
}

sc_boolean sensor_isActive(const Sensor* handle)
{
	sc_boolean result;
	if (handle->stateConfVector[0] != Sensor_last_state)
	{
		result =  bool_true;
	}
	else
	{
		result = bool_false;
	}
	return result;
}

/* 
 * Always returns 'false' since this state machine can never become final.
 */
sc_boolean sensor_isFinal(const Sensor* handle)
{
   return bool_false;
}

static void sensor_clearInEvents(Sensor* handle)
{
	handle->ifaceSensor.measure_raised = bool_false;
}

static void sensor_clearOutEvents(Sensor* handle)
{
	handle->ifaceSensor.done_raised = bool_false;
	handle->ifaceSensor.error_raised = bool_false;
}

void sensor_runCycle(Sensor* handle)
{
	
	sensor_clearOutEvents(handle);
	
	for (handle->stateConfVectorPosition = 0;
		handle->stateConfVectorPosition < SENSOR_MAX_ORTHOGONAL_STATES;
		handle->stateConfVectorPosition++)
		{
			
		switch (handle->stateConfVector[handle->stateConfVectorPosition])
		{
		case Sensor_main_region_measure_distance :
		{
			sensor_react_main_region_measure_distance(handle);
			break;
		}
		case Sensor_main_region_calc_mean :
		{
			sensor_react_main_region_calc_mean(handle);
			break;
		}
		case Sensor_main_region_calc_stddev :
		{
			sensor_react_main_region_calc_stddev(handle);
			break;
		}
		case Sensor_main_region_wait :
		{
			sensor_react_main_region_wait(handle);
			break;
		}
		default:
			break;
		}
	}
	
	sensor_clearInEvents(handle);
}


sc_boolean sensor_isStateActive(const Sensor* handle, SensorStates state)
{
	sc_boolean result = bool_false;
	switch (state)
	{
		case Sensor_main_region_measure_distance :
			result = (sc_boolean) (handle->stateConfVector[0] == Sensor_main_region_measure_distance
			);
			break;
		case Sensor_main_region_calc_mean :
			result = (sc_boolean) (handle->stateConfVector[0] == Sensor_main_region_calc_mean
			);
			break;
		case Sensor_main_region_calc_stddev :
			result = (sc_boolean) (handle->stateConfVector[0] == Sensor_main_region_calc_stddev
			);
			break;
		case Sensor_main_region_wait :
			result = (sc_boolean) (handle->stateConfVector[0] == Sensor_main_region_wait
			);
			break;
		default:
			result = bool_false;
			break;
	}
	return result;
}



float sensorIfaceStddev_get_sum(const Sensor* handle)
{
	return handle->ifaceStddev.sum;
}
void sensorIfaceStddev_set_sum(Sensor* handle, float value)
{
	handle->ifaceStddev.sum = value;
}
float sensorIfaceStddev_get_mean(const Sensor* handle)
{
	return handle->ifaceStddev.mean;
}
void sensorIfaceStddev_set_mean(Sensor* handle, float value)
{
	handle->ifaceStddev.mean = value;
}
float sensorIfaceStddev_get_sd(const Sensor* handle)
{
	return handle->ifaceStddev.sd;
}
void sensorIfaceStddev_set_sd(Sensor* handle, float value)
{
	handle->ifaceStddev.sd = value;
}
void sensorIfaceSensor_raise_measure(Sensor* handle)
{
	handle->ifaceSensor.measure_raised = bool_true;
}

sc_boolean sensorIfaceSensor_israised_done(const Sensor* handle)
{
	return handle->ifaceSensor.done_raised;
}
sc_boolean sensorIfaceSensor_israised_error(const Sensor* handle)
{
	return handle->ifaceSensor.error_raised;
}

uint8_t sensorIfaceSensor_get_val(const Sensor* handle)
{
	return handle->ifaceSensor.val;
}
void sensorIfaceSensor_set_val(Sensor* handle, uint8_t value)
{
	handle->ifaceSensor.val = value;
}

/* implementations of all internal functions */

/* The reactions of state measure_distance. */
static void sensor_react_main_region_measure_distance(Sensor* handle)
{
	/* The reactions of state measure_distance. */
	if ((handle->internal.index == ARRAY_SIZE) ? bool_true : bool_false == bool_true)
	{ 
		/* Default exit sequence for state measure_distance */
		handle->stateConfVector[0] = Sensor_last_state;
		handle->stateConfVectorPosition = 0;
		/* 'default' enter sequence for state calc_mean */
		/* Entry action for state 'calc_mean'. */
		handle->ifaceStddev.mean = 0;
		handle->ifaceStddev.sum = calc_array_sum(values, ARRAY_SIZE);
		handle->ifaceStddev.mean = handle->ifaceStddev.sum / ARRAY_SIZE;
		handle->stateConfVector[0] = Sensor_main_region_calc_mean;
		handle->stateConfVectorPosition = 0;
	}  else
	{
		if ((handle->internal.index < ARRAY_SIZE) ? bool_true : bool_false == bool_true)
		{ 
			values[handle->internal.index] = get_sensor_measurement();
			handle->internal.index += 1;
		} 
	}
}

/* The reactions of state calc_mean. */
static void sensor_react_main_region_calc_mean(Sensor* handle)
{
	/* The reactions of state calc_mean. */
	/* Default exit sequence for state calc_mean */
	handle->stateConfVector[0] = Sensor_last_state;
	handle->stateConfVectorPosition = 0;
	/* 'default' enter sequence for state calc_stddev */
	/* Entry action for state 'calc_stddev'. */
	handle->internal.index = 0;
	handle->ifaceStddev.sd = 0;
	handle->stateConfVector[0] = Sensor_main_region_calc_stddev;
	handle->stateConfVectorPosition = 0;
}

/* The reactions of state calc_stddev. */
static void sensor_react_main_region_calc_stddev(Sensor* handle)
{
	/* The reactions of state calc_stddev. */
	if ((handle->internal.index == ARRAY_SIZE) ? bool_true : bool_false == bool_true)
	{ 
		/* Default exit sequence for state calc_stddev */
		handle->stateConfVector[0] = Sensor_last_state;
		handle->stateConfVectorPosition = 0;
		/* Exit action for state 'calc_stddev'. */
		handle->ifaceStddev.sd = root(handle->ifaceStddev.sd);
		sensor_react_main_region__choice_0(handle);
	}  else
	{
		if ((handle->internal.index < ARRAY_SIZE) ? bool_true : bool_false == bool_true)
		{ 
			handle->ifaceStddev.sd += square(values[handle->internal.index] - handle->ifaceStddev.mean);
			handle->internal.index += 1;
		} 
	}
}

/* The reactions of state wait. */
static void sensor_react_main_region_wait(Sensor* handle)
{
	/* The reactions of state wait. */
	if (handle->ifaceSensor.measure_raised == bool_true)
	{ 
		/* Default exit sequence for state wait */
		handle->stateConfVector[0] = Sensor_last_state;
		handle->stateConfVectorPosition = 0;
		/* 'default' enter sequence for state measure_distance */
		/* Entry action for state 'measure_distance'. */
		handle->internal.index = 0;
		init_sensor();
		handle->stateConfVector[0] = Sensor_main_region_measure_distance;
		handle->stateConfVectorPosition = 0;
	} 
}

/* The reactions of state null. */
static void sensor_react_main_region__choice_0(Sensor* handle)
{
	/* The reactions of state null. */
	if ((handle->ifaceStddev.sd > 3) ? bool_true : bool_false == bool_true)
	{ 
		handle->ifaceSensor.val = 0;
		handle->ifaceSensor.error_raised = bool_true;
		/* 'default' enter sequence for state wait */
		handle->stateConfVector[0] = Sensor_main_region_wait;
		handle->stateConfVectorPosition = 0;
	}  else
	{
		handle->ifaceSensor.val = ((uint8_t) handle->ifaceStddev.mean);
		handle->ifaceSensor.done_raised = bool_true;
		/* 'default' enter sequence for state wait */
		handle->stateConfVector[0] = Sensor_main_region_wait;
		handle->stateConfVectorPosition = 0;
	}
}



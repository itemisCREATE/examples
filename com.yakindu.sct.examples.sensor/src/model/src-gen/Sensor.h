
#ifndef SENSOR_H_
#define SENSOR_H_

#include "../src/sc_types.h"
#include "../../sensor_utils.h"
		
#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'sensor'.
*/

/*! Enumeration of all states */ 
typedef enum
{
	Sensor_main_region_measure_distance,
	Sensor_main_region_calc_mean,
	Sensor_main_region_calc_stddev,
	Sensor_main_region_wait,
	Sensor_last_state
} SensorStates;

/*! Type definition of the data structure for the SensorIfaceStddev interface scope. */
typedef struct
{
	float sum;
	float mean;
	float sd;
} SensorIfaceStddev;

/*! Type definition of the data structure for the SensorIfaceSensor interface scope. */
typedef struct
{
	sc_boolean measure_raised;
	sc_boolean done_raised;
	sc_boolean error_raised;
	uint8_t val;
} SensorIfaceSensor;

/*! Type definition of the data structure for the SensorInternal interface scope. */
typedef struct
{
	uint8_t index;
} SensorInternal;


/*! Define dimension of the state configuration vector for orthogonal states. */
#define SENSOR_MAX_ORTHOGONAL_STATES 1

/*! 
 * Type definition of the data structure for the Sensor state machine.
 * This data structure has to be allocated by the client code. 
 */
typedef struct
{
	SensorStates stateConfVector[SENSOR_MAX_ORTHOGONAL_STATES];
	sc_ushort stateConfVectorPosition; 
	
	SensorIfaceStddev ifaceStddev;
	SensorIfaceSensor ifaceSensor;
	SensorInternal internal;
} Sensor;

/*! Initializes the Sensor state machine data structures. Must be called before first usage.*/
extern void sensor_init(Sensor* handle);

/*! Activates the state machine */
extern void sensor_enter(Sensor* handle);

/*! Deactivates the state machine */
extern void sensor_exit(Sensor* handle);

/*! Performs a 'run to completion' step. */
extern void sensor_runCycle(Sensor* handle);


/*! Gets the value of the variable 'sum' that is defined in the interface scope 'stddev'. */ 
extern float sensorIfaceStddev_get_sum(const Sensor* handle);
/*! Sets the value of the variable 'sum' that is defined in the interface scope 'stddev'. */ 
extern void sensorIfaceStddev_set_sum(Sensor* handle, float value);
/*! Gets the value of the variable 'mean' that is defined in the interface scope 'stddev'. */ 
extern float sensorIfaceStddev_get_mean(const Sensor* handle);
/*! Sets the value of the variable 'mean' that is defined in the interface scope 'stddev'. */ 
extern void sensorIfaceStddev_set_mean(Sensor* handle, float value);
/*! Gets the value of the variable 'sd' that is defined in the interface scope 'stddev'. */ 
extern float sensorIfaceStddev_get_sd(const Sensor* handle);
/*! Sets the value of the variable 'sd' that is defined in the interface scope 'stddev'. */ 
extern void sensorIfaceStddev_set_sd(Sensor* handle, float value);
/*! Raises the in event 'measure' that is defined in the interface scope 'sensor'. */ 
extern void sensorIfaceSensor_raise_measure(Sensor* handle);

/*! Checks if the out event 'done' that is defined in the interface scope 'sensor' has been raised. */ 
extern sc_boolean sensorIfaceSensor_israised_done(const Sensor* handle);

/*! Checks if the out event 'error' that is defined in the interface scope 'sensor' has been raised. */ 
extern sc_boolean sensorIfaceSensor_israised_error(const Sensor* handle);

/*! Gets the value of the variable 'val' that is defined in the interface scope 'sensor'. */ 
extern uint8_t sensorIfaceSensor_get_val(const Sensor* handle);
/*! Sets the value of the variable 'val' that is defined in the interface scope 'sensor'. */ 
extern void sensorIfaceSensor_set_val(Sensor* handle, uint8_t value);

/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean sensor_isActive(const Sensor* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean sensor_isFinal(const Sensor* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean sensor_isStateActive(const Sensor* handle, SensorStates state);

#ifdef __cplusplus
}
#endif 

#endif /* SENSOR_H_ */

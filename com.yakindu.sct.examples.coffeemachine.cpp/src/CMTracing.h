/*
 * CMTracing.h
 *
 *  Created on: Sep 18, 2020
 *      Author: rherrmann
 */

#ifndef SRC_CMTRACING_H_
#define SRC_CMTRACING_H_

#include "../src-gen/CoffeeMachineCpp.h"

class CMTracing: public sc::trace::TraceObserver<
		CoffeeMachineCpp::CoffeeMachineCppStates> {
public:
	CMTracing();
	virtual ~CMTracing();
	void stateEntered(CoffeeMachineCpp::CoffeeMachineCppStates state);
	void stateExited(CoffeeMachineCpp::CoffeeMachineCppStates state);
	bool cm_trace_active = true;
	std::string stateNames[12] = { //
			"CoffeeMachineCpp_last_state",
			"main_Off",
			"main_On",
			"main_On_r_Heating_Up",
			"main_On_r_Wait_For_Choice",
			"main_On_r_Save_Energy",
			"main_On_r_Process_Recipe",
			"main_On_r_Process_Recipe_r_Make_Coffee",
			"main_On_r_Process_Recipe_r_Make_Coffee_r_Milling_Beans",
			"main_On_r_Process_Recipe_r_Make_Coffee_r_Brew_Coffee",
			"main_On_r_Process_Recipe_r_Make_Milk",
			"main_On_r_Process_Recipe_r_Make_Milk_r_Make_Steam"
			};
};

#endif /* SRC_CMTRACING_H_ */

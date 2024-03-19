################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../implementation/machine/TrafficLightStateMachine.cpp \
../implementation/machine/sc_qt_timerservice.cpp 

CPP_DEPS += \
./implementation/machine/TrafficLightStateMachine.d \
./implementation/machine/sc_qt_timerservice.d 

OBJS += \
./implementation/machine/TrafficLightStateMachine.o \
./implementation/machine/sc_qt_timerservice.o 


# Each subdirectory must supply rules for building sources it contributes
implementation/machine/%.o: ../implementation/machine/%.cpp implementation/machine/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-implementation-2f-machine

clean-implementation-2f-machine:
	-$(RM) ./implementation/machine/TrafficLightStateMachine.d ./implementation/machine/TrafficLightStateMachine.o ./implementation/machine/sc_qt_timerservice.d ./implementation/machine/sc_qt_timerservice.o

.PHONY: clean-implementation-2f-machine


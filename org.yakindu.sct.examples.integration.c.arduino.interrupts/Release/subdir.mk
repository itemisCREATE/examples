################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../sloeber.ino.cpp 

LINK_OBJ += \
./sloeber.ino.cpp.o 

CPP_DEPS += \
./sloeber.ino.cpp.d 


# Each subdirectory must supply rules for building sources it contributes
sloeber.ino.cpp.o: ../sloeber.ino.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	-I"/home/administrator/Downloads/yakindu-sct/arduinoPlugin/packages/arduino/hardware/avr/1.8.1/cores/arduino" -I"/home/administrator/Downloads/yakindu-sct/arduinoPlugin/packages/arduino/hardware/avr/1.8.1/variants/mega" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  "$@"

	@echo 'Finished building: $<'
	@echo ' '



################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src-gen/Controller.c \
../src-gen/Heater.c 

OBJS += \
./src-gen/Controller.o \
./src-gen/Heater.o 

C_DEPS += \
./src-gen/Controller.d \
./src-gen/Heater.d 


# Each subdirectory must supply rules for building sources it contributes
src-gen/%.o: ../src-gen/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



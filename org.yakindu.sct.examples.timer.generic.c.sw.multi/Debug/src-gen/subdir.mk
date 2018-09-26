################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src-gen/TimedStatemachine.c \
../src-gen/TimedStatemachine2.c 

OBJS += \
./src-gen/TimedStatemachine.o \
./src-gen/TimedStatemachine2.o 

C_DEPS += \
./src-gen/TimedStatemachine.d \
./src-gen/TimedStatemachine2.d 


# Each subdirectory must supply rules for building sources it contributes
src-gen/%.o: ../src-gen/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



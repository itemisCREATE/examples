################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src-gen/StateMachine.c 

C_DEPS += \
./src-gen/StateMachine.c.d 

LINK_OBJ += \
./src-gen/StateMachine.c.o 


# Each subdirectory must supply rules for building sources it contributes
src-gen/StateMachine.c.o: ../src-gen/StateMachine.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	-MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  "$@"
	@echo 'Finished building: $<'
	@echo ' '



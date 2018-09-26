################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/main.c \
../src/sc_cycle_runner.c \
../src/sc_pthread_timer_service.c 

OBJS += \
./src/main.o \
./src/sc_cycle_runner.o \
./src/sc_pthread_timer_service.o 

C_DEPS += \
./src/main.d \
./src/sc_cycle_runner.d \
./src/sc_pthread_timer_service.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



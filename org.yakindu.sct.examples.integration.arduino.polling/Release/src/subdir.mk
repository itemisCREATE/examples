################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/hw_impl.c \
../src/sc_timer_service.c \
../src/timer_impl.c 

C_DEPS += \
./src/hw_impl.c.d \
./src/sc_timer_service.c.d \
./src/timer_impl.c.d 

LINK_OBJ += \
./src/hw_impl.c.o \
./src/sc_timer_service.c.o \
./src/timer_impl.c.o 


# Each subdirectory must supply rules for building sources it contributes
src/hw_impl.c.o: ../src/hw_impl.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	-MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  "$@"
	@echo 'Finished building: $<'
	@echo ' '

src/sc_timer_service.c.o: ../src/sc_timer_service.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	-MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  "$@"
	@echo 'Finished building: $<'
	@echo ' '

src/timer_impl.c.o: ../src/timer_impl.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	-MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  "$@"
	@echo 'Finished building: $<'
	@echo ' '



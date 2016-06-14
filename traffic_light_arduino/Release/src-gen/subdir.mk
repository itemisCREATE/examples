################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src-gen/TrafficLightCtrl.c 

C_DEPS += \
./src-gen/TrafficLightCtrl.c.d 

LINK_OBJ += \
./src-gen/TrafficLightCtrl.c.o 


# Each subdirectory must supply rules for building sources it contributes
src-gen/TrafficLightCtrl.c.o: ../src-gen/TrafficLightCtrl.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\Users\Rene Beckmann\yakindu-sct\arduinoPlugin\tools\arduino\avr-gcc\4.8.1-arduino5/bin/avr-gcc" -c -g -Os -std=gnu11 -ffunction-sections -fdata-sections -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10606 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR     -I"C:\Users\Rene Beckmann\yakindu-sct\arduinoPlugin\packages\arduino\hardware\avr\1.6.11\cores\arduino" -I"C:\Users\Rene Beckmann\yakindu-sct\arduinoPlugin\packages\arduino\hardware\avr\1.6.11\variants\standard" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"   -Wall
	@echo 'Finished building: $<'
	@echo ' '



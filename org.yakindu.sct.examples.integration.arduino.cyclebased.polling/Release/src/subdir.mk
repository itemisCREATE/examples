################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/hardwareImplementation.c \
../src/sc_timer_service.c \
../src/timerImplementation.c 

C_DEPS += \
./src/hardwareImplementation.c.d \
./src/sc_timer_service.c.d \
./src/timerImplementation.c.d 

LINK_OBJ += \
./src/hardwareImplementation.c.o \
./src/sc_timer_service.c.o \
./src/timerImplementation.c.o 


# Each subdirectory must supply rules for building sources it contributes
src/hardwareImplementation.c.o: ../src/hardwareImplementation.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"/home/administrator/Downloads/yakindu-sct//arduinoPlugin/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"/home/administrator/Downloads/yakindu-sct/arduinoPlugin/packages/arduino/hardware/avr/1.8.1/cores/arduino" -I"/home/administrator/Downloads/yakindu-sct/arduinoPlugin/packages/arduino/hardware/avr/1.8.1/variants/mega" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

src/sc_timer_service.c.o: ../src/sc_timer_service.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"/home/administrator/Downloads/yakindu-sct//arduinoPlugin/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"/home/administrator/Downloads/yakindu-sct/arduinoPlugin/packages/arduino/hardware/avr/1.8.1/cores/arduino" -I"/home/administrator/Downloads/yakindu-sct/arduinoPlugin/packages/arduino/hardware/avr/1.8.1/variants/mega" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

src/timerImplementation.c.o: ../src/timerImplementation.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"/home/administrator/Downloads/yakindu-sct//arduinoPlugin/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"/home/administrator/Downloads/yakindu-sct/arduinoPlugin/packages/arduino/hardware/avr/1.8.1/cores/arduino" -I"/home/administrator/Downloads/yakindu-sct/arduinoPlugin/packages/arduino/hardware/avr/1.8.1/variants/mega" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '



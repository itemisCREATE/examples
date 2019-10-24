################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
..\src\hw_impl.c \
..\src\sc_timer_service.c \
..\src\timer_impl.c 

C_DEPS += \
.\src\hw_impl.c.d \
.\src\sc_timer_service.c.d \
.\src\timer_impl.c.d 

LINK_OBJ += \
.\src\hw_impl.c.o \
.\src\sc_timer_service.c.o \
.\src\timer_impl.c.o 


# Each subdirectory must supply rules for building sources it contributes
src\hw_impl.c.o: ..\src\hw_impl.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

src\sc_timer_service.c.o: ..\src\sc_timer_service.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

src\timer_impl.c.o: ..\src\timer_impl.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '



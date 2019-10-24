################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\variantHooks.cpp 

C_SRCS += \
C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\croutine.c \
C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\event_groups.c \
C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\heap_3.c \
C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\list.c \
C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\port.c \
C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\queue.c \
C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\stream_buffer.c \
C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\tasks.c \
C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\timers.c 

C_DEPS += \
.\libraries\FreeRTOS\src\croutine.c.d \
.\libraries\FreeRTOS\src\event_groups.c.d \
.\libraries\FreeRTOS\src\heap_3.c.d \
.\libraries\FreeRTOS\src\list.c.d \
.\libraries\FreeRTOS\src\port.c.d \
.\libraries\FreeRTOS\src\queue.c.d \
.\libraries\FreeRTOS\src\stream_buffer.c.d \
.\libraries\FreeRTOS\src\tasks.c.d \
.\libraries\FreeRTOS\src\timers.c.d 

LINK_OBJ += \
.\libraries\FreeRTOS\src\croutine.c.o \
.\libraries\FreeRTOS\src\event_groups.c.o \
.\libraries\FreeRTOS\src\heap_3.c.o \
.\libraries\FreeRTOS\src\list.c.o \
.\libraries\FreeRTOS\src\port.c.o \
.\libraries\FreeRTOS\src\queue.c.o \
.\libraries\FreeRTOS\src\stream_buffer.c.o \
.\libraries\FreeRTOS\src\tasks.c.o \
.\libraries\FreeRTOS\src\timers.c.o \
.\libraries\FreeRTOS\src\variantHooks.cpp.o 

CPP_DEPS += \
.\libraries\FreeRTOS\src\variantHooks.cpp.d 


# Each subdirectory must supply rules for building sources it contributes
libraries\FreeRTOS\src\croutine.c.o: C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\croutine.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries\FreeRTOS\src\event_groups.c.o: C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\event_groups.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries\FreeRTOS\src\heap_3.c.o: C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\heap_3.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries\FreeRTOS\src\list.c.o: C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\list.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries\FreeRTOS\src\port.c.o: C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\port.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries\FreeRTOS\src\queue.c.o: C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\queue.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries\FreeRTOS\src\stream_buffer.c.o: C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\stream_buffer.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries\FreeRTOS\src\tasks.c.o: C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\tasks.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries\FreeRTOS\src\timers.c.o: C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\timers.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

libraries\FreeRTOS\src\variantHooks.cpp.o: C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src\variantHooks.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '



################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\CDC.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\HardwareSerial.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\HardwareSerial0.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\HardwareSerial1.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\HardwareSerial2.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\HardwareSerial3.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\IPAddress.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\PluggableUSB.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\Print.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\Stream.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\Tone.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\USBCore.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\WMath.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\WString.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\abi.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\main.cpp \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\new.cpp 

S_UPPER_SRCS += \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\wiring_pulse.S 

C_SRCS += \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\WInterrupts.c \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\hooks.c \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\wiring.c \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\wiring_analog.c \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\wiring_digital.c \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\wiring_pulse.c \
C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\wiring_shift.c 

C_DEPS += \
.\core\core\WInterrupts.c.d \
.\core\core\hooks.c.d \
.\core\core\wiring.c.d \
.\core\core\wiring_analog.c.d \
.\core\core\wiring_digital.c.d \
.\core\core\wiring_pulse.c.d \
.\core\core\wiring_shift.c.d 

AR_OBJ += \
.\core\core\CDC.cpp.o \
.\core\core\HardwareSerial.cpp.o \
.\core\core\HardwareSerial0.cpp.o \
.\core\core\HardwareSerial1.cpp.o \
.\core\core\HardwareSerial2.cpp.o \
.\core\core\HardwareSerial3.cpp.o \
.\core\core\IPAddress.cpp.o \
.\core\core\PluggableUSB.cpp.o \
.\core\core\Print.cpp.o \
.\core\core\Stream.cpp.o \
.\core\core\Tone.cpp.o \
.\core\core\USBCore.cpp.o \
.\core\core\WInterrupts.c.o \
.\core\core\WMath.cpp.o \
.\core\core\WString.cpp.o \
.\core\core\abi.cpp.o \
.\core\core\hooks.c.o \
.\core\core\main.cpp.o \
.\core\core\new.cpp.o \
.\core\core\wiring.c.o \
.\core\core\wiring_analog.c.o \
.\core\core\wiring_digital.c.o \
.\core\core\wiring_pulse.S.o \
.\core\core\wiring_pulse.c.o \
.\core\core\wiring_shift.c.o 

S_UPPER_DEPS += \
.\core\core\wiring_pulse.S.d 

CPP_DEPS += \
.\core\core\CDC.cpp.d \
.\core\core\HardwareSerial.cpp.d \
.\core\core\HardwareSerial0.cpp.d \
.\core\core\HardwareSerial1.cpp.d \
.\core\core\HardwareSerial2.cpp.d \
.\core\core\HardwareSerial3.cpp.d \
.\core\core\IPAddress.cpp.d \
.\core\core\PluggableUSB.cpp.d \
.\core\core\Print.cpp.d \
.\core\core\Stream.cpp.d \
.\core\core\Tone.cpp.d \
.\core\core\USBCore.cpp.d \
.\core\core\WMath.cpp.d \
.\core\core\WString.cpp.d \
.\core\core\abi.cpp.d \
.\core\core\main.cpp.d \
.\core\core\new.cpp.d 


# Each subdirectory must supply rules for building sources it contributes
core\core\CDC.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\CDC.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\HardwareSerial.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\HardwareSerial.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\HardwareSerial0.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\HardwareSerial0.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\HardwareSerial1.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\HardwareSerial1.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\HardwareSerial2.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\HardwareSerial2.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\HardwareSerial3.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\HardwareSerial3.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\IPAddress.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\IPAddress.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\PluggableUSB.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\PluggableUSB.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\Print.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\Print.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\Stream.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\Stream.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\Tone.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\Tone.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\USBCore.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\USBCore.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\WInterrupts.c.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\WInterrupts.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\WMath.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\WMath.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\WString.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\WString.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\abi.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\abi.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\hooks.c.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\hooks.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\main.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\main.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\new.cpp.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\new.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\wiring.c.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\wiring.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\wiring_analog.c.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\wiring_analog.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\wiring_digital.c.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\wiring_digital.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\wiring_pulse.S.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\wiring_pulse.S
	@echo 'Building file: $<'
	@echo 'Starting S compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -x assembler-with-cpp -flto -MMD -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)"  "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\wiring_pulse.c.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\wiring_pulse.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

core\core\wiring_shift.c.o: C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino\wiring_shift.c
	@echo 'Building file: $<'
	@echo 'Starting C compile'
	"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino5/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\cores\arduino" -I"C:\yakindu-sctpro\arduinoPlugin\packages\arduino\hardware\avr\1.8.1\variants\mega" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\FreeRTOS\10.2.0-3\src" -I"C:\yakindu-sctpro\arduinoPlugin\libraries\StateMachine\1.0.11\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '



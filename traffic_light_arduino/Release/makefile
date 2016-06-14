################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -f

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include src-gen/subdir.mk
-include scutil/subdir.mk
-include core/core/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(INO_DEPS)),)
-include $(INO_DEPS)
endif
ifneq ($(strip $(PDE_DEPS)),)
-include $(PDE_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
AR += \
arduino.ar \

ELF += \
traffic_light_arduino.elf \

EEP += \
traffic_light_arduino.eep \

FLASH_IMAGE += \
traffic_light_arduino.hex \


# All Target
all: traffic_light_arduino

# Tool invocations
traffic_light_arduino: $(FLASH_IMAGE)
	@echo 'Building target: $@'
	@echo 'Printing size:'
	"C:\Users\Rene Beckmann\yakindu-sct\arduinoPlugin\tools\arduino\avr-gcc\4.8.1-arduino5/bin/avr-size" -A "C:/Users/Rene Beckmann/YAKINDU_SCT/ws/traffic_light_arduino/Release/traffic_light_arduino.elf"
	@echo 'Finished building target: $@'
	@echo ' '

arduino.ar: $(AR_OBJ)
	@echo 'Starting archiver'
	"C:\Users\Rene Beckmann\yakindu-sct\arduinoPlugin\tools\arduino\avr-gcc\4.8.1-arduino5/bin/avr-ar" rcs  "C:/Users/Rene Beckmann/YAKINDU_SCT/ws/traffic_light_arduino/Release/arduino.ar"    arduino.ar $(AR_OBJ)
	@echo 'Finished building: $@'
	@echo ' '

traffic_light_arduino.elf: $(LINK_OBJ) $(AR)
	@echo 'Starting combiner'
	"C:\Users\Rene Beckmann\yakindu-sct\arduinoPlugin\tools\arduino\avr-gcc\4.8.1-arduino5/bin/avr-gcc" -Os -Wl,--gc-sections -mmcu=atmega328p  -o "C:/Users/Rene Beckmann/YAKINDU_SCT/ws/traffic_light_arduino/Release/traffic_light_arduino.elf"   $(LINK_OBJ) $(AR)    "-LC:/Users/Rene Beckmann/YAKINDU_SCT/ws/traffic_light_arduino/Release" -lm
	@echo 'Finished building: $@'
	@echo ' '

traffic_light_arduino.eep: $(ELF)
	@echo 'Create eeprom image'
	"C:\Users\Rene Beckmann\yakindu-sct\arduinoPlugin\tools\arduino\avr-gcc\4.8.1-arduino5/bin/avr-objcopy" -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0  "C:/Users/Rene Beckmann/YAKINDU_SCT/ws/traffic_light_arduino/Release/traffic_light_arduino.elf" "C:/Users/Rene Beckmann/YAKINDU_SCT/ws/traffic_light_arduino/Release/traffic_light_arduino.eep"
	@echo 'Finished building: $@'
	@echo ' '

traffic_light_arduino.hex: $(EEP)
	@echo 'Create Flash image (ihex format)'
	"C:\Users\Rene Beckmann\yakindu-sct\arduinoPlugin\tools\arduino\avr-gcc\4.8.1-arduino5/bin/avr-objcopy" -O ihex -R .eeprom  "C:/Users/Rene Beckmann/YAKINDU_SCT/ws/traffic_light_arduino/Release/traffic_light_arduino.elf" "C:/Users/Rene Beckmann/YAKINDU_SCT/ws/traffic_light_arduino/Release/traffic_light_arduino.hex"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(C_UPPER_DEPS)$(PDE_DEPS)$(C_DEPS)$(AR)$(EEP)$(FLASH_IMAGE)$(CC_DEPS)$(AR_OBJ)$(C++_DEPS)$(LINK_OBJ)$(CXX_DEPS)$(ASM_DEPS)$(INO_DEPS)$(SIZEDUMMY)$(S_UPPER_DEPS)$(ELF)$(CPP_DEPS) traffic_light_arduino
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets

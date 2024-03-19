################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../implementation/main.cpp 

CPP_DEPS += \
./implementation/main.d 

OBJS += \
./implementation/main.o 


# Each subdirectory must supply rules for building sources it contributes
implementation/%.o: ../implementation/%.cpp implementation/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-implementation

clean-implementation:
	-$(RM) ./implementation/main.d ./implementation/main.o

.PHONY: clean-implementation


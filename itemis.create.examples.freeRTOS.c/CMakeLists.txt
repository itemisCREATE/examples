cmake_minimum_required(VERSION 3.20)

project( create_freeRTOS )

add_library( freertos_config INTERFACE )
target_include_directories( freertos_config
    INTERFACE
        ./
)

set( FREERTOS_HEAP "3" CACHE STRING "" FORCE)
set( FREERTOS_PORT "${COMPILER}" CACHE STRING "" FORCE)

add_subdirectory( "${FREE_RTOS_PATH}/FreeRTOS/Source" "${CMAKE_CURRENT_BINARY_DIR}/FreeRTOS-Kernel")

add_executable( create_freeRTOS
                src/main.c
                src-gen/LightSwitch.c
                src-gen/sc_rxc.c
                src-gen/sc_timer_service.c
              )

target_link_libraries( create_freeRTOS freertos_kernel freertos_config)

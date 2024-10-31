# CMakeLists.txt
cmake_minimum_required(VERSION 3.13.1)
find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(my_native_sim_project)

target_sources(
    app PRIVATE 
    src/main.c
    src-gen/LightSwitch.c
    src-gen/sc_rxc.c
    src-gen/sc_timer_service.c
)

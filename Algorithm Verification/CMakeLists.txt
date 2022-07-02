cmake_minimum_required(VERSION 3.1)

# set the project name
project(downsampler)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

# specify dir path 
# set(CMAKE_SOURCE_DIR src/)
set(CMAKE_BINARY_DIR ${PROJECT_SOURCE_DIR}/bin)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})


# headers
# set(HEADER_FILES 
#     ${CMAKE_SOURCE_DIR}/objectdetection.hpp
#     ${CMAKE_SOURCE_DIR}/serialcommunication.hpp 
# )

# OpenCV library
find_package(OpenCV REQUIRED)

# Linking WiringPi library in CMakeLists: https://forums.raspberrypi.com/viewtopic.php?t=185823#p1174011 
# find_library(wiringPi_LIB wiringPi)

# target
add_executable(downsampler 
	downsampler.cpp
    )

# external library
target_link_libraries(downsampler ${OpenCV_LIBS})
# target_link_libraries(detect_objects ${wiringPi_LIB})
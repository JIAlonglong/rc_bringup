cmake_minimum_required(VERSION 3.0.2)
project(rc_bringup)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

find_package(catkin REQUIRED)


catkin_package(
)

include_directories(
        # include
        ${catkin_INCLUDE_DIRS}
)

install(DIRECTORY scripts launch
        DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
        )
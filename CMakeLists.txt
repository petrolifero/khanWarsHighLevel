cmake_minimum_required(VERSION 3.19.3)
project(khanWars)
enable_testing()

find_package(Qt6 REQUIRED)

add_subdirectory(authentication)
add_subdirectory(api)
add_subdirectory(user)
add_subdirectory(console)
add_subdirectory(app)

add_executable(main main.cpp)

target_link_libraries(main PRIVATE app)

include(test.cmake)

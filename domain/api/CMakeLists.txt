add_library(api STATIC api.cpp)

target_link_libraries(api PUBLIC Qt6::Core)
target_link_libraries(api PUBLIC Qt6::Network)
target_link_libraries(api PUBLIC environmentVariableAuth)

target_include_directories(api PUBLIC .)

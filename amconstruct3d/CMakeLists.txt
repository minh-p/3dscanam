cmake_minimum_required(VERSION 3.14)
project(amconstruct3d)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(GTest REQUIRED)
enable_testing()

add_executable(unit_tests
    src/devenv.cpp
    tests/testenv_gtest.cpp
)

target_link_libraries(unit_tests
    PRIVATE
    GTest::gtest
    GTest::gtest_main
)

include(GoogleTest)

gtest_discover_tests(unit_tests)

target_include_directories(unit_tests PRIVATE include)

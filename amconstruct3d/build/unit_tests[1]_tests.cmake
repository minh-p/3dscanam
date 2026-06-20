add_test([=[HelloTest.ReturnZero]=]  /home/hmp/Projects/3dscanam/amconstruct3d/build/unit_tests [==[--gtest_filter=HelloTest.ReturnZero]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[HelloTest.ReturnZero]=]  PROPERTIES WORKING_DIRECTORY /home/hmp/Projects/3dscanam/amconstruct3d/build SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
set(  unit_tests_TESTS HelloTest.ReturnZero)

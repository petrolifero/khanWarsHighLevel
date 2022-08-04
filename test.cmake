add_test(NAME findUsernameAndPassword COMMAND main)
set(sucessTestEnv "KHANWARS_USERNAME=petrolifero" "KHANWARS_PASSWORD=123")
set_tests_properties(findUsernameAndPassword PROPERTIES ENVIRONMENT "${sucessTestEnv}")

add_test(NAME dontFindUsernameOrPassword COMMAND main)
set_tests_properties(dontFindUsernameOrPassword PROPERTIES WILL_FAIL true)

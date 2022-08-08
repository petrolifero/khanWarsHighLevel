#include <user.hpp>

user::user(environmentVariableAuth auth,khanWarsAPI&& api) : username(auth.username()),password(auth.password()),api(std::move(api)) {}

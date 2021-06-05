#include <cstdlib>

#include <environmentVariableAuth.hpp>

environmentVariableAuth::environmentVariableAuth() {
}

std::string environmentVariableAuth::username() {
  auto possibleUsername = std::getenv("KHANWARS_USERNAME");
  if( possibleUsername )
    return possibleUsername;
  else
    return "";
}

std::string environmentVariableAuth::password() {
  auto possiblePassword = std::getenv("KHANWARS_PASSWORD");
  if( possiblePassword )
    return possiblePassword;
  else
    return "";
}

bool environmentVariableAuth::isInvalid() {
  return username() == "" || password() == "";
}

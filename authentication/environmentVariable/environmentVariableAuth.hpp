#ifndef ENVIRONMENT_VARIABLE_AUTH_H
#define ENVIRONMENT_VARIABLE_AUTH_H

#include <authentication.hpp>

class environmentVariableAuth : public authentication {
public:
  environmentVariableAuth();
  std::string username();
  std::string password();
  bool isInvalid();
};

#endif

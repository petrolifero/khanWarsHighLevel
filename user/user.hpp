#ifndef USER_H
#define USER_H

#include <string>

#include <api.hpp>
#include <environmentVariableAuth.hpp>

class user
{
private:
  std::string username,password;
  khanWarsAPI api;
public:
  user(environmentVariableAuth auth,khanWarsAPI&& api);
  user(const user& other) = default;
};
#endif

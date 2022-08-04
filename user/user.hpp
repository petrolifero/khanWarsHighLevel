#ifndef USER_H
#define USER_H

#include <string>

#include <api.hpp>
#include <environmentVariableAuth.hpp>

class basicUser : public user
{
private:
  authentication auth;
  khanWarsAPI api;
public:
  user(environmentVariableAuth auth,khanWarsAPI api);
  user(const user& other) = default;
  //async
  void print(media m);
  //async
  void apply(changeCollection cc);
};
#endif

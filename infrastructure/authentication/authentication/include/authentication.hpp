#ifndef AUTHENTICATION_H_
#define AUTHENTICATION_H_

#include <string>

class authentication {
  virtual std::string username() = 0;
  virtual std::string password() = 0;
  virtual bool isInvalid() = 0;
};

#endif

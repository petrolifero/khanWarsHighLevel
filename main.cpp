#include <iostream>
#include <cstdlib>

#include <QCoreApplication>

#include <console.hpp>
#include <user.hpp>
#include <api.hpp>
#include <environmentVariableAuth.hpp>

int main(int argc, char* argv[]) {
  QCoreApplication app(argc,argv);
  environmentVariableAuth authentication;
  if (authentication.isInvalid()) {
      std::cerr << "Please, set a password with KHANWARS_PASSWORD env and a username with KHANWARS_USERNAME env" << std::endl;
      return 1;
  }

  khanWarsAPI api(authentication);
  user actualUser(authentication,std::move(api));
  console cli(actualUser);
  cli.start();
  cli.wait();
  return 0;
}


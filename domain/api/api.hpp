#ifndef API_H
#define API_H

#include <string>
#include <stack>
#include <memory>


#include <QJsonDocument>

#include <environmentVariableAuth.hpp>

class khanWarsAPI
{

private:
  class khanWarsAPIimpl;
  std::unique_ptr<khanWarsAPIimpl> impl;
public:
  khanWarsAPI(environmentVariableAuth auth);
  khanWarsAPI(khanWarsAPI&& other);
  khanWarsAPI(const khanWarsAPI& other);
  ~khanWarsAPI();
  void castles();
  std::stack<QJsonDocument> avaliableElements();
};

#endif

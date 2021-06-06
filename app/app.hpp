#ifndef _APP_H_
#define _APP_H_

#include <vector>
#include <string>

class app {
private:
  int argc;
  char** argv;
public:
  app(int argc, char** argv);
  int run();
};

#endif

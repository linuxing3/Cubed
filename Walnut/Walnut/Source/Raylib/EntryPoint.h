#pragma once

#include "GUI/Raylib/Application.h"

extern Raylib::Application *Raylib::CreateApplication(int argc, char **argv);

bool g_ApplicationRunning = true;

namespace Raylib {

int Main(int argc, char **argv) {
  while (g_ApplicationRunning) {
    Raylib::Application *app = Raylib::CreateApplication(argc, argv);
    app->Run();
    delete app;
  }

  return 0;
}

} // namespace Raylib

int main(int argc, char **argv) { return Raylib::Main(argc, argv); }

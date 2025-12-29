#include "GUI/Raylib/Application.h"
#include "Raylib/EntryPoint.h"

Raylib::Application *Raylib::CreateApplication(int argc, char **argv) {
  Raylib::ApplicationSpecification spec;
  spec.Name = "Ray Tracing";

  Raylib::Application *app = new Raylib::Application(spec);
  return app;
}

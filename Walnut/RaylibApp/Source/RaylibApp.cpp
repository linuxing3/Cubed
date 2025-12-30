#include "ComputeLayer.h"
#include "CubeLayer.h"
#include "GUI/Raylib/Application.h"
#include "GridLayer.h"
#include "Raylib/EntryPoint.h"
#include "rlImGui/imgui-master/imgui.h"

Raylib::Application *Raylib::CreateApplication(int argc, char **argv) {
  Raylib::ApplicationSpecification spec;
  spec.Name = "Ray Tracing";

  Raylib::Application *app = new Raylib::Application(spec);
  app->PushLayer<CubeLayer>();
  app->PushLayer<ComputeLayer>();
  app->PushLayer<GridLayer>();
  app->SetMenubarCallback([app]() {
    if (ImGui::BeginMainMenuBar()) {
      if (ImGui::BeginMenu("File")) {
        if (ImGui::MenuItem("Quit"))
          app->Close();

        ImGui::EndMenu();
      }

      ImGui::EndMainMenuBar();
    }
  });
  return app;
}

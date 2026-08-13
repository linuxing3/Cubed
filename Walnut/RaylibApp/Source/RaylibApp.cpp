// #include "ComputeLayer.h"
// #include "CubeLayer.h"
#include "GUI/Raylib/Application.h"
// #include "GridLayer.h"
// #include "ModelLayer.h"
// #include "LightLayer.h"
#include "Raylib/EntryPoint.h"
// #include "RotatingCubeShaderLayer.h"
// #include "RayMarchingLayer.h"
#include "ShaderLayer.h"
#include "rlImGui/imgui-master/imgui.h"

Raylib::Application *Raylib::CreateApplication(int argc, char **argv) {
  Raylib::ApplicationSpecification spec;
  spec.Name = "Ray Tracing";

  Raylib::Application *app = new Raylib::Application(spec);
  // app->PushLayer<CubeLayer>();
  // app->PushLayer<ComputeLayer>();
  // app->PushLayer<GridLayer>();
  // app->PushLayer<ModelLayer>();
  // app->PushLayer<LightLayer>();
  app->PushLayer<ShaderLayer>();
  // app->PushLayer<RotatingCubeShaderLayer>();
  // app->PushLayer<RayMarchingShaderLayer>();
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

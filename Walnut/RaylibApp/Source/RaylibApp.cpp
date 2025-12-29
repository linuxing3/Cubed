#include "GUI/Raylib/Application.h"
#include "Raylib/EntryPoint.h"
#include "Walnut/Layer.h"
#include "rlImGui/imgui-master/imgui.h"

class ExampleLayer : public Walnut::Layer {
public:
  virtual void OnUIRender() override {
    ImGui::Begin("Hello");
    ImGui::Button("Button");
    ImGui::End();
  }
};

Raylib::Application *Raylib::CreateApplication(int argc, char **argv) {
  Raylib::ApplicationSpecification spec;
  spec.Name = "Ray Tracing";

  Raylib::Application *app = new Raylib::Application(spec);
  app->PushLayer<ExampleLayer>();
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

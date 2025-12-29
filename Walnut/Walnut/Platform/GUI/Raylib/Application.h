#pragma once

#include <functional>
#include <memory>
#include <string>
#include <vector>

#include "Walnut/Layer.h"

namespace Raylib {

struct ApplicationSpecification {
  std::string Name = "Raylib App";
  uint32_t Width = 1600;
  uint32_t Height = 900;
};

class Application {
public:
  Application(const Raylib::ApplicationSpecification &applicationSpecification =
                  ApplicationSpecification());
  ~Application();

  static Application &Get();

  void Run();
  void SetMenubarCallback(const std::function<void()> &menubarCallback) {
    m_MenubarCallback = menubarCallback;
  }

  template <typename T> void PushLayer() {
    static_assert(std::is_base_of<Walnut::Layer, T>::value,
                  "Pushed type is not subclass of Layer!");
    m_LayerStack.emplace_back(std::make_shared<T>())->OnAttach();
  }

  void PushLayer(const std::shared_ptr<Walnut::Layer> &layer) {
    m_LayerStack.emplace_back(layer);
    layer->OnAttach();
  }

  void Close();

  float GetTime();

  static void SubmitResourceFree(std::function<void()> &&func);

private:
  void Init();
  void Shutdown();

private:
  ApplicationSpecification m_Specification;
  bool m_Running = false;

  float m_TimeStep = 0.0f;
  float m_FrameTime = 0.0f;
  float m_LastFrameTime = 0.0f;

  std::vector<std::shared_ptr<Walnut::Layer>> m_LayerStack;
  std::function<void()> m_MenubarCallback;
};

// Implemented by CLIENT
Application *CreateApplication(int argc, char **argv);
} // namespace Raylib

/*******************************************************************************************
 *
 *   raylib-extras [ImGui] example - Docking example
 *
 *	This is an example of using the ImGui docking features that are part of
 *docking branch You must replace the default imgui with the code from the
 *docking branch for this to work https://github.com/ocornut/imgui/tree/docking
 *
 *   Copyright (c) 2024 Jeffery Myers
 *
 ********************************************************************************************/

#include "GUI/Raylib/Application.h"

#include "external/glfw/include/GLFW/glfw3.h"
#include "raylib.h"
#include "rlImGui/rlImGui.h" // include the API header

// DPI scaling functions
float ScaleToDPIF(float value) { return GetWindowScaleDPI().x * value; }

int ScaleToDPII(int value) { return int(GetWindowScaleDPI().x * value); }

extern bool g_ApplicationRunning;

static Raylib::Application *s_Instance = nullptr;

static std::vector<std::vector<std::function<void()>>> s_ResourceFreeQueue;
static uint32_t s_CurrentFrameIndex = 0;
static int FRAME_COUNT = 2;

namespace Raylib {

Application::Application(const Raylib::ApplicationSpecification &specification)
    : m_Specification(specification) {
  s_Instance = this;
  Init();
}

Application::~Application() {
  Shutdown();
  s_Instance = nullptr;
}

Application &Application::Get() { return *s_Instance; }

void Application::Init() {
  // Initialization
  //--------------------------------------------------------------------------------------
  int screenWidth = m_Specification.Width;
  int screenHeight = m_Specification.Height;

  SetConfigFlags(FLAG_MSAA_4X_HINT | FLAG_VSYNC_HINT | FLAG_WINDOW_RESIZABLE);
  InitWindow(screenWidth, screenHeight, "Efwmc Application");
  SetTargetFPS(144);
  rlImGuiSetup(true);

#ifdef IMGUI_HAS_DOCK
  ImGui::GetIO().ConfigFlags |= ImGuiConfigFlags_DockingEnable;
#endif
  s_ResourceFreeQueue.resize(FRAME_COUNT);
}

void Application::Close() {

  m_Running = false;
  g_ApplicationRunning = false;

  rlImGuiShutdown();

  CloseWindow();
}

void Application::Shutdown() {

  // Walnut ImGui Layer Callback
  for (auto &layer : m_LayerStack)
    layer->OnDetach();
  m_LayerStack.clear();

  // Resource Queue Callback
  for (auto &queue : s_ResourceFreeQueue) {
    for (auto &func : queue)
      func();
  }
  s_ResourceFreeQueue.clear();

  Close();
}

void Application::Run() {
  m_Running = true;

  // Prepare ( i.e. Camera, ... )
  for (auto &layer : m_LayerStack)
    layer->OnAttach();

  bool showDemoWindow = true;
  while (!WindowShouldClose() && m_Running) {
    // Update ( i.e. mvp, color ... )
    float time = (float)glfwGetTime();
    m_FrameTime = time - m_LastFrameTime;
    m_TimeStep = std::min(m_FrameTime, 0.0333f);
    m_LastFrameTime = time;

    for (auto &layer : m_LayerStack)
      layer->OnUpdate(time);

    // Drawing
    BeginDrawing();
    ClearBackground(DARKGRAY);

    // Drawing ImGui content
    rlImGuiBegin();

#ifdef IMGUI_HAS_DOCK
    ImGui::DockSpaceOverViewport(0, NULL,
                                 ImGuiDockNodeFlags_PassthruCentralNode);
#endif

    // Drawing ImGui Custom Layers
    for (auto &layer : m_LayerStack)
      layer->OnUIRender();

    // End ImGui Content
    rlImGuiEnd();

    // Run funcs in resources queue
    s_CurrentFrameIndex = (s_CurrentFrameIndex + 1) % FRAME_COUNT;
    for (auto &func : s_ResourceFreeQueue[s_CurrentFrameIndex])
      func();
    s_ResourceFreeQueue[s_CurrentFrameIndex].clear();

    EndDrawing();
  }
}

void Application::SubmitResourceFree(std::function<void()> &&func) {
  s_ResourceFreeQueue[s_CurrentFrameIndex].emplace_back(func);
}

} // namespace Raylib

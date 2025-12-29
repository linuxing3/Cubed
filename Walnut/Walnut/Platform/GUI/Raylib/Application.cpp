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

#include "raylib.h"
#include "raylib_imgui/imgui.h"
#include "raymath.h"
#include "rlImGui.h" // include the API header

// DPI scaling functions
float ScaleToDPIF(float value) { return GetWindowScaleDPI().x * value; }

int ScaleToDPII(int value) { return int(GetWindowScaleDPI().x * value); }

extern bool g_ApplicationRunning;

static Raylib::Application *s_Instance = nullptr;

static std::vector<std::vector<std::function<void()>>> s_ResourceFreeQueue;
static uint32_t s_CurrentFrameIndex = 0;

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
  int screenWidth = 1280;
  int screenHeight = 800;

  // do not set the FLAG_WINDOW_HIGHDPI flag, that scales a low res framebuffer
  // up to the native resolution. use the native resolution and scale your
  // geometry.
  SetConfigFlags(FLAG_MSAA_4X_HINT | FLAG_VSYNC_HINT | FLAG_WINDOW_RESIZABLE);
  InitWindow(screenWidth, screenHeight,
             "raylib-Extras [ImGui] example - Docking");
  SetTargetFPS(144);
  rlImGuiSetup(true);

#ifdef IMGUI_HAS_DOCK
  ImGui::GetIO().ConfigFlags |= ImGuiConfigFlags_DockingEnable;
#endif
}

void Application::Shutdown() {

  for (auto &layer : m_LayerStack)
    layer->OnDetach();

  m_LayerStack.clear();
  g_ApplicationRunning = false;
}

void Application::Run() {
  m_Running = true;

  for (auto &layer : m_LayerStack)
    layer->OnAttach();

  bool showDemoWindow = true;
  // Main game loop
  while (!WindowShouldClose() && m_Running) // Detect window close button or ESC
                                            // key, or a quit from the menu,
  {
    BeginDrawing();
    ClearBackground(DARKGRAY);

    // draw something to the raylib window below the GUI.
    DrawCircle(GetScreenWidth() / 2, GetScreenHeight() / 2,
               GetScreenHeight() * 0.45f, DARKGREEN);

    // start ImGui content
    rlImGuiBegin();

    // if you want windows to dock to the viewport, call this.
#ifdef IMGUI_HAS_DOCK
    ImGui::DockSpaceOverViewport(
        0, NULL,
        ImGuiDockNodeFlags_PassthruCentralNode); // set
                                                 // ImGuiDockNodeFlags_PassthruCentralNode
                                                 // so that we can see the
                                                 // raylib contents behind the
                                                 // dockspace
#endif

    for (auto &layer : m_LayerStack)
      layer->OnUIRender();

    // end ImGui Content
    rlImGuiEnd();

    EndDrawing();
  }
}

void Application::Close() {
  m_Running = false;

  // De-Initialization
  rlImGuiShutdown();

  //--------------------------------------------------------------------------------------
  CloseWindow(); // Close window and OpenGL context
}

float Application::GetTime() { return 0.0; }

void Application::SubmitResourceFree(std::function<void()> &&func) {
  s_ResourceFreeQueue[s_CurrentFrameIndex].emplace_back(func);
}

} // namespace Raylib

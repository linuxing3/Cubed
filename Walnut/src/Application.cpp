#include "glad/gl.h"
#define GLFW_INCLUDE_GLEXT
#include <GLFW/glfw3.h> // Will drag system OpenGL headers

#include "Application.h"

#include "glm/common.hpp"
#include "imgui.h"
#include "imgui_impl_glfw.h"
#include "imgui_impl_opengl3.h"

#include <stdio.h>  // printf, fprintf
#include <stdlib.h> // abort

#include <iostream>

// Emedded font
#include "ImGui/Roboto-Regular.embed"

extern bool g_ApplicationRunning;

static Walnut::Application *s_Instance = nullptr;

static std::vector<std::vector<std::function<void()>>> s_ResourceFreeQueue;
static uint32_t s_CurrentFrameIndex = 0;

static void ErrorCallback(int error, const char *description) {
  std::cerr << "Error: " << description << std::endl;
}

static void KeyCallback(GLFWwindow *window, int key, int scancode, int action,
                        int mods) {
  if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS)
    glfwSetWindowShouldClose(window, GLFW_TRUE);
}

namespace Walnut {

Application::Application(const ApplicationSpecification &specification)
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

  glfwSetErrorCallback(ErrorCallback);

  if (!glfwInit())
    exit(EXIT_FAILURE);

  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);

  int width = 1280;
  int height = 720;

  m_WindowHandle = glfwCreateWindow(width, height, "Compute", NULL, NULL);
  if (!m_WindowHandle) {
    glfwTerminate();
    exit(EXIT_FAILURE);
  }

  glfwSetKeyCallback(m_WindowHandle, KeyCallback);

  glfwMakeContextCurrent(m_WindowHandle);
  // LOAD GL
  gladLoadGL(glfwGetProcAddress);
  glfwSwapInterval(1);

  // Init Imgui
  const char *glsl_version = "#version 130";
  // Create window with graphics context
  float main_scale = ImGui_ImplGlfw_GetContentScaleForMonitor(
      glfwGetPrimaryMonitor()); // Valid on GLFW 3.3+ only
  IMGUI_CHECKVERSION();
  ImGui::CreateContext();
  ImGuiIO &io = ImGui::GetIO();
  (void)io;
  io.ConfigFlags |=
      ImGuiConfigFlags_NavEnableKeyboard; // Enable Keyboard Controls
  io.ConfigFlags |=
      ImGuiConfigFlags_NavEnableGamepad;              // Enable Gamepad Controls
  io.ConfigFlags |= ImGuiConfigFlags_DockingEnable;   // Enable Docking
  io.ConfigFlags |= ImGuiConfigFlags_ViewportsEnable; // Enable Multi-Viewport /
                                                      // Platform Windows
  // io.ConfigViewportsNoAutoMerge = true;
  // io.ConfigViewportsNoTaskBarIcon = true;

  // Setup Dear ImGui style
  ImGui::StyleColorsDark();
  // ImGui::StyleColorsLight();

  // Setup scaling
  ImGuiStyle &style = ImGui::GetStyle();
  style.ScaleAllSizes(main_scale);
  style.FontScaleDpi = main_scale;
#if GLFW_VERSION_MAJOR >= 3 && GLFW_VERSION_MINOR >= 3
  io.ConfigDpiScaleFonts =
      true; // [Experimental] Automatically overwrite style.FontScaleDpi in
            // Begin() when Monitor DPI changes. This will scale fonts but _NOT_
            // scale sizes/padding for now.
  io.ConfigDpiScaleViewports =
      true; // [Experimental] Scale Dear ImGui and Platform Windows when Monitor
            // DPI changes.
#endif

  // When viewports are enabled we tweak WindowRounding/WindowBg so platform
  // windows can look identical to regular ones.
  if (io.ConfigFlags & ImGuiConfigFlags_ViewportsEnable) {
    style.WindowRounding = 0.0f;
    style.Colors[ImGuiCol_WindowBg].w = 1.0f;
  }

  ImFontConfig fontConfig;
  fontConfig.FontDataOwnedByAtlas = false;
  ImFont *robotoFont = io.Fonts->AddFontFromMemoryTTF(
      (void *)g_RobotoRegular, sizeof(g_RobotoRegular), 20.0f, &fontConfig);
  io.FontDefault = robotoFont;

  // Setup Platform/Renderer backends
  ImGui_ImplGlfw_InitForOpenGL(m_WindowHandle, true);
  ImGui_ImplOpenGL3_Init(glsl_version);
}

void Application::Shutdown() {
  for (auto &layer : m_LayerStack)
    layer->OnDetach();

  m_LayerStack.clear();

  glfwDestroyWindow(m_WindowHandle);
  glfwTerminate();

  g_ApplicationRunning = false;
}

void Application::Run() {
  m_Running = true;

  for (auto &layer : m_LayerStack)
    layer->OnDetach();

  while (!glfwWindowShouldClose(m_WindowHandle)) {
    // ------------------- ImGui Frame starts ----------------------------
    ImGui_ImplOpenGL3_NewFrame();
    ImGui_ImplGlfw_NewFrame();
    ImGui::NewFrame();

    {

      for (auto &layer : m_LayerStack)
        layer->OnUIRender();
    }

    // ImGui Rendering
    {
      ImGui::Render();
      ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());

      ImVec4 clear_color = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);
      int display_w, display_h;
      glfwGetFramebufferSize(m_WindowHandle, &display_w, &display_h);
      glViewport(0, 0, display_w, display_h);
      glClearColor(clear_color.x * clear_color.w, clear_color.y * clear_color.w,
                   clear_color.z * clear_color.w, clear_color.w);
      glClear(GL_COLOR_BUFFER_BIT);

      ImGuiIO &io = ImGui::GetIO();
      (void)io;
      if (io.ConfigFlags & ImGuiConfigFlags_ViewportsEnable) {
        GLFWwindow *backup_current_context = glfwGetCurrentContext();
        ImGui::UpdatePlatformWindows();
        ImGui::RenderPlatformWindowsDefault();
        glfwMakeContextCurrent(backup_current_context);
      }
    }

    // --------------------- Present to screen ------------------------
    glfwSwapBuffers(m_WindowHandle);
    glfwPollEvents();
    if (glfwGetWindowAttrib(m_WindowHandle, GLFW_ICONIFIED) != 0) {
      ImGui_ImplGlfw_Sleep(10);
      continue;
    }
    float time = GetTime();
    m_FrameTime = time - m_LastFrameTime;
    m_TimeStep = glm::min<float>(m_FrameTime, 0.0333f);
    m_LastFrameTime = time;
  }
}

void Application::Close() { m_Running = false; }

float Application::GetTime() { return (float)glfwGetTime(); }

void Application::SubmitResourceFree(std::function<void()> &&func) {
  s_ResourceFreeQueue[s_CurrentFrameIndex].emplace_back(func);
}
// if (dockspace_flags & ImGuiDockNodeFlags_PassthruCentralNode)
//   window_flags |= ImGuiWindowFlags_NoBackground;

} // namespace Walnut

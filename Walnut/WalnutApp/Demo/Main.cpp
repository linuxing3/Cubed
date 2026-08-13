#include <iostream>

#include <glm/glm.hpp>

#include "imgui.h"
#include "imgui_impl_glfw.h"
#include "imgui_impl_opengl3.h"

// #include "Renderer.h"
#include "Walnut/Image.h"
#include "Shader.h"

// Emedded font
#include "ImGui/Roboto-Regular.embed"

static uint32_t s_ComputeShader = -1;
static const std::filesystem::path s_ComputeShaderPath = "Shaders/Compute.glsl";

static void ErrorCallback(int error, const char *description) {
  std::cerr << "Error: " << description << std::endl;
}

static void KeyCallback(GLFWwindow *window, int key, int scancode, int action,
                        int mods) {
  if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS)
    glfwSetWindowShouldClose(window, GLFW_TRUE);

  if (key == GLFW_KEY_R)
    s_ComputeShader = ReloadComputeShader(s_ComputeShader, s_ComputeShaderPath);
}

int test_compute() {
  glfwSetErrorCallback(ErrorCallback);

  if (!glfwInit())
    exit(EXIT_FAILURE);

  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);

  int width = 1280;
  int height = 720;

  GLFWwindow *window = glfwCreateWindow(width, height, "Compute", NULL, NULL);
  if (!window) {
    glfwTerminate();
    exit(EXIT_FAILURE);
  }

  glfwSetKeyCallback(window, KeyCallback);

  glfwMakeContextCurrent(window);
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
  style.ScaleAllSizes(
      main_scale); // Bake a fixed style scale. (until we have a solution for
                   // dynamic style scaling, changing this requires resetting
                   // Style + calling this again)
  style.FontScaleDpi =
      main_scale; // Set initial font scale. (using io.ConfigDpiScaleFonts=true
                  // makes this unnecessary. We leave both here for
                  // documentation purpose)
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
  ImGui_ImplGlfw_InitForOpenGL(window, true);
  ImGui_ImplOpenGL3_Init(glsl_version);
  bool show_demo_window = true;
  ImVec4 clear_color = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);

  // Compute Shaders
  s_ComputeShader = CreateComputeShader(s_ComputeShaderPath);
  if (s_ComputeShader == -1) {
    std::cerr << "Compute shader failed\n";
    return -1;
  }

  // HACK
  Walnut::Image image(width, height);

  while (!glfwWindowShouldClose(window)) {

    // --------------------- Resize texture -----------------------------
    glfwGetFramebufferSize(window, &width, &height);
    if (width != image.GetTexture().Width ||
        height != image.GetTexture().Height) {
      image.Resize(width, height);
    }

    // ------------------- ImGui Frame starts ----------------------------
    ImGui_ImplOpenGL3_NewFrame();
    ImGui_ImplGlfw_NewFrame();
    ImGui::NewFrame();
    ImGui::ShowDemoWindow(&show_demo_window);

    // ------------------- Start Compute in Shader -----------------------
    {
      glUseProgram(s_ComputeShader);
      glBindImageTexture(0, image.GetFramebuffer().ColorAttachment.Handle, 0,
                         GL_FALSE, 0, GL_WRITE_ONLY, GL_RGBA32F);

      const GLuint workGroupSizeX = 16;
      const GLuint workGroupSizeY = 16;

      GLuint numGroupsX = (width + workGroupSizeX - 1) / workGroupSizeX;
      GLuint numGroupsY = (height + workGroupSizeY - 1) / workGroupSizeY;

      glDispatchCompute(numGroupsX, numGroupsY, 1);

      // Ensure all writes to the image are complete
      glMemoryBarrier(GL_SHADER_IMAGE_ACCESS_BARRIER_BIT);
    }

    // ------------------- Rendering starts ----------------------------
    // Clear Screen
    {
      // int display_w, display_h;
      // glfwGetFramebufferSize(window, &display_w, &display_h);
      // glViewport(0, 0, display_w, display_h);
      // glClearColor(clear_color.x * clear_color.w, clear_color.y *
      // clear_color.w,
      //              clear_color.z * clear_color.w, clear_color.w);
      // glClear(GL_COLOR_BUFFER_BIT);
    }

    // Background Rendering
    {
      image.BlitFramebufferToSwapchain(image.GetFramebuffer());
    }

    // ImGui Rendering
    {
      ImGui::Render();
      ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());
      if (io.ConfigFlags & ImGuiConfigFlags_ViewportsEnable) {
        GLFWwindow *backup_current_context = glfwGetCurrentContext();
        ImGui::UpdatePlatformWindows();
        ImGui::RenderPlatformWindowsDefault();
        glfwMakeContextCurrent(backup_current_context);
      }
    }

    // --------------------- Present to screen ------------------------
    glfwSwapBuffers(window);
    glfwPollEvents();
    if (glfwGetWindowAttrib(window, GLFW_ICONIFIED) != 0) {
      ImGui_ImplGlfw_Sleep(10);
      continue;
    }
  }

  glfwDestroyWindow(window);
  glfwTerminate();
}

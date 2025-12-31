#pragma once

#include "Walnut/Layer.h"

#include "raylib.h"
#include "raymath.h"

#include "examples/shaders/rlights.h"

#include "rlImGui/imgui-master/imgui.h"
#include "rlImGui/rlImGui.h"
#include <memory>

using namespace Walnut;

#if defined(PLATFORM_DESKTOP)
#define GLSL_VERSION 330
#else // PLATFORM_ANDROID, PLATFORM_WEB
#define GLSL_VERSION 100
#endif

// DPI scaling functions
class RayMarchingShaderLayer : public Walnut::Layer {
  Camera3D camera = {0};

  // Load Shader
  Shader shader;
  int viewEyeLoc;
  int viewCenterLoc;
  int runTimeLoc;
  int resolutionLoc;

  float runTime = 0.0f;
  float resolution[2];

public:
  void OnAttach() override {

    camera.position = (Vector3){2.5f, 2.5f, 3.0f}; // Camera position
    camera.target = (Vector3){0.0f, 0.0f, 0.7f};   // Camera looking at point
    camera.up = (Vector3){0.0f, 1.0f,
                          0.0f}; // Camera up vector (rotation towards target)
    camera.fovy = 65.0f;         // Camera field-of-view Y
    camera.projection = CAMERA_PERSPECTIVE; // Camera projection type

    // Load raymarching shader
    // NOTE: Defining 0 (NULL) for vertex shader forces usage of internal
    // default vertex shader
    shader = LoadShader(
        0,
        TextFormat("examples/shaders/resources/shaders/glsl%i/raymarching.fs",
                   GLSL_VERSION));

    // Get shader locations for required uniforms
    viewEyeLoc = GetShaderLocation(shader, "viewEye");
    viewCenterLoc = GetShaderLocation(shader, "viewCenter");
    runTimeLoc = GetShaderLocation(shader, "runTime");
    resolutionLoc = GetShaderLocation(shader, "resolution");

    resolution[0] = (float)GetScreenWidth();
    resolution[1] = (float)GetScreenHeight();
    SetShaderValue(shader, resolutionLoc, resolution, SHADER_UNIFORM_VEC2);
  }

  void OnDetach() override {
    UnloadShader(shader); // Unload shader
  }

  void OnUIRender() override {

    ClearBackground(RAYWHITE);

    // We only draw a white full-screen rectangle,
    // frame is generated in shader using raymarching
    BeginShaderMode(shader);
    DrawRectangle(0, 0, GetScreenWidth(), GetScreenHeight(), WHITE);
    EndShaderMode();

    DrawText("(c) Raymarching shader by Iñigo Quilez. MIT License.",
             GetScreenWidth() - 280, GetScreenHeight() - 20, 10, BLACK);
  }

  void OnResize() {
    // Check if screen is resized
    if (IsWindowResized()) {
      resolution[0] = (float)GetScreenWidth();
      resolution[1] = (float)GetScreenHeight();
      SetShaderValue(shader, resolutionLoc, resolution, SHADER_UNIFORM_VEC2);
    }
  }

  void OnUpdate(float ts) override {

    UpdateCamera(&camera, CAMERA_FIRST_PERSON);

    float cameraPos[3] = {camera.position.x, camera.position.y,
                          camera.position.z};
    float cameraTarget[3] = {camera.target.x, camera.target.y, camera.target.z};

    float deltaTime = GetFrameTime();
    runTime += deltaTime;

    // Set shader required uniform values
    SetShaderValue(shader, viewEyeLoc, cameraPos, SHADER_UNIFORM_VEC3);
    SetShaderValue(shader, viewCenterLoc, cameraTarget, SHADER_UNIFORM_VEC3);
    SetShaderValue(shader, runTimeLoc, &runTime, SHADER_UNIFORM_FLOAT);

    OnResize();
  }
};

#pragma once

#include "Walnut/Layer.h"

#include "raylib.h"
#include "raymath.h"

#define RLIGHTS_IMPLEMENTATION
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
class RotatingCubeShaderLayer : public Walnut::Layer {
  Camera3D camera = {0};

  // Load Shader
  Shader shader;

  // Load a cube model
  Mesh cube;
  Model model;

  // Load a texture and assign to cube model
  Texture2D texture;

  // Set the texture tiling using a shader
  float tiling[2] = {3.0f, 3.0f};

public:
  void OnAttach() override {

    camera.position = (Vector3){4.0f, 4.0f, 4.0f}; // Camera position
    camera.target = (Vector3){0.0f, 0.5f, 0.0f};   // Camera looking at point
    camera.up = (Vector3){0.0f, 1.0f,
                          0.0f}; // Camera up vector (rotation towards target)
    camera.fovy = 45.0f;         // Camera field-of-view Y
    camera.projection = CAMERA_PERSPECTIVE; // Camera projection type

    // Load a cube model
    cube = GenMeshCube(1.0f, 1.0f, 1.0f);
    model = LoadModelFromMesh(cube);

    // Load a texture and assign to cube model
    texture = LoadTexture("examples/shaders/resources/cubicmap_atlas.png");
    model.materials[0].maps[MATERIAL_MAP_DIFFUSE].texture = texture;

    // Set the texture tiling using a shader
    shader = LoadShader(
        0, TextFormat("examples/shaders/resources/shaders/glsl%i/tiling.fs",
                      GLSL_VERSION));
    SetShaderValue(shader, GetShaderLocation(shader, "tiling"), tiling,
                   SHADER_UNIFORM_VEC2);
    model.materials[0].shader = shader;
  }

  void OnDetach() override {
    UnloadModel(model);     // Unload model
    UnloadShader(shader);   // Unload shader
    UnloadTexture(texture); // Unload texture
  }

  void OnUIRender() override {

    ClearBackground(RAYWHITE);

    BeginMode3D(camera);

    BeginShaderMode(shader);
    DrawModel(model, (Vector3){0.0f, 0.0f, 0.0f}, 2.0f, WHITE);
    EndShaderMode();

    DrawGrid(10, 1.0f);

    EndMode3D();

    DrawText("Use mouse to rotate the camera", 10, 10, 20, DARKGRAY);
  }

  void OnResize() {}

  void OnUpdate(float ts) override {

    //----------------------------------------------------------------------------------
    UpdateCamera(&camera, CAMERA_FREE);

    if (IsKeyPressed('Z'))
      camera.target = (Vector3){0.0f, 0.5f, 0.0f};
  }
};

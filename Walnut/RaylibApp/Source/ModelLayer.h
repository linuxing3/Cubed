#pragma once

#include "Walnut/Layer.h"

#include "raylib.h"
#include <memory>

#if defined(PLATFORM_DESKTOP)
#define GLSL_VERSION 330
#else // PLATFORM_ANDROID, PLATFORM_WEB
#define GLSL_VERSION 100
#endif

using namespace Walnut;

// DPI scaling functions
class ModelLayer : public Walnut::Layer {
  Camera3D camera = {0};

  Model model;
  Texture2D texture;
  Shader shader;

  Vector3 position;

public:
  void OnAttach() override {
    camera.position = (Vector3){4.0f, 4.0f, 4.0f}; // Camera position
    camera.target = (Vector3){0.0f, 1.0f, -1.0f};  // Camera looking at point
    camera.up = (Vector3){0.0f, 1.0f,
                          0.0f}; // Camera up vector (rotation towards target)
    camera.fovy = 45.0f;         // Camera field-of-view Y
    camera.projection = CAMERA_PERSPECTIVE; // Camera projection type

    model = LoadModel(
        "examples/shaders/resources/models/watermill.obj"); // Load OBJ
                                                            // model
    texture = LoadTexture(
        "examples/shaders/resources/models/watermill_diffuse.png"); // Load
                                                                    // model
                                                                    // texture

    // Load shader for model
    // NOTE: Defining 0 (NULL) for vertex shader forces usage of internal
    // default vertex shader
    shader = LoadShader(
        0, TextFormat("examples/shaders/resources/shaders/glsl%i/grayscale.fs",
                      GLSL_VERSION));

    model.materials[0].shader = shader; // Set shader effect to 3d model
    model.materials[0].maps[MATERIAL_MAP_DIFFUSE].texture =
        texture; // Bind texture to model

    position = {0.0f, 0.0f, 0.0f}; // Set model position
  }

  void OnDetach() override {
    UnloadShader(shader);   // Unload shader
    UnloadTexture(texture); // Unload texture
    UnloadModel(model);     // Unload model
  }

  void OnUIRender() override {
    ClearBackground(RAYWHITE);

    BeginMode3D(camera);

    DrawModel(model, position, 0.2f, WHITE); // Draw 3d model with texture

    DrawGrid(10, 1.0f); // Draw a grid

    EndMode3D();

    DrawFPS(10, 10);
  }

  void OnResize() {}

  void OnUpdate(float ts) override { UpdateCamera(&camera, CAMERA_FREE); }
};

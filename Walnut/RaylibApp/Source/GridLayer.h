#pragma once

#include "Walnut/Layer.h"

#include "raylib.h"
#include "raymath.h"
#include "rlImGui/imgui-master/imgui.h"
#include "rlImGui/rlImGui.h"
#include <memory>

using namespace Walnut;

// DPI scaling functions
class GridLayer : public Walnut::Layer {
  bool Open = true;
  RenderTexture ViewTexture;
  bool Focused = false;
  Rectangle ContentRect = {0};
  Texture2D GridTexture = {0};

  Vector3 CubePosition = {0.0f, 0.0f, 0.0f};
  Vector2 CubeScreenPosition = {0.0f, 0.0f};
  Camera3D Camera = {0};

public:
  void OnAttach() override {
    // Define the camera to look into our 3d world
    Camera.position = (Vector3){10.0f, 10.0f, 10.0f}; // camera position
    Camera.target = (Vector3){0.0f, 0.0f, 0.0f};      // camera looking at point
    Camera.up = (Vector3){0.0f, 1.0f,
                          0.0f}; // camera up vector (rotation towards target)
    Camera.fovy = 45.0f;         // camera field-of-view Y
    Camera.projection = CAMERA_PERSPECTIVE; // Camera projection type
  }

  void OnDetach() override {}

  void OnUIRender() override {

    ClearBackground(RAYWHITE);

    BeginMode3D(Camera);

    DrawCube(CubePosition, 2.0f, 2.0f, 2.0f, RED);
    DrawCubeWires(CubePosition, 2.0f, 2.0f, 2.0f, MAROON);

    DrawGrid(10, 1.0f);

    EndMode3D();

    DrawText("Enemy: 100/100",
             (int)CubeScreenPosition.x - MeasureText("Enemy: 100/100", 20) / 2,
             (int)CubeScreenPosition.y, 20, BLACK);

    DrawText(TextFormat("Cube position in screen space coordinates: [%i, %i]",
                        (int)CubeScreenPosition.x, (int)CubeScreenPosition.y),
             10, 10, 20, LIME);
    DrawText("Text 2d should be always on top of the cube", 10, 40, 20, GRAY);
  }

  void OnResize() {}

  void OnUpdate(float ts) override {

    //----------------------------------------------------------------------------------
    UpdateCamera(&Camera, CAMERA_THIRD_PERSON);

    //----------------------------------------------------------------------------------
    CubeScreenPosition = GetWorldToScreen(
        (Vector3){CubePosition.x, CubePosition.y + 2.5f, CubePosition.z},
        Camera);
  }
};

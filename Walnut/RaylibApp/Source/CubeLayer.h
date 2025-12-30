#pragma once

#include "Walnut/Layer.h"

#include "raylib.h"
#include "raymath.h"
#include "rlImGui/imgui-master/imgui.h"
#include "rlImGui/rlImGui.h"
#include <memory>

using namespace Walnut;

// DPI scaling functions
class CubeLayer : public Walnut::Layer {
  bool Open = true;
  RenderTexture ViewTexture;
  bool Focused = false;
  Rectangle ContentRect = {0};
  Texture2D GridTexture = {0};

public:
  Camera3D Camera = {0};

  float ScaleToDPIF(float value) { return GetWindowScaleDPI().x * value; }

  int ScaleToDPII(int value) { return int(GetWindowScaleDPI().x * value); }

  void OnAttach() override {
    ViewTexture = LoadRenderTexture(GetScreenWidth(), GetScreenHeight());

    Camera.fovy = 45;
    Camera.up.y = 1;
    Camera.position.y = 3;
    Camera.position.z = -25;

    Image img =
        GenImageChecked(ScaleToDPII(256), ScaleToDPII(256), ScaleToDPII(32),
                        ScaleToDPII(32), DARKGRAY, WHITE);

    Image whiteImg = GenImageColor(GetScreenWidth(), GetScreenHeight(), WHITE);
    GridTexture = LoadTextureFromImage(whiteImg);
    UnloadImage(img);
    GenTextureMipmaps(&GridTexture);
    SetTextureFilter(GridTexture, TEXTURE_FILTER_ANISOTROPIC_16X);
    SetTextureWrap(GridTexture, TEXTURE_WRAP_CLAMP);
  }

  void OnDetach() override {
    UnloadRenderTexture(ViewTexture);
    UnloadTexture(GridTexture);
  }

  void OnUIRender() override {
    ImGui::PushStyleVar(ImGuiStyleVar_WindowPadding, ImVec2(0, 0));
    ImGui::SetNextWindowSizeConstraints(
        ImVec2(ScaleToDPIF(400.0f), ScaleToDPIF(400.0f)),
        ImVec2((float)GetScreenWidth(), (float)GetScreenHeight()));

    if (ImGui::Begin("3D View", &Open, ImGuiWindowFlags_NoScrollbar)) {
      Focused = ImGui::IsWindowFocused(ImGuiFocusedFlags_ChildWindows);
      // draw the view
      rlImGuiImageRenderTextureFit(&ViewTexture, true);
    }
    ImGui::End();
    ImGui::PopStyleVar();
  }

  void OnResize() {
    if (IsWindowResized()) {
      UnloadRenderTexture(ViewTexture);
      ViewTexture = LoadRenderTexture(GetScreenWidth(), GetScreenHeight());
    }
  }

  void OnUpdate(float ts) override {
    if (!Open)
      return;

    OnResize();

    float period = 10;
    float magnitude = 25;

    Camera.position.x = sinf(ts / period) * magnitude;

    BeginTextureMode(ViewTexture);
    ClearBackground(SKYBLUE);

    BeginMode3D(Camera);

    // grid of cube trees on a plane to make a "world"
    DrawPlane(Vector3{0, 0, 0}, Vector2{50, 50}, BEIGE); // simple world plane
    float spacing = 4;
    int count = 5;

    for (float x = -count * spacing; x <= count * spacing; x += spacing) {
      for (float z = -count * spacing; z <= count * spacing; z += spacing) {
        Vector3 pos = {x, 0.5f, z};

        Vector3 min = {x - 0.5f, 0, z - 0.5f};
        Vector3 max = {x + 0.5f, 1, z + 0.5f};

        DrawCube(Vector3{x, 1.5f, z}, 1, 1, 1, GREEN);
        DrawCube(Vector3{x, 0.5f, z}, 0.25f, 1, 0.25f, BROWN);
      }
    }

    EndMode3D();
    EndTextureMode();
  }
};

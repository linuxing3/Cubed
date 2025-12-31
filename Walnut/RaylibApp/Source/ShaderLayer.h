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

#define MAX_INSTANCES 10000

// DPI scaling functions
class ShaderLayer : public Walnut::Layer {
  bool Open = true;
  RenderTexture ViewTexture;
  bool Focused = false;
  Rectangle ContentRect = {0};
  Texture2D GridTexture = {0};

  // Define mesh to be instanced
  Mesh cube;

  Matrix *transforms;

  Shader shader;

  Material matInstances;
  Material matDefault;

public:
  Camera3D camera = {0};

  float ScaleToDPIF(float value) { return GetWindowScaleDPI().x * value; }

  int ScaleToDPII(int value) { return int(GetWindowScaleDPI().x * value); }

  void OnAttach() override {

    camera.position = (Vector3){-125.0f, 125.0f, -125.0f}; // Camera position
    camera.target = (Vector3){0.0f, 0.0f, 0.0f}; // Camera looking at point
    camera.up = (Vector3){0.0f, 1.0f,
                          0.0f}; // Camera up vector (rotation towards target)
    camera.fovy = 45.0f;         // Camera field-of-view Y
    camera.projection = CAMERA_PERSPECTIVE; // Camera projection type

    cube = GenMeshCube(1.0f, 1.0f, 1.0f);

    transforms = (Matrix *)RL_CALLOC(
        MAX_INSTANCES,
        sizeof(Matrix)); // Pre-multiplied transformations passed to rlgl
    // Translate and rotate cubes randomly
    for (int i = 0; i < MAX_INSTANCES; i++) {
      Matrix translation = MatrixTranslate((float)GetRandomValue(-50, 50),
                                           (float)GetRandomValue(-50, 50),
                                           (float)GetRandomValue(-50, 50));
      Vector3 axis = Vector3Normalize((Vector3){(float)GetRandomValue(0, 360),
                                                (float)GetRandomValue(0, 360),
                                                (float)GetRandomValue(0, 360)});
      float angle = (float)GetRandomValue(0, 180) * DEG2RAD;
      Matrix rotation = MatrixRotate(axis, angle);

      transforms[i] = MatrixMultiply(rotation, translation);
    }

    // Load lighting shader
    shader = LoadShader(
        TextFormat(
            "examples/shaders/resources/shaders/glsl%i/lighting_instancing.vs",
            GLSL_VERSION),
        TextFormat("examples/shaders/resources/shaders/glsl%i/lighting.fs",
                   GLSL_VERSION));
    // Get shader locations
    shader.locs[SHADER_LOC_MATRIX_MVP] = GetShaderLocation(shader, "mvp");
    shader.locs[SHADER_LOC_VECTOR_VIEW] = GetShaderLocation(shader, "viewPos");

    // Set shader value: ambient light level
    int ambientLoc = GetShaderLocation(shader, "ambient");
    float ambientLocValue[4] = {0.2f, 0.2f, 0.2f, 1.0f};
    SetShaderValue(shader, ambientLoc, ambientLocValue, SHADER_UNIFORM_VEC4);

    // Create one light
    CreateLight(LIGHT_DIRECTIONAL, (Vector3){50.0f, 50.0f, 0.0f}, Vector3Zero(),
                WHITE, shader);

    // NOTE: We are assigning the intancing shader to material.shader
    // to be used on mesh drawing with DrawMeshInstanced()
    matInstances = LoadMaterialDefault();
    matInstances.shader = shader;
    matInstances.maps[MATERIAL_MAP_DIFFUSE].color = RED;

    // Load default material (using raylib intenral default shader) for
    // non-instanced mesh drawing WARNING: Default shader enables vertex color
    // attribute BUT GenMeshCube() does not generate vertex colors, so, when
    // drawing the color attribute is disabled and a default color value is
    // provided as input for thevertex attribute
    matDefault = LoadMaterialDefault();
    matDefault.maps[MATERIAL_MAP_DIFFUSE].color = BLUE;
  }

  void OnDetach() override {
    RL_FREE(transforms); // Free transforms
  }

  void OnUIRender() override {

    ClearBackground(RAYWHITE);

    BeginMode3D(camera);

    // Draw cube mesh with default material (BLUE)
    DrawMesh(cube, matDefault, MatrixTranslate(-10.0f, 0.0f, 0.0f));

    // Draw meshes instanced using material containing instancing shader (RED +
    // lighting), transforms[] for the instances should be provided, they are
    // dynamically updated in GPU every frame, so we can animate the different
    // mesh instances
    DrawMeshInstanced(cube, matInstances, transforms, MAX_INSTANCES);

    // Draw cube mesh with default material (BLUE)
    DrawMesh(cube, matDefault, MatrixTranslate(10.0f, 0.0f, 0.0f));

    EndMode3D();

    DrawFPS(10, 10);
  }

  void OnResize() {}

  void OnUpdate(float ts) override {

    UpdateCamera(&camera, CAMERA_ORBITAL);

    // Update the light shader with the camera view position
    float cameraPos[3] = {camera.position.x, camera.position.y,
                          camera.position.z};
    SetShaderValue(shader, shader.locs[SHADER_LOC_VECTOR_VIEW], cameraPos,
                   SHADER_UNIFORM_VEC3);
  }
};

#pragma once

#include "Walnut/Layer.h"
#include "raylib.h"
#include "raymath.h"

using namespace Walnut;

#if defined(PLATFORM_DESKTOP)
#define GLSL_VERSION 330
#else // PLATFORM_ANDROID, PLATFORM_WEB
#define GLSL_VERSION 100
#endif

#define MAX_LIGHTS 4 // Max dynamic lights supported by shader

static int lightsCount = 0; // Current amount of created lights
// Light data
typedef struct {
  int type;
  bool enabled;
  Vector3 position;
  Vector3 target;
  Color color;
  float attenuation;

  // Shader locations
  int enabledLoc;
  int typeLoc;
  int positionLoc;
  int targetLoc;
  int colorLoc;
  int attenuationLoc;
} Light;

// Light type
typedef enum { LIGHT_DIRECTIONAL = 0, LIGHT_POINT } LightType;

// Send light properties to shader
// NOTE: Light shader locations should be available
static void UpdateLightValues(Shader shader, Light light) {
  // Send to shader light enabled state and type
  SetShaderValue(shader, light.enabledLoc, &light.enabled, SHADER_UNIFORM_INT);
  SetShaderValue(shader, light.typeLoc, &light.type, SHADER_UNIFORM_INT);

  // Send to shader light position values
  float position[3] = {light.position.x, light.position.y, light.position.z};
  SetShaderValue(shader, light.positionLoc, position, SHADER_UNIFORM_VEC3);

  // Send to shader light target position values
  float target[3] = {light.target.x, light.target.y, light.target.z};
  SetShaderValue(shader, light.targetLoc, target, SHADER_UNIFORM_VEC3);

  // Send to shader light color values
  float color[4] = {
      (float)light.color.r / (float)255, (float)light.color.g / (float)255,
      (float)light.color.b / (float)255, (float)light.color.a / (float)255};
  SetShaderValue(shader, light.colorLoc, color, SHADER_UNIFORM_VEC4);
}

// Create a light and get shader locations
static Light CreateLight(int type, Vector3 position, Vector3 target,
                         Color color, Shader shader) {
  Light light = {0};

  if (lightsCount < MAX_LIGHTS) {
    light.enabled = true;
    light.type = type;
    light.position = position;
    light.target = target;
    light.color = color;

    // NOTE: Lighting shader naming must be the provided ones
    light.enabledLoc = GetShaderLocation(
        shader, TextFormat("lights[%i].enabled", lightsCount));
    light.typeLoc =
        GetShaderLocation(shader, TextFormat("lights[%i].type", lightsCount));
    light.positionLoc = GetShaderLocation(
        shader, TextFormat("lights[%i].position", lightsCount));
    light.targetLoc =
        GetShaderLocation(shader, TextFormat("lights[%i].target", lightsCount));
    light.colorLoc =
        GetShaderLocation(shader, TextFormat("lights[%i].color", lightsCount));

    UpdateLightValues(shader, light);

    lightsCount++;
  }

  return light;
}

//----------------------------------------------------------------------------------
// Types and Structures Definition
//----------------------------------------------------------------------------------
// Light type

class LightLayer : public Walnut::Layer {

  Camera camera = {0};
  Shader shader;
  Light lights[MAX_LIGHTS] = {0};

public:
  void OnAttach() override {

    camera.position = (Vector3){2.0f, 4.0f, 6.0f}; // Camera position
    camera.target = (Vector3){0.0f, 0.5f, 0.0f};   // Camera looking at point
    camera.up = (Vector3){0.0f, 1.0f,
                          0.0f}; // Camera up vector (rotation towards target)
    camera.fovy = 45.0f;         // Camera field-of-view Y
    camera.projection = CAMERA_PERSPECTIVE; // Camera projection type

    // Load basic lighting shader
    shader = LoadShader(
        TextFormat("examples/shaders/resources/shaders/glsl%i/lighting.vs",
                   GLSL_VERSION),
        TextFormat("examples/shaders/resources/shaders/glsl%i/lighting.fs",
                   GLSL_VERSION));
    // Get some required shader locations
    shader.locs[SHADER_LOC_VECTOR_VIEW] = GetShaderLocation(shader, "viewPos");
    // NOTE: "matModel" location name is automatically assigned on shader
    // loading, no need to get the location again if using that uniform name
    // shader.locs[SHADER_LOC_MATRIX_MODEL] = GetShaderLocation(shader,
    // "matModel");

    // Ambient light level (some basic lighting)
    int ambientLoc = GetShaderLocation(shader, "ambient");

    float ambientColor[4] = {0.1f, 0.1f, 0.1f, 1.0f};
    SetShaderValue(shader, ambientLoc, ambientColor, SHADER_UNIFORM_VEC4);

    // Create lights
    lights[0] = CreateLight(LIGHT_POINT, (Vector3){-2, 1, -2}, Vector3Zero(),
                            YELLOW, shader);
    lights[1] = CreateLight(LIGHT_POINT, (Vector3){2, 1, 2}, Vector3Zero(), RED,
                            shader);
    lights[2] = CreateLight(LIGHT_POINT, (Vector3){-2, 1, 2}, Vector3Zero(),
                            GREEN, shader);
    lights[3] = CreateLight(LIGHT_POINT, (Vector3){2, 1, -2}, Vector3Zero(),
                            BLUE, shader);
  }

  void OnDetach() override { UnloadShader(shader); }

  void OnPresent() override {

    ClearBackground(RAYWHITE);

    BeginMode3D(camera);

    BeginShaderMode(shader);

    DrawPlane(Vector3Zero(), (Vector2){10.0, 10.0}, WHITE);
    DrawCube(Vector3Zero(), 2.0, 4.0, 2.0, WHITE);

    EndShaderMode();

    // Draw spheres to show where the lights are
    for (int i = 0; i < MAX_LIGHTS; i++) {
      if (lights[i].enabled)
        DrawSphereEx(lights[i].position, 0.2f, 8, 8, lights[i].color);
      else
        DrawSphereWires(lights[i].position, 0.2f, 8, 8,
                        ColorAlpha(lights[i].color, 0.3f));
    }

    DrawGrid(10, 1.0f);

    EndMode3D();

    DrawFPS(10, 10);

    DrawText("Use keys [Y][R][G][B] to toggle lights", 10, 40, 20, DARKGRAY);
  }

  void OnResize() {}

  void OnUpdate(float ts) override {

    UpdateCamera(&camera, CAMERA_ORBITAL);

    // Update the shader with the camera view vector (points towards { 0.0f,
    // 0.0f, 0.0f })
    float cameraPos[3] = {camera.position.x, camera.position.y,
                          camera.position.z};
    SetShaderValue(shader, shader.locs[SHADER_LOC_VECTOR_VIEW], cameraPos,
                   SHADER_UNIFORM_VEC3);

    // Check key inputs to enable/disable lights
    if (IsKeyPressed(KEY_Y)) {
      lights[0].enabled = !lights[0].enabled;
    }
    if (IsKeyPressed(KEY_R)) {
      lights[1].enabled = !lights[1].enabled;
    }
    if (IsKeyPressed(KEY_G)) {
      lights[2].enabled = !lights[2].enabled;
    }
    if (IsKeyPressed(KEY_B)) {
      lights[3].enabled = !lights[3].enabled;
    }

    // Update light values (actually, only enable/disable them)
    for (int i = 0; i < MAX_LIGHTS; i++)
      UpdateLightValues(shader, lights[i]);
  }
};

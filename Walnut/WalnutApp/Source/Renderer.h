#pragma once

#include "GUI/Walnut/Image.h"

#include "Camera.h"
#include "Ray.h"
#include "Scene.h"

#include <glm/glm.hpp>
#include <memory>

class Renderer {
public:
  struct Settings {
    bool Accumulate = true;
  };

public:
  Renderer() = default;

  void OnResize(uint32_t width, uint32_t height);
  void Render(const Scene &scene, const Camera &camera);

  std::shared_ptr<Walnut::Image> GetFinalImage() const { return m_FinalImage; }

  void ResetFrameIndex() { m_FrameIndex = 1; }
  Settings &GetSettings() { return m_Settings; }
  uint32_t GetComputeShader() { return m_ComputeShader; }

private:
  struct HitPayload {
    float HitDistance;
    glm::vec3 WorldPosition;
    glm::vec3 WorldNormal;

    int ObjectIndex;
  };

  void Compute();
  void Tracing();
  glm::vec4 PerPixel(uint32_t x, uint32_t y); // RayGen

  HitPayload TraceRay(const Ray &ray);
  HitPayload ClosestHit(const Ray &ray, float hitDistance, int objectIndex);
  HitPayload Miss(const Ray &ray);

private:
  std::shared_ptr<Walnut::Image> m_FinalImage;
  Settings m_Settings;

  uint32_t m_ComputeShader = -1;
  const std::filesystem::path m_ComputeShaderPath =
      "Walnut/ComputeApp/Shaders/Compute.glsl";

  std::vector<uint32_t> m_ImageHorizontalIter, m_ImageVerticalIter;

  const Scene *m_ActiveScene = nullptr;
  const Camera *m_ActiveCamera = nullptr;

  uint32_t *m_ImageData = nullptr;
  glm::vec4 *m_AccumulationData = nullptr;

  uint32_t m_FrameIndex = 1;
};

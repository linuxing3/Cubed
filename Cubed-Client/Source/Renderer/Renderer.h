#pragma once

#include "glad/gl.h"
#include <GL/gl.h>

#include "glm/fwd.hpp"
#include "glm/glm.hpp"

#include <filesystem>

namespace Cubed {

class Renderer {
public:
  void Init();
  void Shutdown();

  void Render();
  void RenderCube(const glm::vec3 &position);
  void RenderUI();

private:
  void InitPipeline();
  void InitBuffers();

  void CreateOrResizeBuffer(GLuint &buffer, uint64_t newSize);

private:
  GLuint m_Vertexbuffer;
  GLuint m_Colorbuffer;
  GLuint m_Trianglebuff;
  GLuint m_Trianglecolorbuff;

  GLuint m_ShaderProgramID;

  glm::mat4 m_MVP;
  GLuint m_MatrixID;

  GLuint m_VertexArrayID;


  struct PushConstants {
    glm::mat4 ViewProjection;
    glm::mat4 Transform;
  } m_PushConstants;

  glm::vec3 m_CubePosition{0};
  glm::vec3 m_CubeRotation{0};

  glm::vec3 m_CameraPosition{0, 0, 3};
  glm::vec3 m_CameraRotation{0};
  float m_CubeScale = 0.1f;
};

} // namespace Cubed

#include "Renderer.h"
#include "shared.h"

#include "GUI/Walnut/Application.h"
#include "GUI/Walnut/Image.h"
#include "Walnut/Core/Log.h"
#include "Walnut/Shader.h"
#include "imgui.h"

#include "glm/gtc/matrix_transform.hpp"
#include "glm/gtc/type_ptr.hpp"
#include "glm/gtx/euler_angles.hpp"
#include <array>
#include <fstream>

using namespace glm;

namespace Cubed {

void Renderer::Init() {
  InitBuffers();
  InitPipeline();
}

void Renderer::Shutdown() {
  glDeleteBuffers(1, &m_Vertexbuffer);
  glDeleteBuffers(1, &m_Colorbuffer);
  glDeleteProgram(m_ShaderProgramID);
  glDeleteVertexArrays(1, &m_VertexArrayID);
}

void Renderer::Render() {

  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

  // Use our shader
  glUseProgram(m_ShaderProgramID);

  // Send our transformation to the currently bound shader,
  // in the "MVP" uniform
  glUniformMatrix4fv(m_MatrixID, 1, GL_FALSE, &m_MVP[0][0]);

  // 1rst attribute buffer : vertices
  glEnableVertexAttribArray(0);
  glBindBuffer(GL_ARRAY_BUFFER, m_Vertexbuffer);
  glVertexAttribPointer(0, // attribute. No particular reason for 0, but must
                           // match the layout in the shader.
                        3, // size
                        GL_FLOAT, // type
                        GL_FALSE, // normalized?
                        0,        // stride
                        (void *)0 // array buffer offset
  );

  // 2nd attribute buffer : colors
  glEnableVertexAttribArray(1);
  glBindBuffer(GL_ARRAY_BUFFER, m_Colorbuffer);
  glVertexAttribPointer(1, // attribute. No particular reason for 1, but must
                           // match the layout in the shader.
                        3, // size
                        GL_FLOAT, // type
                        GL_FALSE, // normalized?
                        0,        // stride
                        (void *)0 // array buffer offset
  );

  // Draw the triangle !
  glDrawArrays(GL_TRIANGLES, 0,
               12 * 3); // 12*3 indices starting at 0 -> 12 triangles

  glDisableVertexAttribArray(0);
  glDisableVertexAttribArray(1);
}

void Renderer::RenderUI() {

  ImGui::Begin("Controls");

  // ImGui::DragFloat3("Position", glm::value_ptr(m_CubePosition), 0.05f);
  // ImGui::DragFloat3("Rotation", glm::value_ptr(m_CubeRotation), 0.05f);

  ImGui::DragFloat3("Position", glm::value_ptr(m_MVP), 0.05f);
  // ImGui::DragFloat3("Rotation", glm::value_ptr(m_CameraRotation), 0.05f);
  // ImGui::DragFloat("Scale", &m_CubeScale, 0.0005f);

  ImGui::End();
}

void Renderer::InitPipeline() {

  glGenVertexArrays(1, &m_VertexArrayID);
  glBindVertexArray(m_VertexArrayID);

  const std::filesystem::path &vs =
      "Cubed-Client/Assets/Shaders/TransformVertexShader.vertexshader";
  const std::filesystem::path &fs =
      "Cubed-Client/Assets/Shaders/ColorFragmentShader.fragmentshader";
  m_ShaderProgramID = CreateGraphicsShader(vs, fs);

  // Get a handle for our "MVP" uniform
  m_MatrixID = glGetUniformLocation(m_ShaderProgramID, "MVP");

  // Projection matrix : 45� Field of View, 4:3 ratio, display range : 0.1 unit
  // <-> 100 units
  glm::mat4 Projection =
      glm::perspective(glm::radians(45.0f), 4.0f / 3.0f, 0.1f, 100.0f);
  // Camera matrix
  glm::mat4 View = glm::lookAt(
      glm::vec3(4, 3, -3), // Camera is at (4,3,-3), in World Space
      glm::vec3(0, 0, 0),  // and looks at the origin
      glm::vec3(0, 1, 0)   // Head is up (set to 0,-1,0 to look upside-down)
  );
  // Model matrix : an identity matrix (model will be at the origin)
  glm::mat4 Model = glm::mat4(1.0f);
  // Our ModelViewProjection : multiplication of our 3 matrices
  m_MVP = Projection * View *
          Model; // Remember, matrix multiplication is the other way around
}

void Renderer::InitBuffers() {

  glGenBuffers(1, &m_Vertexbuffer);
  glBindBuffer(GL_ARRAY_BUFFER, m_Vertexbuffer);
  glBufferData(GL_ARRAY_BUFFER, sizeof(g_vertex_buffer_data),
               g_vertex_buffer_data, GL_STATIC_DRAW);

  glGenBuffers(1, &m_Colorbuffer);
  glBindBuffer(GL_ARRAY_BUFFER, m_Colorbuffer);
  glBufferData(GL_ARRAY_BUFFER, sizeof(g_color_buffer_data),
               g_color_buffer_data, GL_STATIC_DRAW);
}
} // namespace Cubed

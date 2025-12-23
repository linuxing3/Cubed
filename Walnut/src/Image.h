#pragma once

#include <glad/gl.h>
#include <iostream>
#include <memory>
#define GLFW_INCLUDE_NONE
#include <GLFW/glfw3.h>

#include <filesystem>

namespace Walnut {
struct Texture {
  GLuint Handle = 0;
  uint32_t Width = 0;
  uint32_t Height = 0;
};

struct Framebuffer {
  GLuint Handle = 0;
  Texture ColorAttachment;
};

class Image {

private:
  Texture m_Texture;
  Framebuffer m_frameBuffer;

public:
  GLenum m_Format = GL_RGBA;
  const std::filesystem::path m_Path;

public:
  Image(const std::filesystem::path &path) {
    m_Texture = LoadTexture(path);
    m_frameBuffer = CreateFramebufferWithTexture(m_Texture);
  };
  Image(uint32_t width, uint32_t height) {
    m_Texture = AllocateMemory(width, height);
    m_frameBuffer = CreateFramebufferWithTexture(m_Texture);
  };
  ~Image() = default;
  Image() = default;

public:
  int GetWidth() { return m_Texture.Width; };
  int GetHeight() { return m_Texture.Height; };
  Texture GetTexture() { return m_Texture; };
  Framebuffer GetFramebuffer() { return m_frameBuffer; };

public:
  Texture AllocateMemory(int width, int height);

  void SetData(const Texture texture) {
    AttachTextureToFramebuffer(m_frameBuffer, texture);
  }
  void SetData(const void *data, size_t data_size);

  void Resize(int width, int height) {
    if (width != m_Texture.Width || height != m_Texture.Height) {
      std::cout << "resizing " << std::endl;
      glDeleteTextures(1, &m_Texture.Handle);
      m_Texture = AllocateMemory(width, height);
      SetData(m_Texture);
    }
  }

  // helpers
  Texture LoadTexture(const std::filesystem::path &path);
  Framebuffer CreateFramebufferWithTexture(const Texture texture);
  bool AttachTextureToFramebuffer(Framebuffer &framebuffer,
                                  const Texture texture);
  void BlitFramebufferToSwapchain(const Framebuffer framebuffer);
};

} // namespace Walnut

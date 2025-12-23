#pragma once

#include <glad/gl.h>
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
  uint32_t m_Width = 0;
  uint32_t m_Height = 0;
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
  uint32_t GetWidth() { return m_Width; };
  uint32_t GetHeight() { return m_Height; };
  Texture GetTexture() { return m_Texture; };
  Framebuffer GetFramebuffer() { return m_frameBuffer; };

public:
  Texture AllocateMemory(int width, int height);

  void SetData(const Texture texture) {
    AttachTextureToFramebuffer(m_frameBuffer, texture);
  }

  void Resize(int width, int height) {
    if (width != m_Width || height != m_Height) {
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

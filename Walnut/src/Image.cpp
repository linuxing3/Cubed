#include "Image.h"

#include <iostream>

#include "stb_image.h"
#include <glad/gl.h>

namespace Walnut {

Texture Image::AllocateMemory(int width, int height) {
  Texture result;
  result.Width = width;
  result.Height = height;

  glCreateTextures(GL_TEXTURE_2D, 1, &result.Handle);

  glTextureStorage2D(result.Handle, 1, GL_RGBA32F, width, height);

  glTextureParameteri(result.Handle, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
  glTextureParameteri(result.Handle, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

  glTextureParameteri(result.Handle, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
  glTextureParameteri(result.Handle, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

  return result;
}

Texture Image::LoadTexture(const std::filesystem::path &path) {
  int width, height, channels;
  std::string filepath = path.string();
  unsigned char *data =
      stbi_load(filepath.c_str(), &width, &height, &channels, 0);

  if (!data) {
    std::cerr << "Failed to load texture: " << filepath << "\n";
    return {};
  }

  GLenum format = channels == 4   ? GL_RGBA
                  : channels == 3 ? GL_RGB
                  : channels == 1 ? GL_RED
                                  : 0;

  Texture result;
  result.Width = width;
  result.Height = height;

  glCreateTextures(GL_TEXTURE_2D, 1, &result.Handle);

  glTextureStorage2D(result.Handle, 1, (format == GL_RGBA ? GL_RGBA8 : GL_RGB8),
                     width, height);

  glTextureSubImage2D(result.Handle, 0, 0, 0, width, height, format,
                      GL_UNSIGNED_BYTE, data);

  glTextureParameteri(result.Handle, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  glTextureParameteri(result.Handle, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

  glTextureParameteri(result.Handle, GL_TEXTURE_WRAP_S, GL_REPEAT);
  glTextureParameteri(result.Handle, GL_TEXTURE_WRAP_T, GL_REPEAT);

  glGenerateTextureMipmap(result.Handle);
  stbi_image_free(data);

  return result;
}

Framebuffer Image::CreateFramebufferWithTexture(const Texture texture) {
  Framebuffer result;

  glCreateFramebuffers(1, &result.Handle);

  if (!AttachTextureToFramebuffer(result, texture)) {
    glDeleteFramebuffers(1, &result.Handle);
    return {};
  }

  return result;
}

bool Image::AttachTextureToFramebuffer(Framebuffer &framebuffer,
                                       const Texture texture) {
  glNamedFramebufferTexture(framebuffer.Handle, GL_COLOR_ATTACHMENT0,
                            texture.Handle, 0);

  if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE) {
    std::cerr << "Framebuffer is not complete!" << std::endl;
    return false;
  }

  framebuffer.ColorAttachment = texture;
  return true;
}

void Image::BlitFramebufferToSwapchain(const Framebuffer framebuffer) {
  glBindFramebuffer(GL_READ_FRAMEBUFFER, framebuffer.Handle);
  glBindFramebuffer(GL_DRAW_FRAMEBUFFER, 0); // swapchain

  glBlitFramebuffer(0, 0, framebuffer.ColorAttachment.Width,
                    framebuffer.ColorAttachment.Height, // Source rect
                    0, 0, framebuffer.ColorAttachment.Width,
                    framebuffer.ColorAttachment.Height, // Destination rect
                    GL_COLOR_BUFFER_BIT, GL_NEAREST);
}
void Image::SetData(const void *data, size_t data_size) {

  int image_width = 0;
  int image_height = 0;
  unsigned char *image_data =
      stbi_load_from_memory((const unsigned char *)data, (int)data_size,
                            &image_width, &image_height, NULL, 4);

  m_Texture.Width = image_width;
  m_Texture.Height = image_height;

  // Create a OpenGL texture identifier
  glGenTextures(1, &m_Texture.Handle);
  glBindTexture(GL_TEXTURE_2D, m_Texture.Handle);

  // Setup filtering parameters for display
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

  // Upload pixels into texture
  glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
  glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA32F, image_width, image_height, 0,
               GL_RGBA32F, GL_UNSIGNED_BYTE, image_data);
  stbi_image_free(image_data);

  m_Texture.Width = image_width;
  m_Texture.Height = image_height;

  SetData(m_Texture);
}
} // namespace Walnut

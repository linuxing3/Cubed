add_library("Walnut" STATIC
        "Walnut/Walnut/Platform/GUI/Raylib/Application.cpp"
        "Walnut/Walnut/Platform/GUI/Raylib/Application.h"
        "Walnut/Walnut/Platform/GUI/Walnut/Application.cpp"
        "Walnut/Walnut/Platform/GUI/Walnut/Application.h"
          "Walnut/Walnut/Platform/GUI/Walnut/ImGui/ImGuiTheme.cpp"
          "Walnut/Walnut/Platform/GUI/Walnut/ImGui/ImGuiTheme.h"
          "Walnut/Walnut/Platform/GUI/Walnut/ImGui/imgui_impl_glfw.cpp"
          "Walnut/Walnut/Platform/GUI/Walnut/ImGui/imgui_impl_opengl3.cpp"
        "Walnut/Walnut/Platform/GUI/Walnut/Image.cpp"
        "Walnut/Walnut/Platform/GUI/Walnut/Image.h"
          "Walnut/Walnut/Platform/GUI/Walnut/Input/Input.cpp"
          "Walnut/Walnut/Platform/GUI/Walnut/Input/Input.h"
          "Walnut/Walnut/Platform/GUI/Walnut/Input/KeyCodes.h"
      "Walnut/Walnut/Source/Raylib/EntryPoint.h"
        "Walnut/Walnut/Source/Walnut/Core/Assert.h"
        "Walnut/Walnut/Source/Walnut/Core/Buffer.h"
        "Walnut/Walnut/Source/Walnut/Core/Log.cpp"
        "Walnut/Walnut/Source/Walnut/Core/Log.h"
        "Walnut/Walnut/Source/Walnut/Core/LogCustomFormatters.h"
      "Walnut/Walnut/Source/Walnut/EntryPoint.h"
      "Walnut/Walnut/Source/Walnut/Layer.h"
      "Walnut/Walnut/Source/Walnut/Random.cpp"
      "Walnut/Walnut/Source/Walnut/Random.h"
        "Walnut/Walnut/Source/Walnut/Serialization/BufferStream.cpp"
        "Walnut/Walnut/Source/Walnut/Serialization/BufferStream.h"
        "Walnut/Walnut/Source/Walnut/Serialization/FileStream.cpp"
        "Walnut/Walnut/Source/Walnut/Serialization/FileStream.h"
        "Walnut/Walnut/Source/Walnut/Serialization/StreamReader.cpp"
        "Walnut/Walnut/Source/Walnut/Serialization/StreamReader.h"
        "Walnut/Walnut/Source/Walnut/Serialization/StreamWriter.cpp"
        "Walnut/Walnut/Source/Walnut/Serialization/StreamWriter.h"
      "Walnut/Walnut/Source/Walnut/Shader.cpp"
      "Walnut/Walnut/Source/Walnut/Shader.h"
      "Walnut/Walnut/Source/Walnut/Timer.h"
        "Walnut/Walnut/Source/Walnut/Utils/StringUtils.cpp"
        "Walnut/Walnut/Source/Walnut/Utils/StringUtils.h"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_dependencies("Walnut"
    "ImGui"
    "rlImGui"
    "raylib"
    "glad"
    "yaml-cpp"
    "stb"
  )
  set_target_properties("Walnut" PROPERTIES
    OUTPUT_NAME "Walnut"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Debug-linux-ARM64/Walnut"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Debug-linux-ARM64/Walnut"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Debug-linux-ARM64/Walnut"
  )
endif()
target_include_directories("Walnut" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/Walnut/Platform>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/rlImGui/raylib-master/src>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/imgui/backends>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glad/include>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/yaml-cpp/include>
)
target_compile_definitions("Walnut" PRIVATE
  $<$<CONFIG:Debug>:DEBUG>
  $<$<CONFIG:Debug>:_GLFW_X11>
  $<$<CONFIG:Debug>:_GNU_SOURCE>
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("Walnut" PRIVATE
)
target_link_libraries("Walnut"
  $<$<CONFIG:Debug>:ImGui>
  $<$<CONFIG:Debug>:rlImGui>
  $<$<CONFIG:Debug>:raylib>
  $<$<CONFIG:Debug>:glad>
  $<$<CONFIG:Debug>:yaml-cpp>
  $<$<CONFIG:Debug>:stb>
  $<$<CONFIG:Debug>:glfw>
  $<$<CONFIG:Debug>:GL>
  $<$<CONFIG:Debug>:X11>
  $<$<CONFIG:Debug>:xcb>
  $<$<CONFIG:Debug>:Xau>
  $<$<CONFIG:Debug>:Xdmcp>
  $<$<CONFIG:Debug>:pthread>
  $<$<CONFIG:Debug>:rt>
  $<$<CONFIG:Debug>:m>
  $<$<CONFIG:Debug>:stdc++fs>
  $<$<CONFIG:Debug>:dl>
)
target_compile_options("Walnut" PRIVATE
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("Walnut" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  add_dependencies("Walnut"
    "ImGui"
    "rlImGui"
    "raylib"
    "glad"
    "yaml-cpp"
    "stb"
  )
  set_target_properties("Walnut" PROPERTIES
    OUTPUT_NAME "Walnut"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Release-linux-ARM64/Walnut"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Release-linux-ARM64/Walnut"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Release-linux-ARM64/Walnut"
  )
endif()
target_include_directories("Walnut" PRIVATE
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/Walnut/Platform>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/rlImGui/raylib-master/src>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/imgui/backends>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glad/include>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/yaml-cpp/include>
)
target_compile_definitions("Walnut" PRIVATE
  $<$<CONFIG:Release>:NDEBUG>
  $<$<CONFIG:Release>:_GLFW_X11>
  $<$<CONFIG:Release>:_GNU_SOURCE>
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("Walnut" PRIVATE
)
target_link_libraries("Walnut"
  $<$<CONFIG:Release>:ImGui>
  $<$<CONFIG:Release>:rlImGui>
  $<$<CONFIG:Release>:raylib>
  $<$<CONFIG:Release>:glad>
  $<$<CONFIG:Release>:yaml-cpp>
  $<$<CONFIG:Release>:stb>
  $<$<CONFIG:Release>:glfw>
  $<$<CONFIG:Release>:GL>
  $<$<CONFIG:Release>:X11>
  $<$<CONFIG:Release>:xcb>
  $<$<CONFIG:Release>:Xau>
  $<$<CONFIG:Release>:Xdmcp>
  $<$<CONFIG:Release>:pthread>
  $<$<CONFIG:Release>:rt>
  $<$<CONFIG:Release>:m>
  $<$<CONFIG:Release>:stdc++fs>
  $<$<CONFIG:Release>:dl>
)
target_compile_options("Walnut" PRIVATE
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("Walnut" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
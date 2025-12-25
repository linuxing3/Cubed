add_library("Walnut" STATIC
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
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/imgui/backends>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glad/include>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/yaml-cpp/include>
)
target_compile_definitions("Walnut" PRIVATE
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("Walnut" PRIVATE
)
target_link_libraries("Walnut"
  $<$<CONFIG:Debug>:ImGui>
  $<$<CONFIG:Debug>:glad>
  $<$<CONFIG:Debug>:yaml-cpp>
  $<$<CONFIG:Debug>:stb>
  $<$<CONFIG:Debug>:glfw>
  $<$<CONFIG:Debug>:X11>
  $<$<CONFIG:Debug>:GL>
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
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/imgui/backends>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glad/include>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/yaml-cpp/include>
)
target_compile_definitions("Walnut" PRIVATE
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("Walnut" PRIVATE
)
target_link_libraries("Walnut"
  $<$<CONFIG:Release>:ImGui>
  $<$<CONFIG:Release>:glad>
  $<$<CONFIG:Release>:yaml-cpp>
  $<$<CONFIG:Release>:stb>
  $<$<CONFIG:Release>:glfw>
  $<$<CONFIG:Release>:X11>
  $<$<CONFIG:Release>:GL>
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
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  add_dependencies("Walnut"
    "ImGui"
    "glad"
    "yaml-cpp"
    "stb"
  )
  set_target_properties("Walnut" PROPERTIES
    OUTPUT_NAME "Walnut"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Dist-linux-ARM64/Walnut"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Dist-linux-ARM64/Walnut"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Dist-linux-ARM64/Walnut"
  )
endif()
target_include_directories("Walnut" PRIVATE
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/Walnut/Platform>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/imgui/backends>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glad/include>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/yaml-cpp/include>
)
target_compile_definitions("Walnut" PRIVATE
  $<$<CONFIG:Dist>:WL_DIST>
)
target_link_directories("Walnut" PRIVATE
)
target_link_libraries("Walnut"
  $<$<CONFIG:Dist>:ImGui>
  $<$<CONFIG:Dist>:glad>
  $<$<CONFIG:Dist>:yaml-cpp>
  $<$<CONFIG:Dist>:stb>
  $<$<CONFIG:Dist>:glfw>
  $<$<CONFIG:Dist>:X11>
  $<$<CONFIG:Dist>:GL>
)
target_compile_options("Walnut" PRIVATE
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("Walnut" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
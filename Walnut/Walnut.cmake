add_library("Walnut" STATIC
  "Walnut/src/Image.cpp"
  "Walnut/src/Image.h"
  "Walnut/src/Renderer.cpp"
  "Walnut/src/Renderer.h"
  "Walnut/src/Shader.cpp"
  "Walnut/src/Shader.h"
  "Walnut/src/imgui_impl_glfw.cpp"
  "Walnut/src/imgui_impl_glfw.h"
  "Walnut/src/imgui_impl_opengl3.cpp"
  "Walnut/src/imgui_impl_opengl3.h"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_dependencies("Walnut"
    "ImGui"
    "GLFW"
    "glad"
  )
  set_target_properties("Walnut" PROPERTIES
    OUTPUT_NAME "Walnut"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Debug-linux-ARM64/Walnut"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Debug-linux-ARM64/Walnut"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Debug-linux-ARM64/Walnut"
  )
endif()
target_include_directories("Walnut" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/glfw-app/vendor/glad/include>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/vendor/stb>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/vendor/imgui>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/vendor/imgui/backends>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/vendor/glfw/include>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glm>
)
target_compile_definitions("Walnut" PRIVATE
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("Walnut" PRIVATE
)
target_link_libraries("Walnut"
  $<$<CONFIG:Debug>:ImGui>
  $<$<CONFIG:Debug>:GLFW>
  $<$<CONFIG:Debug>:glad>
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
    "GLFW"
    "glad"
  )
  set_target_properties("Walnut" PROPERTIES
    OUTPUT_NAME "Walnut"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Release-linux-ARM64/Walnut"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Release-linux-ARM64/Walnut"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Release-linux-ARM64/Walnut"
  )
endif()
target_include_directories("Walnut" PRIVATE
  $<$<CONFIG:Release>:/share/sources/glfw-app/vendor/glad/include>
  $<$<CONFIG:Release>:/share/sources/glfw-app/vendor/stb>
  $<$<CONFIG:Release>:/share/sources/glfw-app/vendor/imgui>
  $<$<CONFIG:Release>:/share/sources/glfw-app/vendor/imgui/backends>
  $<$<CONFIG:Release>:/share/sources/glfw-app/vendor/glfw/include>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glm>
)
target_compile_definitions("Walnut" PRIVATE
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("Walnut" PRIVATE
)
target_link_libraries("Walnut"
  $<$<CONFIG:Release>:ImGui>
  $<$<CONFIG:Release>:GLFW>
  $<$<CONFIG:Release>:glad>
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
    "GLFW"
    "glad"
  )
  set_target_properties("Walnut" PROPERTIES
    OUTPUT_NAME "Walnut"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Dist-linux-ARM64/Walnut"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Dist-linux-ARM64/Walnut"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Dist-linux-ARM64/Walnut"
  )
endif()
target_include_directories("Walnut" PRIVATE
  $<$<CONFIG:Dist>:/share/sources/glfw-app/vendor/glad/include>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/vendor/stb>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/vendor/imgui>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/vendor/imgui/backends>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/vendor/glfw/include>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glm>
)
target_compile_definitions("Walnut" PRIVATE
  $<$<CONFIG:Dist>:WL_DIST>
)
target_link_directories("Walnut" PRIVATE
)
target_link_libraries("Walnut"
  $<$<CONFIG:Dist>:ImGui>
  $<$<CONFIG:Dist>:GLFW>
  $<$<CONFIG:Dist>:glad>
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
add_library("Walnut" STATIC
  "Walnut/src/Application.cpp"
  "Walnut/src/Application.h"
  "Walnut/src/EntryPoint.h"
    "Walnut/src/ImGui/imgui_impl_glfw.cpp"
    "Walnut/src/ImGui/imgui_impl_opengl3.cpp"
  "Walnut/src/Image.cpp"
  "Walnut/src/Image.h"
    "Walnut/src/Input/Input.cpp"
    "Walnut/src/Input/Input.h"
    "Walnut/src/Input/KeyCodes.h"
  "Walnut/src/Layer.h"
  "Walnut/src/Random.cpp"
  "Walnut/src/Random.h"
  "Walnut/src/Shader.cpp"
  "Walnut/src/Shader.h"
  "Walnut/src/Timer.h"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_dependencies("Walnut"
    "ImGui"
    "glad"
    "stb"
  )
  set_target_properties("Walnut" PROPERTIES
    OUTPUT_NAME "Walnut"
    ARCHIVE_OUTPUT_DIRECTORY "/share/data/sources/development-projects/glfw-app/bin/Debug-linux-ARM64/Walnut"
    LIBRARY_OUTPUT_DIRECTORY "/share/data/sources/development-projects/glfw-app/bin/Debug-linux-ARM64/Walnut"
    RUNTIME_OUTPUT_DIRECTORY "/share/data/sources/development-projects/glfw-app/bin/Debug-linux-ARM64/Walnut"
  )
endif()
target_include_directories("Walnut" PRIVATE
  $<$<CONFIG:Debug>:/share/data/sources/development-projects/glfw-app/Walnut/src>
  $<$<CONFIG:Debug>:/share/data/sources/development-projects/glfw-app/vendor/glad/include>
  $<$<CONFIG:Debug>:/share/data/sources/development-projects/glfw-app/vendor>
  $<$<CONFIG:Debug>:/share/data/sources/development-projects/glfw-app/vendor/imgui>
  $<$<CONFIG:Debug>:/share/data/sources/development-projects/glfw-app/vendor/imgui/backends>
  $<$<CONFIG:Debug>:/share/data/sources/development-projects/glfw-app/vendor/glm>
)
target_compile_definitions("Walnut" PRIVATE
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("Walnut" PRIVATE
)
target_link_libraries("Walnut"
  $<$<CONFIG:Debug>:ImGui>
  $<$<CONFIG:Debug>:glad>
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
    "stb"
  )
  set_target_properties("Walnut" PROPERTIES
    OUTPUT_NAME "Walnut"
    ARCHIVE_OUTPUT_DIRECTORY "/share/data/sources/development-projects/glfw-app/bin/Release-linux-ARM64/Walnut"
    LIBRARY_OUTPUT_DIRECTORY "/share/data/sources/development-projects/glfw-app/bin/Release-linux-ARM64/Walnut"
    RUNTIME_OUTPUT_DIRECTORY "/share/data/sources/development-projects/glfw-app/bin/Release-linux-ARM64/Walnut"
  )
endif()
target_include_directories("Walnut" PRIVATE
  $<$<CONFIG:Release>:/share/data/sources/development-projects/glfw-app/Walnut/src>
  $<$<CONFIG:Release>:/share/data/sources/development-projects/glfw-app/vendor/glad/include>
  $<$<CONFIG:Release>:/share/data/sources/development-projects/glfw-app/vendor>
  $<$<CONFIG:Release>:/share/data/sources/development-projects/glfw-app/vendor/imgui>
  $<$<CONFIG:Release>:/share/data/sources/development-projects/glfw-app/vendor/imgui/backends>
  $<$<CONFIG:Release>:/share/data/sources/development-projects/glfw-app/vendor/glm>
)
target_compile_definitions("Walnut" PRIVATE
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("Walnut" PRIVATE
)
target_link_libraries("Walnut"
  $<$<CONFIG:Release>:ImGui>
  $<$<CONFIG:Release>:glad>
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
    "stb"
  )
  set_target_properties("Walnut" PROPERTIES
    OUTPUT_NAME "Walnut"
    ARCHIVE_OUTPUT_DIRECTORY "/share/data/sources/development-projects/glfw-app/bin/Dist-linux-ARM64/Walnut"
    LIBRARY_OUTPUT_DIRECTORY "/share/data/sources/development-projects/glfw-app/bin/Dist-linux-ARM64/Walnut"
    RUNTIME_OUTPUT_DIRECTORY "/share/data/sources/development-projects/glfw-app/bin/Dist-linux-ARM64/Walnut"
  )
endif()
target_include_directories("Walnut" PRIVATE
  $<$<CONFIG:Dist>:/share/data/sources/development-projects/glfw-app/Walnut/src>
  $<$<CONFIG:Dist>:/share/data/sources/development-projects/glfw-app/vendor/glad/include>
  $<$<CONFIG:Dist>:/share/data/sources/development-projects/glfw-app/vendor>
  $<$<CONFIG:Dist>:/share/data/sources/development-projects/glfw-app/vendor/imgui>
  $<$<CONFIG:Dist>:/share/data/sources/development-projects/glfw-app/vendor/imgui/backends>
  $<$<CONFIG:Dist>:/share/data/sources/development-projects/glfw-app/vendor/glm>
)
target_compile_definitions("Walnut" PRIVATE
  $<$<CONFIG:Dist>:WL_DIST>
)
target_link_directories("Walnut" PRIVATE
)
target_link_libraries("Walnut"
  $<$<CONFIG:Dist>:ImGui>
  $<$<CONFIG:Dist>:glad>
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
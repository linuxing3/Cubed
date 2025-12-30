add_executable("RaylibApp"
  "Walnut/RaylibApp/Source/ComputeLayer.h"
  "Walnut/RaylibApp/Source/CubeLayer.h"
  "Walnut/RaylibApp/Source/GridLayer.h"
  "Walnut/RaylibApp/Source/RaylibApp.cpp"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_dependencies("RaylibApp"
    "Walnut"
    "rlImGui"
    "raylib"
  )
  set_target_properties("RaylibApp" PROPERTIES
    OUTPUT_NAME "RaylibApp"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Debug-linux-ARM64/RaylibApp"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Debug-linux-ARM64/RaylibApp"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Debug-linux-ARM64/RaylibApp"
  )
endif()
target_include_directories("RaylibApp" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/RaylibApp/Source>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/Walnut/Platform>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/rlImGui/raylib-master/src>
)
target_compile_definitions("RaylibApp" PRIVATE
  $<$<CONFIG:Debug>:DEBUG>
  $<$<CONFIG:Debug>:_GLFW_X11>
  $<$<CONFIG:Debug>:_GNU_SOURCE>
  $<$<CONFIG:Debug>:RAYLIB_APP>
  $<$<CONFIG:Debug>:IMGUI_HAS_DOCK>
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("RaylibApp" PRIVATE
)
target_link_libraries("RaylibApp"
  $<$<CONFIG:Debug>:Walnut>
  $<$<CONFIG:Debug>:rlImGui>
  $<$<CONFIG:Debug>:raylib>
  $<$<CONFIG:Debug>:glfw>
)
target_compile_options("RaylibApp" PRIVATE
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("RaylibApp" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  add_dependencies("RaylibApp"
    "Walnut"
    "rlImGui"
    "raylib"
  )
  set_target_properties("RaylibApp" PROPERTIES
    OUTPUT_NAME "RaylibApp"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Release-linux-ARM64/RaylibApp"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Release-linux-ARM64/RaylibApp"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Release-linux-ARM64/RaylibApp"
  )
endif()
target_include_directories("RaylibApp" PRIVATE
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/RaylibApp/Source>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/Walnut/Platform>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/rlImGui/raylib-master/src>
)
target_compile_definitions("RaylibApp" PRIVATE
  $<$<CONFIG:Release>:NDEBUG>
  $<$<CONFIG:Release>:_GLFW_X11>
  $<$<CONFIG:Release>:_GNU_SOURCE>
  $<$<CONFIG:Release>:RAYLIB_APP>
  $<$<CONFIG:Release>:IMGUI_HAS_DOCK>
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("RaylibApp" PRIVATE
)
target_link_libraries("RaylibApp"
  $<$<CONFIG:Release>:Walnut>
  $<$<CONFIG:Release>:rlImGui>
  $<$<CONFIG:Release>:raylib>
  $<$<CONFIG:Release>:glfw>
)
target_compile_options("RaylibApp" PRIVATE
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("RaylibApp" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
add_executable("WalnutApp"
  "Walnut/WalnutApp/Source/Camera.cpp"
  "Walnut/WalnutApp/Source/Camera.h"
  "Walnut/WalnutApp/Source/ComputerLayer.h"
  "Walnut/WalnutApp/Source/Ray.h"
  "Walnut/WalnutApp/Source/Renderer.cpp"
  "Walnut/WalnutApp/Source/Renderer.h"
  "Walnut/WalnutApp/Source/Scene.h"
  "Walnut/WalnutApp/Source/WalnutApp.cpp"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_dependencies("WalnutApp"
    "Walnut"
    "ImGui"
    "glad"
    "stb"
  )
  set_target_properties("WalnutApp" PROPERTIES
    OUTPUT_NAME "WalnutApp"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Debug-linux-ARM64/WalnutApp"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Debug-linux-ARM64/WalnutApp"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Debug-linux-ARM64/WalnutApp"
  )
endif()
target_include_directories("WalnutApp" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/WalnutApp/Source>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/Walnut/Platform>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glad/include>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/imgui/backends>
)
target_compile_definitions("WalnutApp" PRIVATE
  $<$<CONFIG:Debug>:DEBUG>
  $<$<CONFIG:Debug>:_GLFW_X11>
  $<$<CONFIG:Debug>:_GNU_SOURCE>
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("WalnutApp" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glfw/lib>
)
target_link_libraries("WalnutApp"
  $<$<CONFIG:Debug>:Walnut>
  $<$<CONFIG:Debug>:ImGui>
  $<$<CONFIG:Debug>:glad>
  $<$<CONFIG:Debug>:stb>
  $<$<CONFIG:Debug>:glfw>
  $<$<CONFIG:Debug>:dl>
  $<$<CONFIG:Debug>:pthread>
  $<$<CONFIG:Debug>:X11>
  $<$<CONFIG:Debug>:GL>
  $<$<CONFIG:Debug>:rt>
  $<$<CONFIG:Debug>:m>
  $<$<CONFIG:Debug>:stdc++fs>
)
target_compile_options("WalnutApp" PRIVATE
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("WalnutApp" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  add_dependencies("WalnutApp"
    "Walnut"
    "ImGui"
    "glad"
    "stb"
  )
  set_target_properties("WalnutApp" PROPERTIES
    OUTPUT_NAME "WalnutApp"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Release-linux-ARM64/WalnutApp"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Release-linux-ARM64/WalnutApp"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Release-linux-ARM64/WalnutApp"
  )
endif()
target_include_directories("WalnutApp" PRIVATE
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/WalnutApp/Source>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/Walnut/Platform>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glad/include>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/imgui/backends>
)
target_compile_definitions("WalnutApp" PRIVATE
  $<$<CONFIG:Release>:NDEBUG>
  $<$<CONFIG:Release>:_GLFW_X11>
  $<$<CONFIG:Release>:_GNU_SOURCE>
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("WalnutApp" PRIVATE
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glfw/lib>
)
target_link_libraries("WalnutApp"
  $<$<CONFIG:Release>:Walnut>
  $<$<CONFIG:Release>:ImGui>
  $<$<CONFIG:Release>:glad>
  $<$<CONFIG:Release>:stb>
  $<$<CONFIG:Release>:glfw>
  $<$<CONFIG:Release>:dl>
  $<$<CONFIG:Release>:pthread>
  $<$<CONFIG:Release>:X11>
  $<$<CONFIG:Release>:GL>
  $<$<CONFIG:Release>:rt>
  $<$<CONFIG:Release>:m>
  $<$<CONFIG:Release>:stdc++fs>
)
target_compile_options("WalnutApp" PRIVATE
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("WalnutApp" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
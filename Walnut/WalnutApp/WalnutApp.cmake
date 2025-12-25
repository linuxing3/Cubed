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
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("WalnutApp" PRIVATE
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
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("WalnutApp" PRIVATE
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
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  add_dependencies("WalnutApp"
    "Walnut"
    "ImGui"
    "glad"
    "stb"
  )
  set_target_properties("WalnutApp" PROPERTIES
    OUTPUT_NAME "WalnutApp"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Dist-linux-ARM64/WalnutApp"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Dist-linux-ARM64/WalnutApp"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Dist-linux-ARM64/WalnutApp"
  )
endif()
target_include_directories("WalnutApp" PRIVATE
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/WalnutApp/Source>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/Walnut/Platform>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glad/include>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/imgui/backends>
)
target_compile_definitions("WalnutApp" PRIVATE
  $<$<CONFIG:Dist>:WL_DIST>
)
target_link_directories("WalnutApp" PRIVATE
)
target_link_libraries("WalnutApp"
  $<$<CONFIG:Dist>:Walnut>
  $<$<CONFIG:Dist>:ImGui>
  $<$<CONFIG:Dist>:glad>
  $<$<CONFIG:Dist>:stb>
  $<$<CONFIG:Dist>:glfw>
  $<$<CONFIG:Dist>:dl>
  $<$<CONFIG:Dist>:pthread>
  $<$<CONFIG:Dist>:X11>
  $<$<CONFIG:Dist>:GL>
  $<$<CONFIG:Dist>:rt>
  $<$<CONFIG:Dist>:m>
  $<$<CONFIG:Dist>:stdc++fs>
)
target_compile_options("WalnutApp" PRIVATE
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("WalnutApp" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
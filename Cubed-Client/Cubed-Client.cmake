add_executable("Cubed-Client"
  "Cubed-Client/Source/ClientLayer.cpp"
  "Cubed-Client/Source/ClientLayer.h"
  "Cubed-Client/Source/CubedApp.cpp"
    "Cubed-Client/Source/Renderer/Renderer.cpp"
    "Cubed-Client/Source/Renderer/Renderer.h"
    "Cubed-Client/Source/Renderer/shared.h"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_dependencies("Cubed-Client"
    "glad"
    "ImGui"
    "Walnut"
  )
  set_target_properties("Cubed-Client" PROPERTIES
    OUTPUT_NAME "Cubed-Client"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Debug-linux-ARM64/Cubed-Client"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Debug-linux-ARM64/Cubed-Client"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Debug-linux-ARM64/Cubed-Client"
  )
endif()
target_include_directories("Cubed-Client" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Cubed-Common/Source>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glad/include>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glfw/include>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/Walnut/Platform>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/Walnut-Modules/Walnut-Networking/Source>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/include>
)
target_compile_definitions("Cubed-Client" PRIVATE
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("Cubed-Client" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glfw/lib>
)
target_link_libraries("Cubed-Client"
  $<$<CONFIG:Debug>:glad>
  $<$<CONFIG:Debug>:ImGui>
  $<$<CONFIG:Debug>:Walnut>
  $<$<CONFIG:Debug>:glfw3>
  $<$<CONFIG:Debug>:X11>
  $<$<CONFIG:Debug>:xcb>
  $<$<CONFIG:Debug>:Xau>
  $<$<CONFIG:Debug>:Xdmcp>
  $<$<CONFIG:Debug>:pthread>
  $<$<CONFIG:Debug>:GL>
  $<$<CONFIG:Debug>:rt>
  $<$<CONFIG:Debug>:m>
  $<$<CONFIG:Debug>:dl>
)
target_compile_options("Cubed-Client" PRIVATE
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("Cubed-Client" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  add_dependencies("Cubed-Client"
    "glad"
    "ImGui"
    "Walnut"
  )
  set_target_properties("Cubed-Client" PROPERTIES
    OUTPUT_NAME "Cubed-Client"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Release-linux-ARM64/Cubed-Client"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Release-linux-ARM64/Cubed-Client"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Release-linux-ARM64/Cubed-Client"
  )
endif()
target_include_directories("Cubed-Client" PRIVATE
  $<$<CONFIG:Release>:/share/sources/glfw-app/Cubed-Common/Source>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glad/include>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glfw/include>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/Walnut/Platform>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/Walnut-Modules/Walnut-Networking/Source>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/include>
)
target_compile_definitions("Cubed-Client" PRIVATE
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("Cubed-Client" PRIVATE
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glfw/lib>
)
target_link_libraries("Cubed-Client"
  $<$<CONFIG:Release>:glad>
  $<$<CONFIG:Release>:ImGui>
  $<$<CONFIG:Release>:Walnut>
  $<$<CONFIG:Release>:glfw3>
  $<$<CONFIG:Release>:X11>
  $<$<CONFIG:Release>:xcb>
  $<$<CONFIG:Release>:Xau>
  $<$<CONFIG:Release>:Xdmcp>
  $<$<CONFIG:Release>:pthread>
  $<$<CONFIG:Release>:GL>
  $<$<CONFIG:Release>:rt>
  $<$<CONFIG:Release>:m>
  $<$<CONFIG:Release>:dl>
)
target_compile_options("Cubed-Client" PRIVATE
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("Cubed-Client" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  add_dependencies("Cubed-Client"
    "glad"
    "ImGui"
    "Walnut"
  )
  set_target_properties("Cubed-Client" PROPERTIES
    OUTPUT_NAME "Cubed-Client"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Dist-linux-ARM64/Cubed-Client"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Dist-linux-ARM64/Cubed-Client"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Dist-linux-ARM64/Cubed-Client"
  )
endif()
target_include_directories("Cubed-Client" PRIVATE
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Cubed-Common/Source>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glad/include>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glfw/include>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/Walnut/Platform>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/Walnut-Modules/Walnut-Networking/Source>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/include>
)
target_compile_definitions("Cubed-Client" PRIVATE
  $<$<CONFIG:Dist>:WL_DIST>
)
target_link_directories("Cubed-Client" PRIVATE
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glfw/lib>
)
target_link_libraries("Cubed-Client"
  $<$<CONFIG:Dist>:glad>
  $<$<CONFIG:Dist>:ImGui>
  $<$<CONFIG:Dist>:Walnut>
  $<$<CONFIG:Dist>:glfw3>
  $<$<CONFIG:Dist>:X11>
  $<$<CONFIG:Dist>:xcb>
  $<$<CONFIG:Dist>:Xau>
  $<$<CONFIG:Dist>:Xdmcp>
  $<$<CONFIG:Dist>:pthread>
  $<$<CONFIG:Dist>:GL>
  $<$<CONFIG:Dist>:rt>
  $<$<CONFIG:Dist>:m>
  $<$<CONFIG:Dist>:dl>
)
target_compile_options("Cubed-Client" PRIVATE
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("Cubed-Client" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
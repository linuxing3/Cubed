add_library("Cubed-Common" STATIC
  "Cubed-Common/Source/ServerPacket.cpp"
  "Cubed-Common/Source/ServerPacket.h"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_dependencies("Cubed-Common"
    "Walnut"
    "Walnut-Networking"
  )
  set_target_properties("Cubed-Common" PROPERTIES
    OUTPUT_NAME "Cubed-Common"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Debug-linux-ARM64/Cubed-Common"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Debug-linux-ARM64/Cubed-Common"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Debug-linux-ARM64/Cubed-Common"
  )
endif()
target_include_directories("Cubed-Common" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glfw/include>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut-Networking/Source>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut-Networking/vendor/GameNetworkingSockets/include>
)
target_compile_definitions("Cubed-Common" PRIVATE
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("Cubed-Common" PRIVATE
)
target_link_libraries("Cubed-Common"
  $<$<CONFIG:Debug>:Walnut>
  $<$<CONFIG:Debug>:Walnut-Networking>
)
target_compile_options("Cubed-Common" PRIVATE
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("Cubed-Common" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  add_dependencies("Cubed-Common"
    "Walnut"
    "Walnut-Networking"
  )
  set_target_properties("Cubed-Common" PROPERTIES
    OUTPUT_NAME "Cubed-Common"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Release-linux-ARM64/Cubed-Common"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Release-linux-ARM64/Cubed-Common"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Release-linux-ARM64/Cubed-Common"
  )
endif()
target_include_directories("Cubed-Common" PRIVATE
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glfw/include>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut-Networking/Source>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut-Networking/vendor/GameNetworkingSockets/include>
)
target_compile_definitions("Cubed-Common" PRIVATE
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("Cubed-Common" PRIVATE
)
target_link_libraries("Cubed-Common"
  $<$<CONFIG:Release>:Walnut>
  $<$<CONFIG:Release>:Walnut-Networking>
)
target_compile_options("Cubed-Common" PRIVATE
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("Cubed-Common" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  add_dependencies("Cubed-Common"
    "Walnut"
    "Walnut-Networking"
  )
  set_target_properties("Cubed-Common" PROPERTIES
    OUTPUT_NAME "Cubed-Common"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Dist-linux-ARM64/Cubed-Common"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Dist-linux-ARM64/Cubed-Common"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/bin/Dist-linux-ARM64/Cubed-Common"
  )
endif()
target_include_directories("Cubed-Common" PRIVATE
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glfw/include>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut-Networking/Source>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut-Networking/vendor/GameNetworkingSockets/include>
)
target_compile_definitions("Cubed-Common" PRIVATE
  $<$<CONFIG:Dist>:WL_DIST>
)
target_link_directories("Cubed-Common" PRIVATE
)
target_link_libraries("Cubed-Common"
  $<$<CONFIG:Dist>:Walnut>
  $<$<CONFIG:Dist>:Walnut-Networking>
)
target_compile_options("Cubed-Common" PRIVATE
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("Cubed-Common" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
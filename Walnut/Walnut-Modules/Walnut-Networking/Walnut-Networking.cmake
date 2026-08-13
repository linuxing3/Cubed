add_library("Walnut-Networking" STATIC
          "Walnut/Walnut-Modules/Walnut-Networking/Platform/Linux/Walnut/Networking/LinuxNetworkingUtils.cpp"
        "Walnut/Walnut-Modules/Walnut-Networking/Source/Walnut/Networking/Client.cpp"
        "Walnut/Walnut-Modules/Walnut-Networking/Source/Walnut/Networking/Client.h"
        "Walnut/Walnut-Modules/Walnut-Networking/Source/Walnut/Networking/NetworkingUtils.cpp"
        "Walnut/Walnut-Modules/Walnut-Networking/Source/Walnut/Networking/NetworkingUtils.h"
        "Walnut/Walnut-Modules/Walnut-Networking/Source/Walnut/Networking/Server.cpp"
        "Walnut/Walnut-Modules/Walnut-Networking/Source/Walnut/Networking/Server.h"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("Walnut-Networking" PROPERTIES
    OUTPUT_NAME "Walnut-Networking"
    ARCHIVE_OUTPUT_DIRECTORY "/share/data/sources/development-projects/glfw-app/Walnut/bin/Debug-linux-ARM64/Walnut-Networking"
    LIBRARY_OUTPUT_DIRECTORY "/share/data/sources/development-projects/glfw-app/Walnut/bin/Debug-linux-ARM64/Walnut-Networking"
    RUNTIME_OUTPUT_DIRECTORY "/share/data/sources/development-projects/glfw-app/Walnut/bin/Debug-linux-ARM64/Walnut-Networking"
  )
endif()
target_include_directories("Walnut-Networking" PRIVATE
  $<$<CONFIG:Debug>:/share/data/sources/development-projects/glfw-app/Walnut/Walnut-Modules/Walnut-Networking/Source>
  $<$<CONFIG:Debug>:/share/data/sources/development-projects/glfw-app/Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/include>
  $<$<CONFIG:Debug>:/share/data/sources/development-projects/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Debug>:/share/data/sources/development-projects/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Debug>:/share/data/sources/development-projects/glfw-app/Walnut/vendor/glfw/include>
  $<$<CONFIG:Debug>:/share/data/sources/development-projects/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Debug>:/share/data/sources/development-projects/glfw-app/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Debug>:/share/data/sources/development-projects/glfw-app/Walnut/Walnut-Modules/Walnut-Networking/Platform/Linux>
)
target_compile_definitions("Walnut-Networking" PRIVATE
  $<$<CONFIG:Debug>:DEBUG>
  $<$<CONFIG:Debug>:_GLFW_X11>
  $<$<CONFIG:Debug>:_GNU_SOURCE>
  $<$<CONFIG:Debug>:WL_PLATFORM_LINUX>
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("Walnut-Networking" PRIVATE
)
target_link_libraries("Walnut-Networking"
)
target_compile_options("Walnut-Networking" PRIVATE
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("Walnut-Networking" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("Walnut-Networking" PROPERTIES
    OUTPUT_NAME "Walnut-Networking"
    ARCHIVE_OUTPUT_DIRECTORY "/share/data/sources/development-projects/glfw-app/Walnut/bin/Release-linux-ARM64/Walnut-Networking"
    LIBRARY_OUTPUT_DIRECTORY "/share/data/sources/development-projects/glfw-app/Walnut/bin/Release-linux-ARM64/Walnut-Networking"
    RUNTIME_OUTPUT_DIRECTORY "/share/data/sources/development-projects/glfw-app/Walnut/bin/Release-linux-ARM64/Walnut-Networking"
  )
endif()
target_include_directories("Walnut-Networking" PRIVATE
  $<$<CONFIG:Release>:/share/data/sources/development-projects/glfw-app/Walnut/Walnut-Modules/Walnut-Networking/Source>
  $<$<CONFIG:Release>:/share/data/sources/development-projects/glfw-app/Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/include>
  $<$<CONFIG:Release>:/share/data/sources/development-projects/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Release>:/share/data/sources/development-projects/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Release>:/share/data/sources/development-projects/glfw-app/Walnut/vendor/glfw/include>
  $<$<CONFIG:Release>:/share/data/sources/development-projects/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Release>:/share/data/sources/development-projects/glfw-app/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Release>:/share/data/sources/development-projects/glfw-app/Walnut/Walnut-Modules/Walnut-Networking/Platform/Linux>
)
target_compile_definitions("Walnut-Networking" PRIVATE
  $<$<CONFIG:Release>:NDEBUG>
  $<$<CONFIG:Release>:_GLFW_X11>
  $<$<CONFIG:Release>:_GNU_SOURCE>
  $<$<CONFIG:Release>:WL_PLATFORM_LINUX>
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("Walnut-Networking" PRIVATE
)
target_link_libraries("Walnut-Networking"
)
target_compile_options("Walnut-Networking" PRIVATE
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("Walnut-Networking" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
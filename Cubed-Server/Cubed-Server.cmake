add_executable("Cubed-Server"
  "Cubed-Server/Source/CubedApp.cpp"
  "Cubed-Server/Source/HeadlessConsole.cpp"
  "Cubed-Server/Source/HeadlessConsole.h"
  "Cubed-Server/Source/ServerLayer.cpp"
  "Cubed-Server/Source/ServerLayer.h"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_dependencies("Cubed-Server"
    "Cubed-Common-Headless"
    "Walnut-Headless"
    "Walnut-Networking"
    "yaml-cpp"
  )
  set_target_properties("Cubed-Server" PROPERTIES
    OUTPUT_NAME "Cubed-Server"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Debug-linux-ARM64/Cubed-Server"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Debug-linux-ARM64/Cubed-Server"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Debug-linux-ARM64/Cubed-Server"
  )
endif()
target_include_directories("Cubed-Server" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/Cubed/Cubed-Common/Source>
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/vendor/glm>
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/Walnut/Source>
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/Walnut/Platform/Headless>
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/vendor/yaml-cpp/include>
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/Walnut-Modules/Walnut-Networking/Source>
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/include>
)
target_compile_definitions("Cubed-Server" PRIVATE
  $<$<CONFIG:Debug>:YAML_CPP_STATIC_DEFINE>
  $<$<CONFIG:Debug>:WL_HEADLESS>
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("Cubed-Server" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/bin/Linux>
)
target_link_libraries("Cubed-Server"
  $<$<CONFIG:Debug>:Cubed-Common-Headless>
  $<$<CONFIG:Debug>:Walnut-Headless>
  $<$<CONFIG:Debug>:Walnut-Networking>
  $<$<CONFIG:Debug>:yaml-cpp>
  $<$<CONFIG:Debug>:GameNetworkingSockets>
)
target_compile_options("Cubed-Server" PRIVATE
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("Cubed-Server" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  add_dependencies("Cubed-Server"
    "Cubed-Common-Headless"
    "Walnut-Headless"
    "Walnut-Networking"
    "yaml-cpp"
  )
  set_target_properties("Cubed-Server" PROPERTIES
    OUTPUT_NAME "Cubed-Server"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Release-linux-ARM64/Cubed-Server"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Release-linux-ARM64/Cubed-Server"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Release-linux-ARM64/Cubed-Server"
  )
endif()
target_include_directories("Cubed-Server" PRIVATE
  $<$<CONFIG:Release>:/share/sources/Cubed/Cubed-Common/Source>
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/vendor/glm>
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/Walnut/Source>
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/Walnut/Platform/Headless>
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/vendor/yaml-cpp/include>
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/Walnut-Modules/Walnut-Networking/Source>
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/include>
)
target_compile_definitions("Cubed-Server" PRIVATE
  $<$<CONFIG:Release>:YAML_CPP_STATIC_DEFINE>
  $<$<CONFIG:Release>:WL_HEADLESS>
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("Cubed-Server" PRIVATE
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/bin/Linux>
)
target_link_libraries("Cubed-Server"
  $<$<CONFIG:Release>:Cubed-Common-Headless>
  $<$<CONFIG:Release>:Walnut-Headless>
  $<$<CONFIG:Release>:Walnut-Networking>
  $<$<CONFIG:Release>:yaml-cpp>
  $<$<CONFIG:Release>:GameNetworkingSockets>
)
target_compile_options("Cubed-Server" PRIVATE
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("Cubed-Server" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  add_dependencies("Cubed-Server"
    "Cubed-Common-Headless"
    "Walnut-Headless"
    "Walnut-Networking"
    "yaml-cpp"
  )
  set_target_properties("Cubed-Server" PROPERTIES
    OUTPUT_NAME "Cubed-Server"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Dist-linux-ARM64/Cubed-Server"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Dist-linux-ARM64/Cubed-Server"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Dist-linux-ARM64/Cubed-Server"
  )
endif()
target_include_directories("Cubed-Server" PRIVATE
  $<$<CONFIG:Dist>:/share/sources/Cubed/Cubed-Common/Source>
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/vendor/glm>
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/Walnut/Source>
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/Walnut/Platform/Headless>
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/vendor/yaml-cpp/include>
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/Walnut-Modules/Walnut-Networking/Source>
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/include>
)
target_compile_definitions("Cubed-Server" PRIVATE
  $<$<CONFIG:Dist>:YAML_CPP_STATIC_DEFINE>
  $<$<CONFIG:Dist>:WL_HEADLESS>
  $<$<CONFIG:Dist>:WL_DIST>
)
target_link_directories("Cubed-Server" PRIVATE
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/bin/Linux>
)
target_link_libraries("Cubed-Server"
  $<$<CONFIG:Dist>:Cubed-Common-Headless>
  $<$<CONFIG:Dist>:Walnut-Headless>
  $<$<CONFIG:Dist>:Walnut-Networking>
  $<$<CONFIG:Dist>:yaml-cpp>
  $<$<CONFIG:Dist>:GameNetworkingSockets>
)
target_compile_options("Cubed-Server" PRIVATE
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("Cubed-Server" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
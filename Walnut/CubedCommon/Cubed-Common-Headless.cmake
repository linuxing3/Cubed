add_library("Cubed-Common-Headless" STATIC
  "Cubed-Common/Source/ServerPacket.cpp"
  "Cubed-Common/Source/ServerPacket.h"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_dependencies("Cubed-Common-Headless"
    "Walnut-Headless"
    "Walnut-Networking"
  )
  set_target_properties("Cubed-Common-Headless" PROPERTIES
    OUTPUT_NAME "Cubed-Common-Headless"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Debug-linux-ARM64/Cubed-Common-Headless"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Debug-linux-ARM64/Cubed-Common-Headless"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Debug-linux-ARM64/Cubed-Common-Headless"
  )
endif()
target_include_directories("Cubed-Common-Headless" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/vendor/glm>
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/Walnut/Source>
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut-Networking/Source>
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Debug>:/share/sources/Cubed/vendor/GameNetworkingSockets/include>
)
target_compile_definitions("Cubed-Common-Headless" PRIVATE
  $<$<CONFIG:Debug>:WL_HEADLESS>
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("Cubed-Common-Headless" PRIVATE
)
target_link_libraries("Cubed-Common-Headless"
  $<$<CONFIG:Debug>:Walnut-Headless>
  $<$<CONFIG:Debug>:Walnut-Networking>
)
target_compile_options("Cubed-Common-Headless" PRIVATE
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("Cubed-Common-Headless" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  add_dependencies("Cubed-Common-Headless"
    "Walnut-Headless"
    "Walnut-Networking"
  )
  set_target_properties("Cubed-Common-Headless" PROPERTIES
    OUTPUT_NAME "Cubed-Common-Headless"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Release-linux-ARM64/Cubed-Common-Headless"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Release-linux-ARM64/Cubed-Common-Headless"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Release-linux-ARM64/Cubed-Common-Headless"
  )
endif()
target_include_directories("Cubed-Common-Headless" PRIVATE
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/vendor/glm>
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/Walnut/Source>
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut-Networking/Source>
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Release>:/share/sources/Cubed/vendor/GameNetworkingSockets/include>
)
target_compile_definitions("Cubed-Common-Headless" PRIVATE
  $<$<CONFIG:Release>:WL_HEADLESS>
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("Cubed-Common-Headless" PRIVATE
)
target_link_libraries("Cubed-Common-Headless"
  $<$<CONFIG:Release>:Walnut-Headless>
  $<$<CONFIG:Release>:Walnut-Networking>
)
target_compile_options("Cubed-Common-Headless" PRIVATE
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("Cubed-Common-Headless" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  add_dependencies("Cubed-Common-Headless"
    "Walnut-Headless"
    "Walnut-Networking"
  )
  set_target_properties("Cubed-Common-Headless" PROPERTIES
    OUTPUT_NAME "Cubed-Common-Headless"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Dist-linux-ARM64/Cubed-Common-Headless"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Dist-linux-ARM64/Cubed-Common-Headless"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/Cubed/bin/Dist-linux-ARM64/Cubed-Common-Headless"
  )
endif()
target_include_directories("Cubed-Common-Headless" PRIVATE
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/vendor/glm>
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/Walnut/Source>
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut-Networking/Source>
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/vendor/spdlog/include>
  $<$<CONFIG:Dist>:/share/sources/Cubed/vendor/GameNetworkingSockets/include>
)
target_compile_definitions("Cubed-Common-Headless" PRIVATE
  $<$<CONFIG:Dist>:WL_HEADLESS>
  $<$<CONFIG:Dist>:WL_DIST>
)
target_link_directories("Cubed-Common-Headless" PRIVATE
)
target_link_libraries("Cubed-Common-Headless"
  $<$<CONFIG:Dist>:Walnut-Headless>
  $<$<CONFIG:Dist>:Walnut-Networking>
)
target_compile_options("Cubed-Common-Headless" PRIVATE
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("Cubed-Common-Headless" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
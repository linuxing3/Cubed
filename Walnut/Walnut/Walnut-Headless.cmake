add_library("Walnut-Headless" STATIC
        "Walnut/Walnut/Platform/Headless/Walnut/ApplicationHeadless.cpp"
        "Walnut/Walnut/Platform/Headless/Walnut/ApplicationHeadless.h"
      "Walnut/Walnut/Source/Walnut/Application.h"
        "Walnut/Walnut/Source/Walnut/Core/Assert.h"
        "Walnut/Walnut/Source/Walnut/Core/Buffer.h"
        "Walnut/Walnut/Source/Walnut/Core/Log.cpp"
        "Walnut/Walnut/Source/Walnut/Core/Log.h"
        "Walnut/Walnut/Source/Walnut/Core/LogCustomFormatters.h"
      "Walnut/Walnut/Source/Walnut/EntryPoint.h"
      "Walnut/Walnut/Source/Walnut/Layer.h"
      "Walnut/Walnut/Source/Walnut/Random.cpp"
      "Walnut/Walnut/Source/Walnut/Random.h"
        "Walnut/Walnut/Source/Walnut/Serialization/BufferStream.cpp"
        "Walnut/Walnut/Source/Walnut/Serialization/BufferStream.h"
        "Walnut/Walnut/Source/Walnut/Serialization/FileStream.cpp"
        "Walnut/Walnut/Source/Walnut/Serialization/FileStream.h"
        "Walnut/Walnut/Source/Walnut/Serialization/StreamReader.cpp"
        "Walnut/Walnut/Source/Walnut/Serialization/StreamReader.h"
        "Walnut/Walnut/Source/Walnut/Serialization/StreamWriter.cpp"
        "Walnut/Walnut/Source/Walnut/Serialization/StreamWriter.h"
      "Walnut/Walnut/Source/Walnut/Timer.h"
        "Walnut/Walnut/Source/Walnut/Utils/StringUtils.cpp"
        "Walnut/Walnut/Source/Walnut/Utils/StringUtils.h"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("Walnut-Headless" PROPERTIES
    OUTPUT_NAME "Walnut-Headless"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/bin/Debug-linux-ARM64/Walnut-Headless"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/bin/Debug-linux-ARM64/Walnut-Headless"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/bin/Debug-linux-ARM64/Walnut-Headless"
  )
endif()
target_include_directories("Walnut-Headless" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/Walnut/Source>
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/Walnut/Platform/Headless>
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/Walnut/../vendor/glm>
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/Walnut/../vendor/spdlog/include>
)
target_compile_definitions("Walnut-Headless" PRIVATE
  $<$<CONFIG:Debug>:WL_HEADLESS>
  $<$<CONFIG:Debug>:WL_PLATFORM_LINUX>
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("Walnut-Headless" PRIVATE
)
target_link_libraries("Walnut-Headless"
  $<$<CONFIG:Debug>:pthread>
  $<$<CONFIG:Debug>:dl>
)
target_compile_options("Walnut-Headless" PRIVATE
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("Walnut-Headless" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("Walnut-Headless" PROPERTIES
    OUTPUT_NAME "Walnut-Headless"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/bin/Release-linux-ARM64/Walnut-Headless"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/bin/Release-linux-ARM64/Walnut-Headless"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/bin/Release-linux-ARM64/Walnut-Headless"
  )
endif()
target_include_directories("Walnut-Headless" PRIVATE
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/Walnut/Source>
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/Walnut/Platform/Headless>
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/Walnut/../vendor/glm>
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/Walnut/../vendor/spdlog/include>
)
target_compile_definitions("Walnut-Headless" PRIVATE
  $<$<CONFIG:Release>:WL_HEADLESS>
  $<$<CONFIG:Release>:WL_PLATFORM_LINUX>
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("Walnut-Headless" PRIVATE
)
target_link_libraries("Walnut-Headless"
  $<$<CONFIG:Release>:pthread>
  $<$<CONFIG:Release>:dl>
)
target_compile_options("Walnut-Headless" PRIVATE
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("Walnut-Headless" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("Walnut-Headless" PROPERTIES
    OUTPUT_NAME "Walnut-Headless"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/bin/Dist-linux-ARM64/Walnut-Headless"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/bin/Dist-linux-ARM64/Walnut-Headless"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/bin/Dist-linux-ARM64/Walnut-Headless"
  )
endif()
target_include_directories("Walnut-Headless" PRIVATE
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/Walnut/Source>
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/Walnut/Platform/Headless>
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/Walnut/../vendor/glm>
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/Walnut/../vendor/spdlog/include>
)
target_compile_definitions("Walnut-Headless" PRIVATE
  $<$<CONFIG:Dist>:WL_HEADLESS>
  $<$<CONFIG:Dist>:WL_PLATFORM_LINUX>
  $<$<CONFIG:Dist>:WL_DIST>
)
target_link_directories("Walnut-Headless" PRIVATE
)
target_link_libraries("Walnut-Headless"
  $<$<CONFIG:Dist>:pthread>
  $<$<CONFIG:Dist>:dl>
)
target_compile_options("Walnut-Headless" PRIVATE
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("Walnut-Headless" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
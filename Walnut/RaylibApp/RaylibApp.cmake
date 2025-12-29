add_executable("RaylibApp"
  "Walnut/RaylibApp/Source/RaylibApp.cpp"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_dependencies("RaylibApp"
    "Walnut"
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
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/raylib/include>
)
target_compile_definitions("RaylibApp" PRIVATE
  $<$<CONFIG:Debug>:RAYLIB_APP>
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("RaylibApp" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glfw/lib>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/raylib/lib>
)
target_link_libraries("RaylibApp"
  $<$<CONFIG:Debug>:Walnut>
  $<$<CONFIG:Debug>:glfw3>
  $<$<CONFIG:Debug>:rlImGui>
  $<$<CONFIG:Debug>:raylib>
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
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/raylib/include>
)
target_compile_definitions("RaylibApp" PRIVATE
  $<$<CONFIG:Release>:RAYLIB_APP>
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("RaylibApp" PRIVATE
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glfw/lib>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/raylib/lib>
)
target_link_libraries("RaylibApp"
  $<$<CONFIG:Release>:Walnut>
  $<$<CONFIG:Release>:glfw3>
  $<$<CONFIG:Release>:rlImGui>
  $<$<CONFIG:Release>:raylib>
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
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  add_dependencies("RaylibApp"
    "Walnut"
  )
  set_target_properties("RaylibApp" PROPERTIES
    OUTPUT_NAME "RaylibApp"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Dist-linux-ARM64/RaylibApp"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Dist-linux-ARM64/RaylibApp"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Dist-linux-ARM64/RaylibApp"
  )
endif()
target_include_directories("RaylibApp" PRIVATE
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/RaylibApp/Source>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/Walnut/Platform>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/raylib/include>
)
target_compile_definitions("RaylibApp" PRIVATE
  $<$<CONFIG:Dist>:RAYLIB_APP>
  $<$<CONFIG:Dist>:WL_DIST>
)
target_link_directories("RaylibApp" PRIVATE
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glfw/lib>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/raylib/lib>
)
target_link_libraries("RaylibApp"
  $<$<CONFIG:Dist>:Walnut>
  $<$<CONFIG:Dist>:glfw3>
  $<$<CONFIG:Dist>:rlImGui>
  $<$<CONFIG:Dist>:raylib>
)
target_compile_options("RaylibApp" PRIVATE
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("RaylibApp" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
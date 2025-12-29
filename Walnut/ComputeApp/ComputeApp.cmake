add_executable("ComputeApp"
  "Walnut/ComputeApp/Source/Main.cpp"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_dependencies("ComputeApp"
    "Walnut"
    "ImGui"
    "glad"
    "stb"
  )
  set_target_properties("ComputeApp" PROPERTIES
    OUTPUT_NAME "ComputeApp"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Debug-linux-ARM64/ComputeApp"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Debug-linux-ARM64/ComputeApp"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Debug-linux-ARM64/ComputeApp"
  )
endif()
target_include_directories("ComputeApp" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/ComputeApp/Source>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/Walnut/Platform>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glad/include>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glfw/include>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/imgui/backends>
)
target_compile_definitions("ComputeApp" PRIVATE
  $<$<CONFIG:Debug>:WL_DEBUG>
)
target_link_directories("ComputeApp" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/glfw-app/Walnut/vendor/glfw/lib>
)
target_link_libraries("ComputeApp"
  $<$<CONFIG:Debug>:Walnut>
  $<$<CONFIG:Debug>:ImGui>
  $<$<CONFIG:Debug>:glad>
  $<$<CONFIG:Debug>:stb>
  $<$<CONFIG:Debug>:glfw3>
  $<$<CONFIG:Debug>:dl>
  $<$<CONFIG:Debug>:pthread>
  $<$<CONFIG:Debug>:X11>
  $<$<CONFIG:Debug>:GL>
  $<$<CONFIG:Debug>:rt>
  $<$<CONFIG:Debug>:m>
  $<$<CONFIG:Debug>:stdc++fs>
)
target_compile_options("ComputeApp" PRIVATE
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("ComputeApp" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  add_dependencies("ComputeApp"
    "Walnut"
    "ImGui"
    "glad"
    "stb"
  )
  set_target_properties("ComputeApp" PROPERTIES
    OUTPUT_NAME "ComputeApp"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Release-linux-ARM64/ComputeApp"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Release-linux-ARM64/ComputeApp"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Release-linux-ARM64/ComputeApp"
  )
endif()
target_include_directories("ComputeApp" PRIVATE
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/ComputeApp/Source>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/Walnut/Platform>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glad/include>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glfw/include>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/imgui/backends>
)
target_compile_definitions("ComputeApp" PRIVATE
  $<$<CONFIG:Release>:WL_RELEASE>
)
target_link_directories("ComputeApp" PRIVATE
  $<$<CONFIG:Release>:/share/sources/glfw-app/Walnut/vendor/glfw/lib>
)
target_link_libraries("ComputeApp"
  $<$<CONFIG:Release>:Walnut>
  $<$<CONFIG:Release>:ImGui>
  $<$<CONFIG:Release>:glad>
  $<$<CONFIG:Release>:stb>
  $<$<CONFIG:Release>:glfw3>
  $<$<CONFIG:Release>:dl>
  $<$<CONFIG:Release>:pthread>
  $<$<CONFIG:Release>:X11>
  $<$<CONFIG:Release>:GL>
  $<$<CONFIG:Release>:rt>
  $<$<CONFIG:Release>:m>
  $<$<CONFIG:Release>:stdc++fs>
)
target_compile_options("ComputeApp" PRIVATE
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("ComputeApp" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  add_dependencies("ComputeApp"
    "Walnut"
    "ImGui"
    "glad"
    "stb"
  )
  set_target_properties("ComputeApp" PROPERTIES
    OUTPUT_NAME "ComputeApp"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Dist-linux-ARM64/ComputeApp"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Dist-linux-ARM64/ComputeApp"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/glfw-app/Walnut/bin/Dist-linux-ARM64/ComputeApp"
  )
endif()
target_include_directories("ComputeApp" PRIVATE
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/ComputeApp/Source>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/Walnut/Source>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/Walnut/Platform>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glm>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glad/include>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glfw/include>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/imgui>
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/imgui/backends>
)
target_compile_definitions("ComputeApp" PRIVATE
  $<$<CONFIG:Dist>:WL_DIST>
)
target_link_directories("ComputeApp" PRIVATE
  $<$<CONFIG:Dist>:/share/sources/glfw-app/Walnut/vendor/glfw/lib>
)
target_link_libraries("ComputeApp"
  $<$<CONFIG:Dist>:Walnut>
  $<$<CONFIG:Dist>:ImGui>
  $<$<CONFIG:Dist>:glad>
  $<$<CONFIG:Dist>:stb>
  $<$<CONFIG:Dist>:glfw3>
  $<$<CONFIG:Dist>:dl>
  $<$<CONFIG:Dist>:pthread>
  $<$<CONFIG:Dist>:X11>
  $<$<CONFIG:Dist>:GL>
  $<$<CONFIG:Dist>:rt>
  $<$<CONFIG:Dist>:m>
  $<$<CONFIG:Dist>:stdc++fs>
)
target_compile_options("ComputeApp" PRIVATE
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("ComputeApp" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
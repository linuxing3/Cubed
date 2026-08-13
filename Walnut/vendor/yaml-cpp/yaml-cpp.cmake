add_library("yaml-cpp" STATIC
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/anchor.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/binary.h"
        "Walnut/vendor/yaml-cpp/include/yaml-cpp/contrib/anchordict.h"
        "Walnut/vendor/yaml-cpp/include/yaml-cpp/contrib/graphbuilder.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/depthguard.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/dll.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/emitfromevents.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/emitter.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/emitterdef.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/emittermanip.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/emitterstyle.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/eventhandler.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/exceptions.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/mark.h"
        "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/convert.h"
          "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/detail/impl.h"
          "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/detail/iterator.h"
          "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/detail/iterator_fwd.h"
          "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/detail/memory.h"
          "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/detail/node.h"
          "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/detail/node_data.h"
          "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/detail/node_iterator.h"
          "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/detail/node_ref.h"
        "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/emit.h"
        "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/impl.h"
        "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/iterator.h"
        "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/node.h"
        "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/parse.h"
        "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/ptr.h"
        "Walnut/vendor/yaml-cpp/include/yaml-cpp/node/type.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/noexcept.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/null.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/ostream_wrapper.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/parser.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/stlemitter.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/traits.h"
      "Walnut/vendor/yaml-cpp/include/yaml-cpp/yaml.h"
    "Walnut/vendor/yaml-cpp/src/binary.cpp"
    "Walnut/vendor/yaml-cpp/src/collectionstack.h"
      "Walnut/vendor/yaml-cpp/src/contrib/graphbuilder.cpp"
      "Walnut/vendor/yaml-cpp/src/contrib/graphbuilderadapter.cpp"
      "Walnut/vendor/yaml-cpp/src/contrib/graphbuilderadapter.h"
    "Walnut/vendor/yaml-cpp/src/convert.cpp"
    "Walnut/vendor/yaml-cpp/src/depthguard.cpp"
    "Walnut/vendor/yaml-cpp/src/directives.cpp"
    "Walnut/vendor/yaml-cpp/src/directives.h"
    "Walnut/vendor/yaml-cpp/src/emit.cpp"
    "Walnut/vendor/yaml-cpp/src/emitfromevents.cpp"
    "Walnut/vendor/yaml-cpp/src/emitter.cpp"
    "Walnut/vendor/yaml-cpp/src/emitterstate.cpp"
    "Walnut/vendor/yaml-cpp/src/emitterstate.h"
    "Walnut/vendor/yaml-cpp/src/emitterutils.cpp"
    "Walnut/vendor/yaml-cpp/src/emitterutils.h"
    "Walnut/vendor/yaml-cpp/src/exceptions.cpp"
    "Walnut/vendor/yaml-cpp/src/exp.cpp"
    "Walnut/vendor/yaml-cpp/src/exp.h"
    "Walnut/vendor/yaml-cpp/src/indentation.h"
    "Walnut/vendor/yaml-cpp/src/memory.cpp"
    "Walnut/vendor/yaml-cpp/src/node.cpp"
    "Walnut/vendor/yaml-cpp/src/node_data.cpp"
    "Walnut/vendor/yaml-cpp/src/nodebuilder.cpp"
    "Walnut/vendor/yaml-cpp/src/nodebuilder.h"
    "Walnut/vendor/yaml-cpp/src/nodeevents.cpp"
    "Walnut/vendor/yaml-cpp/src/nodeevents.h"
    "Walnut/vendor/yaml-cpp/src/null.cpp"
    "Walnut/vendor/yaml-cpp/src/ostream_wrapper.cpp"
    "Walnut/vendor/yaml-cpp/src/parse.cpp"
    "Walnut/vendor/yaml-cpp/src/parser.cpp"
    "Walnut/vendor/yaml-cpp/src/ptr_vector.h"
    "Walnut/vendor/yaml-cpp/src/regex_yaml.cpp"
    "Walnut/vendor/yaml-cpp/src/regex_yaml.h"
    "Walnut/vendor/yaml-cpp/src/regeximpl.h"
    "Walnut/vendor/yaml-cpp/src/scanner.cpp"
    "Walnut/vendor/yaml-cpp/src/scanner.h"
    "Walnut/vendor/yaml-cpp/src/scanscalar.cpp"
    "Walnut/vendor/yaml-cpp/src/scanscalar.h"
    "Walnut/vendor/yaml-cpp/src/scantag.cpp"
    "Walnut/vendor/yaml-cpp/src/scantag.h"
    "Walnut/vendor/yaml-cpp/src/scantoken.cpp"
    "Walnut/vendor/yaml-cpp/src/setting.h"
    "Walnut/vendor/yaml-cpp/src/simplekey.cpp"
    "Walnut/vendor/yaml-cpp/src/singledocparser.cpp"
    "Walnut/vendor/yaml-cpp/src/singledocparser.h"
    "Walnut/vendor/yaml-cpp/src/stream.cpp"
    "Walnut/vendor/yaml-cpp/src/stream.h"
    "Walnut/vendor/yaml-cpp/src/streamcharsource.h"
    "Walnut/vendor/yaml-cpp/src/stringsource.h"
    "Walnut/vendor/yaml-cpp/src/tag.cpp"
    "Walnut/vendor/yaml-cpp/src/tag.h"
    "Walnut/vendor/yaml-cpp/src/token.h"
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("yaml-cpp" PROPERTIES
    OUTPUT_NAME "yaml-cpp"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/vendor/yaml-cpp/bin/Debug-linux-ARM64/yaml-cpp"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/vendor/yaml-cpp/bin/Debug-linux-ARM64/yaml-cpp"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/vendor/yaml-cpp/bin/Debug-linux-ARM64/yaml-cpp"
  )
endif()
target_include_directories("yaml-cpp" PRIVATE
  $<$<CONFIG:Debug>:/share/sources/Cubed/Walnut/vendor/yaml-cpp/include>
)
target_compile_definitions("yaml-cpp" PRIVATE
  $<$<CONFIG:Debug>:WL_HEADLESS>
  $<$<CONFIG:Debug>:YAML_CPP_STATIC_DEFINE>
)
target_link_directories("yaml-cpp" PRIVATE
)
target_link_libraries("yaml-cpp"
)
target_compile_options("yaml-cpp" PRIVATE
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-fPIC>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-fPIC>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g>
  $<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  set_target_properties("yaml-cpp" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE True
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("yaml-cpp" PROPERTIES
    OUTPUT_NAME "yaml-cpp"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/vendor/yaml-cpp/bin/Release-linux-ARM64/yaml-cpp"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/vendor/yaml-cpp/bin/Release-linux-ARM64/yaml-cpp"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/vendor/yaml-cpp/bin/Release-linux-ARM64/yaml-cpp"
  )
endif()
target_include_directories("yaml-cpp" PRIVATE
  $<$<CONFIG:Release>:/share/sources/Cubed/Walnut/vendor/yaml-cpp/include>
)
target_compile_definitions("yaml-cpp" PRIVATE
  $<$<CONFIG:Release>:WL_HEADLESS>
  $<$<CONFIG:Release>:YAML_CPP_STATIC_DEFINE>
)
target_link_directories("yaml-cpp" PRIVATE
)
target_link_libraries("yaml-cpp"
)
target_compile_options("yaml-cpp" PRIVATE
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:C>>:-fPIC>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-O2>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-fPIC>
  $<$<AND:$<CONFIG:Release>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set_target_properties("yaml-cpp" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE True
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("yaml-cpp" PROPERTIES
    OUTPUT_NAME "yaml-cpp"
    ARCHIVE_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/vendor/yaml-cpp/bin/Dist-linux-ARM64/yaml-cpp"
    LIBRARY_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/vendor/yaml-cpp/bin/Dist-linux-ARM64/yaml-cpp"
    RUNTIME_OUTPUT_DIRECTORY "/share/sources/Cubed/Walnut/vendor/yaml-cpp/bin/Dist-linux-ARM64/yaml-cpp"
  )
endif()
target_include_directories("yaml-cpp" PRIVATE
  $<$<CONFIG:Dist>:/share/sources/Cubed/Walnut/vendor/yaml-cpp/include>
)
target_compile_definitions("yaml-cpp" PRIVATE
  $<$<CONFIG:Dist>:WL_HEADLESS>
  $<$<CONFIG:Dist>:YAML_CPP_STATIC_DEFINE>
)
target_link_directories("yaml-cpp" PRIVATE
)
target_link_libraries("yaml-cpp"
)
target_compile_options("yaml-cpp" PRIVATE
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:C>>:-fPIC>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-fPIC>
  $<$<AND:$<CONFIG:Dist>,$<COMPILE_LANGUAGE:CXX>>:-std=c++17>
)
if(CMAKE_BUILD_TYPE STREQUAL Dist)
  set_target_properties("yaml-cpp" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE True
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
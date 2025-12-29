project "Cubed-Client"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++17"
   targetdir "bin/%{cfg.buildcfg}"
   staticruntime "off"

   files { "Source/**.h", "Source/**.cpp" }

   includedirs
   {
      "../Cubed-Common/Source",

      "../Walnut/vendor/glad/include",
      "../Walnut/vendor/glm",
      "../Walnut/vendor/imgui",
      "../Walnut/vendor/spdlog/include",
      
      "../Walnut/Walnut/Source",
      "../Walnut/Walnut/Platform",

      -- Walnut-Networking
      "../Walnut/Walnut-Modules/Walnut-Networking/Source",
      "../Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/include"
   }

   -- includedirs (extra_includedirs)
   libdirs {
      -- "../Walnut/vendor/glfw/lib"
   }
    links
    {
        -- "Cubed-Common",
        "glad",
        "ImGui",
        "glfw",
        "X11",
        "xcb",
        "Xau",
        "Xdmcp",
        "pthread",
        "pthread",
        "Walnut",
        "GL",
        "rt",
        "m",
        "dl",
    }

   targetdir ("../bin/" .. outputdir .. "/%{prj.name}")
   objdir ("../bin-int/" .. outputdir .. "/%{prj.name}")

   filter "system:linux"
      systemversion "latest"
      -- libdirs { "../Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/bin/Linux" }
      -- links { "GameNetworkingSockets"}
      postbuildcommands 
      {
        '{COPY} "../Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/bin/Linux/GameNetworkingSockets.so" "%{cfg.targetdir}"',
      }

   filter "system:windows"
      systemversion "latest"
      defines { "WL_PLATFORM_WINDOWS" }
      buildoptions { "/utf-8" }
      postbuildcommands 
      {
        '{COPY} "../%{WalnutNetworkingBinDir}/GameNetworkingSockets.dll" "%{cfg.targetdir}"',
        '{COPY} "../%{WalnutNetworkingBinDir}/libcrypto-3-x64.dll" "%{cfg.targetdir}"',
        '{COPY} "../%{WalnutNetworkingBinDir}/libprotobufd.dll" "%{cfg.targetdir}"',
      }

   filter "configurations:Debug"
      defines { "WL_DEBUG" }
      runtime "Debug"
      symbols "On"

   filter "configurations:Release"
      defines { "WL_RELEASE" }
      runtime "Release"
      optimize "On"
      symbols "On"

   filter "configurations:Dist"
      kind "WindowedApp"
      defines { "WL_DIST" }
      runtime "Release"
      optimize "On"
      symbols "Off"

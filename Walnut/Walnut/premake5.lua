project "Walnut"
   kind "StaticLib"
   language "C++"
   cppdialect "C++17"
   targetdir "bin/%{cfg.buildcfg}"
   staticruntime "off"

   files {
      "Source/**.h",
      "Source/**.cpp",

       "Platform/GUI/**.h",
       "Platform/GUI/**.cpp",
   }

   includedirs
   {
      "Source",
      "Platform",
      "../vendor",
      "../vendor/glm",
      "../vendor/imgui",
      "../vendor/imgui/backends",
      "../vendor/raylib/include",
      "../vendor/glfw/include",
      "../vendor/glad/include",
      "../vendor/spdlog/include",
      "../vendor/yaml-cpp/include",
   }

   -- includedirs (extra_includedirs)
   libdirs {
      "../vendor/glfw/lib",
      "../vendor/raylib/lib"
   }

   links
   {
       "ImGui",
       "rlImGui",
       "raylib",
       "glfw3",
       "glad",
       "GL",
       "X11",
       "xcb",
       "Xau",
       "Xdmcp",
       "pthread",
       "rt",
       "m",
       "stdc++fs",
       "yaml-cpp",
       "stb",
       "dl",
   }

   targetdir ("../bin/" .. outputdir .. "/%{prj.name}")
   objdir ("../bin-int/" .. outputdir .. "/%{prj.name}")


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

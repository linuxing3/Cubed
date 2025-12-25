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
      "../vendor/glad/include",
      "../vendor/spdlog/include",
      "../vendor/yaml-cpp/include",
   }

   links
   {
       "imgui",
       "glfw",
       "glad",
       "X11",
       "GL",
       "yaml-cpp",
       "stb"
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

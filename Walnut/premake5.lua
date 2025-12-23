project "Walnut"
   kind "StaticLib"
   language "C++"
   cppdialect "C++17"
   targetdir "bin/%{cfg.buildcfg}"
   staticruntime "off"

   files {
      "src/**.h",
      "src/**.cpp",
   }

   includedirs
   {
      "src",
      "../vendor/glad/include",
      "../vendor/stb",
      "../vendor/imgui",
      "../vendor/imgui/backends",
      -- "../vendor/glfw/include",
      "../vendor/glm",
   }

   links
   {
       "ImGui",
       "glfw",
       "glad",
       "X11",
       "GL",
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

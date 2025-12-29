project "WalnutApp"
kind "ConsoleApp"
language "C++"
cppdialect "C++17"
targetdir "bin/%{cfg.buildcfg}"
staticruntime "off"

-- buildoptions {"-stdlib=libc++"}

files { "Source/**.h", "Source/**.cpp"}

includedirs
{
    "Source",
    "../Walnut/Source",
    "../Walnut/Platform",
    "../vendor",
    "../vendor/glm",
    "../vendor/glad/include",
    "../vendor/imgui",
    "../vendor/imgui/backends",
}

-- includedirs (extra_includedirs)
libdirs {
  "../vendor/glfw/lib"
}
links
{
    "Walnut",
    "ImGui",
    "glad",
    -- "glfw3",
    "stb",
    "dl",
    "pthread",
    "X11",
    "GL",
    "rt",
    "m",
    "stdc++fs"
}

targetdir("../bin/" .. outputdir .. "/%{prj.name}")
objdir("../bin-int/" .. outputdir .. "/%{prj.name}")


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

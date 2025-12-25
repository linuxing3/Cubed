project "WalnutApp"
kind "ConsoleApp"
language "C++"
cppdialect "C++17"
targetdir "bin/%{cfg.buildcfg}"
staticruntime "off"

-- buildoptions {"-stdlib=libc++"}

files { "src/**.h", "src/**.cpp"}

includedirs
{
    "../App/src",
    "../Walnut/src",
    "../vendor/glad/include",
    "../vendor",
    "../vendor/imgui",
    "../vendor/imgui/backends",
    -- "../vendor/glfw/include",
    "../vendor/glm",
}

links
{
    "Walnut",
    "ImGui",
    "glad",
    "glfw",
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

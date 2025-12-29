project "RaylibApp"
kind "ConsoleApp"
language "C++"
cppdialect "C++17"
targetdir "bin/%{cfg.buildcfg}"
staticruntime "off"

-- buildoptions {"-stdlib=libc++"}

files { "Source/**.h", "Source/**.cpp"}

defines{
    "RAYLIB_APP"
}

includedirs
{
    "Source",
    "../Walnut/Source",
    "../Walnut/Platform",
    "../vendor",
    "../vendor/raylib/include",
}

-- includedirs (extra_includedirs)
libdirs {
      "../vendor/glfw/lib",
      "../vendor/raylib/lib"
}
links
{
    "Walnut",
    "glfw3",
    "rlImGui",
    "raylib",
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

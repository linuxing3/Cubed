-- premake5.lua
require("cmake")

workspace "WalnutApp"
	configurations { "Debug", "Release" }
	platforms { "ARM64"}
	defaultplatform "ARM64"
    startproject "WalnutApp"
	
	filter "configurations:Debug"
		defines { "DEBUG" }
		symbols "On"
		
	filter "configurations:Release"
		defines { "NDEBUG" }
		optimize "On"	
		
	filter { "platforms:ARM64" }
		architecture "ARM64"

	filter { "system:linux" }
		defines { "_GLFW_X11" }
		defines { "_GNU_SOURCE" }
		


outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"


include "Walnut"

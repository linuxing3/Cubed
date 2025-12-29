-- premake5.lua
require("cmake")

workspace "WalnutApp"
   architecture "arm64"
   configurations { "Debug", "Release", "Dist" }
   startproject "WalnutApp"
   cppdialect "C++20"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"


include "Walnut"

include "Cubed-Common"
include "Cubed-Client"

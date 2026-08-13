require "cmake"

workspace "Cubed-Server"
   architecture "arm64"
   configurations { "Debug", "Release", "Dist" }
   startproject "Cubed-Server"

   -- Workspace-wide defines
   defines
   {
       "WL_HEADLESS"
   }

   -- Workspace-wide build options for MSVC
   filter "system:windows"
      buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus" }

-- Directories
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
WalnutNetworkingBinDir = "Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/bin/%{cfg.system}/%{cfg.buildcfg}/"

include "Walnut/Build-Walnut-Headless-External.lua"
include "Walnut/Walnut/Build-Walnut-Headless.lua"

group "CubedApp"
    include "Cubed-Common/Build-Cubed-Common-Headless.lua"
    include "Cubed-Server/Build-Cubed-Server-Headless.lua"
group ""

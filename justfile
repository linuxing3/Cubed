compute-app:
    ./Walnut/bin/Debug-linux-ARM64/ComputeApp/ComputeApp
raylib-app:
    ./Walnut/bin/Debug-linux-ARM64/RaylibApp/RaylibApp
walnut-app:
    ./Walnut/bin/Debug-linux-ARM64/WalnutApp/WalnutApp
cubed-client:
    ./Walnut/bin/Debug-linux-ARM64/CubedClientApp/CubedClientApp
raylib-editor:
    ./Walnut/vendor/rlImGui/bin/Debug/editor
raylib-docking:
    ./Walnut/vendor/rlImGui/bin/Debug/docking_example
raylib-asset-browser:
    ./Walnut/vendor/rlImGui/bin/Debug/asset_browser
cmake-build:
    #!/bin/bash
    premake5 cmake
    cmake --build .
make-build:
    #!/bin/bash
    premake5 gmake2
    make
dev:
    nix develop

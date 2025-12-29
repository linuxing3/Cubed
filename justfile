run-compute-app:
    ./Walnut/bin/Debug-linux-ARM64/ComputeApp/ComputeApp
run-raylib-app:
    ./Walnut/bin/Debug-linux-ARM64/RaylibApp/RaylibApp
run-walnut-app:
    ./Walnut/bin/Debug-linux-ARM64/WalnutApp/WalnutApp
run-cubed-client:
    ./bin/Debug-linux-ARM64/Cubed-Client/Cubed-Client
premake-cmake-build:
    #!/bin/bash
    premake5 cmake
    cmake --build .
premake-make-build:
    #!/bin/bash
    premake5 gmake2
    make
dev:
    nix develop

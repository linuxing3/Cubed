#!/usr/bin/env bash
set -euo pipefail

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP="$APP_DIR/Walnut/bin/Debug-linux-ARM64/CubedClientApp/CubedClientApp"

# 避免 devShell 注入影响系统图形栈子进程（flatpak/portal）
unset LD_LIBRARY_PATH
unset NIX_LD_LIBRARY_PATH

# 类似 wezterm 包裹：显式指定 GLX/EGL 驱动来源
export __GLX_VENDOR_LIBRARY_NAME=mesa
export LIBGL_ALWAYS_SOFTWARE=${LIBGL_ALWAYS_SOFTWARE:-0}
export DISPLAY=${DISPLAY:-:0}

exec "$APP" "$@"

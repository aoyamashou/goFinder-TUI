#!/bin/sh
set -eu

REPO="aoyamashou/goFinder-TUI"
BIN_NAME="gf"

detect_os() {
  case "$(uname -s)" in
    Darwin) echo "darwin" ;;
    Linux)  echo "linux" ;;
    *)
      echo "不支持的操作系统: $(uname -s)" >&2
      exit 1
      ;;
  esac
}

detect_arch() {
  case "$(uname -m)" in
    x86_64|amd64)  echo "amd64" ;;
    arm64|aarch64) echo "arm64" ;;
    *)
      echo "不支持的 CPU 架构: $(uname -m)" >&2
      exit 1
      ;;
  esac
}

OS="$(detect_os)"
ARCH="$(detect_arch)"
ASSET="${BIN_NAME}_${OS}_${ARCH}.tar.gz"
URL="https://github.com/${REPO}/releases/latest/download/${ASSET}"

if [ -w "/usr/local/bin" ]; then
  INSTALL_DIR="/usr/local/bin"
else
  INSTALL_DIR="${HOME}/.local/bin"
  mkdir -p "${INSTALL_DIR}"
fi

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

echo "正在下载 ${BIN_NAME} (${OS}/${ARCH})..."
curl -fsSL "${URL}" -o "${TMP_DIR}/${ASSET}"

tar -xzf "${TMP_DIR}/${ASSET}" -C "${TMP_DIR}"
install -m 755 "${TMP_DIR}/${BIN_NAME}" "${INSTALL_DIR}/${BIN_NAME}"

echo "✅ 已安装到 ${INSTALL_DIR}/${BIN_NAME}"

case ":${PATH}:" in
  *":${INSTALL_DIR}:"*) ;;
  *)
    echo "请将 ${INSTALL_DIR} 加入 PATH，例如："
    echo "  export PATH=\"${INSTALL_DIR}:\$PATH\""
    ;;
esac

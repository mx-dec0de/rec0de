#!/bin/bash

INSTALL_DIR="$HOME/.local/bin"
TARGET="$INSTALL_DIR/rec0de"

mkdir -p "$INSTALL_DIR"
cp rec0de.sh "$TARGET"
chmod +x "$TARGET"

SHELL_RC="$HOME/.bashrc"
if [[ "$SHELL" == */zsh ]]; then
  SHELL_RC="$HOME/.zshrc"
fi

if ! grep -q 'alias rec0de=' "$SHELL_RC"; then
  echo "alias rec0de='$TARGET'" >> "$SHELL_RC"
  echo "✅ Alias 'rec0de' added to $SHELL_RC"
else
  echo "ℹ️ Alias 'rec0de' already exists in $SHELL_RC"
fi

echo "📦 Installed to $TARGET"
echo "🔄 Run 'source $SHELL_RC' or restart your terminal"

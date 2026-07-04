#!/bin/bash
# take_screenshots.sh
# Automates capturing the Web UI and Swing UI screenshots for the EduMIPS64 website.

# Accept EDUMIPS_JAR from environment or first argument, else check if it exists in /tmp
EDUMIPS_JAR=${1:-${EDUMIPS_JAR:-"/tmp/edumips64/out/edumips64-1.4.0-193-gd8c5c270.jar"}}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PUBLIC_DIR="$SCRIPT_DIR/../public"

echo "Checking for Puppeteer..."
if ! npm list puppeteer >/dev/null 2>&1; then
  echo "Installing Puppeteer in $SCRIPT_DIR..."
  cd "$SCRIPT_DIR" && npm install puppeteer --no-save
fi

echo "Taking Web UI Screenshots (mid-execution)..."
cd "$SCRIPT_DIR"
node take_web_screenshot.cjs "$PUBLIC_DIR/screenshot-web.png" "light"
node take_web_screenshot.cjs "$PUBLIC_DIR/screenshot-web-dark.png" "dark"

if [ ! -f "$EDUMIPS_JAR" ]; then
  echo "Swing UI JAR not found at $EDUMIPS_JAR."
  echo "Skipping Swing UI screenshots. Pass the path to the JAR as the first argument to capture them."
  exit 0
fi

echo "Setting up Xvfb for Swing UI Screenshots..."
export DISPLAY=:99
Xvfb :99 -screen 0 1710x1231x24 &
XVFB_PID=$!
sleep 2

echo "Compiling Java screenshot utilities..."
javac Screenshot.java SetTheme.java

echo "Taking Swing UI Light Screenshot (mid-execution)..."
java SetTheme false
java -jar "$EDUMIPS_JAR" -f loop.s &
PID1=$!
java Screenshot "$PUBLIC_DIR/screenshot-swing-light.png"
kill $PID1

echo "Taking Swing UI Dark Screenshot (mid-execution)..."
java SetTheme true
java -jar "$EDUMIPS_JAR" -f loop.s &
PID2=$!
java Screenshot "$PUBLIC_DIR/screenshot-swing-dark.png"
kill $PID2

kill $XVFB_PID
echo "All screenshots successfully captured in $PUBLIC_DIR!"

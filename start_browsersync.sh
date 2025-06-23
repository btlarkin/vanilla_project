#!/bin/bash

# --- BrowserSync Launch Script ---

# Define the project root. This assumes the script is run from your project's root directory.
PROJECT_ROOT=$(pwd)

echo "Checking for browser-sync..."

# Check if browser-sync is installed globally. If not, install it.
if ! command -v browser-sync &> /dev/null
then
    echo "browser-sync is not found. Installing globally via npm..."
    npm install -g browser-sync
    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to install browser-sync. Please ensure Node.js and npm are installed and accessible in your PATH."
        echo "You can manually install it by running: npm install -g browser-sync"
        exit 1
    fi
    echo "browser-sync installed successfully."
fi

echo "Starting BrowserSync for project: $PROJECT_ROOT"
echo "Watching HTML, CSS, and JS files for changes."

# Start BrowserSync
# --server "$PROJECT_ROOT": Serves static files from your project root.
# --files "$PROJECT_ROOT/**/*.html,$PROJECT_ROOT/**/*.css,$PROJECT_ROOT/**/*.js": Watches for changes in these file types
#                                                                           within your project and its subdirectories.
# --no-ui: Prevents opening the BrowserSync UI in a separate browser tab.
# --port 3000: Specifies the port for the server. Change if you have conflicts.
# --open external: Automatically opens your project in your default browser,
#                  using your machine's external IP for easy testing on other devices
#                  on the same network (e.g., your phone). Use 'local' if you only want localhost.
browser-sync start \
  --server "$PROJECT_ROOT" \
  --files "$PROJECT_ROOT/**/*.html,$PROJECT_ROOT/**/*.xhtml,$PROJECT_ROOT/**/*.css,$PROJECT_ROOT/**/*.js" \
  --no-ui \
  --port 3000 \
  --open external

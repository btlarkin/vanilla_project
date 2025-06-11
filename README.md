# My Mouseless Web Dev Project Template

This template provides a foundational structure for modern web development projects, specifically optimized for an **Arch Linux mouseless development environment**. It leverages `tmux` for robust session management, `nvim` (Neovim) for powerful keyboard-driven coding, and BrowserSync for seamless live reloading directly within your terminal workflow.

It's designed for developers who prefer to stay within the terminal for maximum productivity and minimal context switching.

---

## ✨ Features

* **Terminal-Centric Workflow:** Conduct all your development activities directly from your terminal, without needing to reach for a mouse.
* **Persistent Development Sessions:** Utilize `tmux` to create and manage persistent sessions, ensuring your development environment stays alive even if you close your terminal or disconnect.
* **Efficient Code Editing:** `nvim` offers a highly customizable and powerful text editing experience, optimized for speed and keyboard navigation.
* **Live Reloading with BrowserSync:** Automatically refresh your browser on changes to your HTML, CSS, and JavaScript files, providing instant feedback as you code.
* **Cross-Device Testing:** BrowserSync enables easy testing on other devices (e.g., a phone or tablet) connected to your local network.
* **Organized Project Structure:** A clean and logical file layout for front-end files.
* **Git Integration:** Ready for version control with a sensible `.gitignore` to keep your repository clean.

---

## 🚀 Prerequisites

Before you get started, ensure you have the following tools installed on your **Arch Linux** system:

* **`git`**: For cloning the template and version control.
* **`tmux`**: The terminal multiplexer.
* **`tmuxp`**: For declarative `tmux` session management. Install using `pacman`:
    ```bash
    sudo pacman -S git tmux tmuxp
    ```
* **`nvim` (Neovim)**: Or `vim` if you prefer. Your preferred keyboard-driven text editor.
* **Node.js & npm**: Required for BrowserSync. Install using your system's package manager:
    ```bash
    sudo pacman -S nvim vim nodejs npm
    ```
* **Web Browser**: Any modern web browser (e.g., Firefox, Chrome).
    ```bash
    sudo pacman -S firefox
    yay -S google-chrome
    ```
* **`xdg-open`**: (Typically pre-installed on Arch Linux desktop environments) This tool allows the `start_browsersync.sh` script to open the BrowserSync URL in your default browser.

---

## ⚡️ Setup

To get your mouseless development environment up and running, follow these steps:

### 1. Get the Template (Choose your method)

#### Method A: Starting from a Local Copy

If you have a local copy of this template folder (e.g., in a `~/Templates` directory), you can copy it to start a new project:

1.  **Copy and Rename:**
    ```bash
    cp -r ~/Templates/my-web-project-template/ ~/Projects/my-new-project-name
    ```
    (Adjust paths like `~/Templates` and `~/Projects` to your actual setup).
2.  **Navigate into your new project:**
    ```bash
    cd ~/Projects/my-new-project-name
    ```
3.  **Initialize Git:**
    If the template folder itself was a Git repository (and thus contains a `.git` folder), you'll want to remove its history and initialize a fresh one for your new project:
    ```bash
    rm -rf .git     # Delete the template's Git history (crucial for a clean start!)
    git init        # Initialize a brand-new Git repository for your new project
    git add .       # Stage all files from the template
    git commit -m "Initial commit: Project template setup"
    ```

#### Method B: Starting from a Git Repository

If you maintain this template as a Git repository (e.g., on GitHub or GitLab), you can clone it directly:

1.  **Clone the Template:**
    ```bash
    git clone https://github.com/yourusername/my-web-project-template.git my-new-project-name
    ```
2.  **Navigate into your new project:**
    ```bash
    cd my-new-project-name
    ```
3.  **Initialize Git:**
    The cloned repository still contains the template's Git history. To start fresh for your new project:
    ```bash
    rm -rf .git     # Delete the template's Git history
    git init        # Initialize a brand-new Git repository for your new project
    git add .       # Stage all files from the template
    git commit -m "Initial commit: Project template setup"
    ```

### 2. Prepare Your Environment

Once your new project folder is set up:

1.  **Make BrowserSync Script Executable:**
    Grant execution permissions to the BrowserSync launch script:
    ```bash
    chmod +x start_browsersync.sh
    ```
2.  **Install Global BrowserSync (if not already handled):**
    The `start_browsersync.sh` script will attempt to install BrowserSync globally if it's missing. However, you can also do it manually beforehand:
    ```bash
    npm install -g browser-sync
    ```

### 3. Launch Your Project

From your project's root directory (`my-new-project-name/`), load the `tmuxp` session:

```bash
tmuxp load .
```

`tmuxp` will now set up your `tmux` session with multiple windows and panes, and BrowserSync will automatically launch your project in your default web browser.

---

## 💻 Usage

Once the `tmuxp` session is loaded, you'll be in your development environment:

1.  **Navigating `tmux`:**
    * **Your `tmux` Prefix:** Remember your `tmux` prefix (commonly `Ctrl+b` or `Ctrl+a`). All `tmux` commands start with this.
    * `prefix + w`: View a list of all your `tmux` windows.
    * `prefix + <number>`: Switch directly to a specific window (e.g., `prefix + 1` for `editor-terminal`, `prefix + 2` for `browsersync`).
    * `prefix + arrow keys`: Move between panes within the current window.
    * `prefix + z`: Toggle zooming the current pane to full screen and back.

2.  **Development Workflow:**
    * **`editor-terminal` Window (Window 1):** This is your primary workspace.
        * The **top pane** runs `nvim`, opening your project's root directory. Use `nvim`'s native commands or plugins (like `nvim-tree` or `netrw`) to navigate and open your HTML, CSS, and JavaScript files for editing.
        * The **bottom pane** is a general-purpose terminal. Use it for Git commands, running build scripts, or any other terminal-based tasks.
    * **`browsersync` Window (Window 2):** This window runs your BrowserSync server. It should be left running in the background.
        * BrowserSync has already opened your project in your web browser.
        * As you make and save changes in `nvim` to your HTML, CSS, or JavaScript files, BrowserSync will automatically refresh your browser tab, providing instant visual feedback.

3.  **Mouseless Tips:**
    * **Master `nvim`:** Dedicate time to learning `nvim`'s powerful commands for navigation, text manipulation, multi-file editing (buffers, splits, tabs), and executing shell commands from within the editor.
    * **`tmux` Hotkeys:** Internalize `tmux` keybindings to quickly switch between your editor, console, and server panes/windows without lifting your fingers from the keyboard.
    * **Terminal Utilities:** Explore terminal-based file managers (e.g., `ranger`, `lf`) and other CLI tools to maximize your time in the shell.

---

## 🗂️ Project Structure

This template uses a clear and organized folder structure:

```
my-web-project/
├── .git/                  # Git repository data
├── .gitignore             # Files and folders ignored by Git
├── .tmuxp.yaml            # tmuxp session configuration
├── start_browsersync.sh   # Script to start BrowserSync
├── index.html             # Main HTML file (project entry point)
├── about.html             # (Optional) Other HTML pages
├── css/                   # All your CSS files
│   └── style.css
│   └── components.css
├── js/                    # All your JavaScript files
│   └── script.js
│   └── utils.js
├── images/                # Image assets (PNG, JPG, SVG)
│   ├── logo.png
│   └── background.jpg
├── fonts/                 # (Optional) Custom web fonts
│   └── OpenSans-Regular.woff
└── README.md              # Project description and instructions
```

---

## ⚙️ Customization

This template is a starting point. Feel free to adapt it to your specific needs:

* **`tmuxp.yaml`:**
    * Adjust window layouts (e.g., `main-vertical`, `tiled`).
    * Add or remove panes/windows for specific tasks (e.g., a dedicated pane for a build watcher, a window for database interaction).
    * Change the initial commands run in any pane.
* **`start_browsersync.sh`:**
    * Modify the BrowserSync port (`--port`).
    * Change the automatic browser opening behavior (e.g., `--open local` to open only on localhost, or `--open false` to disable auto-opening).
    * Adjust the files BrowserSync watches (`--files`).
* **Nvim Configuration:**
    * Enhance your `nvim` setup with plugins for linting, formatting, LSP (Language Server Protocol) integration, auto-completion, and advanced file management (like `nvim-tree` or `telescope.nvim`).

---

## 👋 Contributing

Feel free to suggest improvements or contribute to this template by opening issues or pull requests.



# Lua Generate

**Lua Generate** is a command-line tool (CLI) designed to generate boilerplate code for Next.js projects. Inspired by the practical style of Angular's `ng` tool, it simplifies the creation of common files and directories in React applications.

With support for file extension customization (e.g., `.js`, `.jsx`, `.ts`, `.tsx`), interactive commands, and detailed error messages, **Lua Generate** enhances the developer experience, allowing you to focus on what truly matters: building amazing applications.

---

## Try the `help` Command

Before diving in, explore the available features using the help command in your terminal:

```bash
lg --help
```
This command will display all available options, commands, and their alternative syntaxes, helping you get familiar with the tool.

---

## Dependencies

To run **Lua Generate**, you’ll need to have the following dependencies installed on your system:

### 1. **Lua 5.3**
   **Lua Generate** is written in Lua, so you’ll need Lua 5.3 (or higher) installed on your machine to execute the commands.

   You can install Lua 5.3 using your package manager:

   - **On Ubuntu/Debian-based systems**:
     ```bash
     sudo apt-get install lua5.3
     ```

   - **On Fedora**:
     ```bash
     sudo dnf install lua-5.3
     ```
   - **On Arch**:
     ```bash
     sudo pacman -S lua
     ```
   - **On macOS (using Homebrew)**:
     ```bash
     brew install lua@5.3
     ```

### 2. **Shell (Bash or Zsh)**
   **Lua Generate** requires a Unix-based shell to work properly (such as **Bash** or **Zsh**). Most Linux distributions come with Bash or Zsh installed by default. If you're using macOS, **Zsh** is the default shell starting from macOS Catalina.

   To check which shell you're using, you can run:
   ```bash
   echo $SHELL
   ```
### 3. **Linux Environment**
   **Lua Generate** is designed to run on Linux-based systems and macOS (due to their Unix-like environment). 

   **Currently, Windows is not supported**. If you're using Windows, you can consider running Lua Generate inside a Linux-like environment, such as [WSL (Windows Subsystem for Linux)](https://docs.microsoft.com/en-us/windows/wsl/) or using a virtual machine.

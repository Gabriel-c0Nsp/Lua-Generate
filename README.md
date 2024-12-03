# Lua Generate

**Lua Generate** is a command-line tool (CLI) designed to generate boilerplate code for Next.js projects. Inspired by the practical style of Angular's `ng` tool, it simplifies the creation of common files and directories in React applications.

With support for file extension customization (e.g., `.js`, `.jsx`, `.ts`, `.tsx`), interactive commands, and detailed error messages, **Lua Generate** enhances the developer experience, allowing you to focus on what truly matters: building amazing applications.

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

---

## How to install

First, you need to clone the repository.
```bash
git clone https://github.com/Gabriel-c0Nsp/Lua-Generate 
```
Then you can navigate to the directory where the installation script lives.
```bash
cd Lua-Generate/lg
```
You need to give executable permission to lg_install.sh in order to proceed with the installation.
```bash
chmod +x ./lg_install.sh
```
Now, simply run the following command:
```bash
./lg_install.sh
```

---

## Try the `help` Command

Before diving in, explore the available features using the help command in your terminal:

```bash
lg --help
```
This command will display all available options, commands, and their alternative syntaxes, helping you get familiar with the tool.

---

## Commands and features
In this section, you will find a basic usage guide for each Lua Generate feature, including examples and alternative syntax for the same command.

- ### lg init
This command initializes the configuration file in the current directory. It is recommended to run it in the project's root directory.

You can run the command as follows:

```bash
lg init
```
and the file `lg_config.txt` will be created in the current directory with some default settings.

The `lg init` command also accepts a flag, `-silent`, which automatically adds the configuration file to the project's `.gitignore`.

```bash
lg init -silent
```
`-silent` will take care of finding your project's `.gitignore` file and adding the relative path that contains the configuration file created by `lg init`.

|Explicit Syntax|Abbreviation|
|---|---|
|**lg init**|lg i|
|**lg init -silent**|lg init -silent|
||lg init -s|
||lg i -silent|
||lg i -s|

- ### lg config
This command displays your current config (found in the configuration file `lg_config.txt`).

You can try the command as follows:

```bash
lg config
```
You should see a message displaying information such as the styling type and file extensions that are configured. In the next section, you will learn how to safely modify the configuration file.

|Explicit Syntax|Abbreviation|
|---|---|
|**lg config**|lg c|

- ### lg config update
This command runs the configuration script.

Try the command and follow the instructions to configure **Lua Generate** according to your project's needs.

```bash
lg config update
```

After updating your config file, note that it is not necessary to run the `lg config update` command again each time you want to generate a file with a different extension. You can simply run the command `lg generate component <file_name>.desired_extension`. **Lua Generate** will not prevent you from creating files with arbitrary extensions. More information about the `lg generate component` command can be found in the next section.

As mentioned before, `lg init` creates the configuration file `lg_config.txt`, and `lg config update` modifies the information within this file. The user, as the owner of their operating system, has full permission to edit the text file directly. Doing it may lead to unexpected behavior when accessing these settings. To prevent issues, **Lua Generate** always validates the `lg_config.txt` file before executing any function. If an invalid configuration is detected, it will automatically be replaced with a valid one using default values.

|Explicit Syntax|Abbreviation|
|---|---|
|**lg config update**|lg config u|
||lg c update|
||lg c u|

# Lua Generate

**Lua Generate** is a command-line tool (CLI) designed to generate boilerplate code for [Next.js](https://nextjs.org/docs) projects. Inspired by the practical style of Angular's `ng` tool, it simplifies the creation of common files and directories in [React](https://react.dev/) applications.

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

- ### lg generate component
This will likely be your favorite command in this script. It creates a component with the extension selected in the configuration file, and depending on your "style" configuration, it can also generate additional files (such as a file with the provided component name but with a `.css` extension, for example).

You can try it yourself with the following command:

```bash
lg generate component foo
```

The command also accepts a path indicating where the component should be created. If the path does not exist, Lua Generate will create the necessary directories corresponding to the path provided in the command argument.

Try the example below and check the result using the [tree](https://en.wikipedia.org/wiki/Tree_(command)) command (you may need to install `tree` using your system's package manager).
```bash
lg generate component foo ./src/pages/examples/
```

As you get more familiar with the `lg generate component` command, you will notice that **Lua Generate** is quite flexible in how you create your components and will interpret what you are trying to do, even if the arguments are not arranged correctly. For example, note that the following command will create the component `foo`, even if it is placed in an argument that should be interpreted as a path.
```bash
lg generate component ./another/example/generation/foo
```

In this case, the `foo` component will be generated inside the `generation` directory. Again, you can check the result using the `tree` command.

Keep in mind that the `lg generate component` command also detects when a component already exists in a directory. It will always prompt the user to choose whether to proceed with creating the component, overwriting the existing one, or abort the operation.

|Explicit Syntax|Abbreviation|
|---|---|
|**lg generate component**|lg generate c|
||lg g component|
||lg g c|

- ### lg generate page
This is the most specific command you will find in **Lua Generate**. All other commands are generally useful for [React](https://react.dev/) applications, but this command is particularly useful for applications using [Next.js](https://nextjs.org/docs). The page system is essential in `Next.js` applications, so if you are not using this technology, you might not find much use for the `lg generate page` command.

If you are familiar with `Next.js` applications, you likely have an idea of what this command does. Essentially, it creates a `page` file inside the directory specified by the user in the command's argument.

Again, you can try the command below and check the result using the `tree` command.


```bash
lg generate page home ./pages/examples/lg-web-site/
```

Notice how the `lg generate page` command accepts the function name within the page file as the first argument. However, similar to the `lg generate component` command, `lg generate page` will also attempt to interpret the user's Intention based on the argument provided when running the command.

See the example below:

```bash
lg generate page ./pages/examples/lg-web-site/home
```

This command will actually produce the same output as the previous command.

|Explicit Syntax|Abbreviation|
|---|---|
|**lg generate page**|lg generate p|
||lg g page|
||lg g p|

- ### lg generate svg
This command simplifies the process of exporting .svg files to a function. This practice is very common in React applications.

See an example of the command below:

```bash
lg generate svg Github ./assets/github.svg
```

This command will create a Github file (exporting a Github function as well) that returns an svg tag containing the contents of the `github.svg` file.

Note that if the specified path in the argument for the svg file does not exist, a file will be created with the name provided in the argument, returning only an empty svg tag.

The way `lg generate svg` works is by searching for the svg tag within the specified file using "match" functions from Lua's standard library. Therefore, you might need to format the content encapsulated by the svg tag within your generated file.

|Explicit Syntax|Abbreviation|
|---|---|
|**lg generate svg**|lg generate s|
||lg g svg|
||lg g s|

- ### lg help
This command provides a quick reference on how to use all the others. It is very useful if you forget how to use a specific feature, allowing for a quick lookup with the `lg help` command.

Try the `lg help` command yourself and see the output.

```bash
lg help
```
Note that much of the content from the `lg help` command has already been discussed in this `README.md` file, but with a much more concise description. You will also find a reference to this documentation within the `lg help` command itself.

|Explicit Syntax|Abbreviation|
|---|---|
|**lg help**|lg h|
|**lg --help**||

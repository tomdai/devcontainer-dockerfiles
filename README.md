# Dockerfiles for [Development Containers](https://code.visualstudio.com/docs/remote/containers)

Each `Dockerfile` in this repository is configured to create an image that works for a certain development need. The images are automatically built for `linux/amd64` and `linux/arm64` and pushed to [GitHub Contaienr Registry](https://github.com/users/tomdai/packages?repo_name=devcontainer-dockerfiles).

## What's Special?

Every image is configured to have the same command-line experience with customized [Zsh](https://www.zsh.org/) (shell) and [Starship](https://starship.rs/) (shell prompt). [SF Symbols](https://developer.apple.com/design/resources/#sf-symbols) is required to be installed for the [Starship customization](https://starship.rs/config/#prompt) to work best.

![screenshot](https://user-images.githubusercontent.com/5054148/137548067-a2ed62e9-af22-47b6-a1f7-95698bc4e018.png)

Notice the gorgeous SF Symbols in the terminal.

# Dockerfiles for [Development Containers](https://code.visualstudio.com/docs/remote/containers)

Each `Dockerfile` in this repository is configured to create an image that works for a certain development need. The images are automatically built and pushed to [Docker Hub](https://hub.docker.com/u/tomdai).

Every image is configured to have the same command-line experience with customized [Zsh](https://www.zsh.org/) and [Starship](https://starship.rs/). [SF Symbols](https://developer.apple.com/design/resources/#sf-symbols) and [SF Pro](https://developer.apple.com/fonts/) are required to be installed on the host machine for the [Starship customization](https://starship.rs/config/#prompt) to work best.

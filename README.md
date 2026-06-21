# ZSH Docker Aliases

Defines [Docker][1] aliases and functions.

## How to Install

## Install for Zinit
> `~/.zshrc`
```sh
source "$HOME/.zinit/bin/zinit.zsh"
zinit ice lucid nocompile wait'0e' nocompletions
zinit load MenkeTechnologies/zsh-docker-aliases
```

## Install for Oh My Zsh

```sh
cd "$HOME/.oh-my-zsh/custom/plugins" && git clone https://github.com/MenkeTechnologies/zsh-docker-aliases.git
```

## Aliases

### Docker

- `dk` is short for `docker`
- `dka` Attach to a running container
- `dkb` Build an image from a Dockerfile
- `dkd` Inspect changes on a container's filesystem
- `dkdf` Show docker filesystem usage
- `dke` Run a command in a running container
- `dkE` Run an interactive command in a running container
- `dkh` Show the history of an image
- `dkis` List images
- `dkin` Return low-level information on a container, image or task
- `dkim` Import the contents from a tarball to create a filesystem image
- `dkk` Kill a running container
- `dkkh` Send `kill -s HUP` signal to a running container
- `dkl` Fetch the logs of a container
- `dkL` Fetch and follow (`-f`) the logs of a container
- `dkli` Log in to a Docker registry
- `dklo` Log out from a Docker registry
- `dkls` is alias for `dkps`
- `dkp` Pause all processes within one or more containers
- `dkP` Unpause all processes within one or more containers
- `dkpl` Pull an image or a repository from a registry
- `dkph` Push an image or a repository to a registry
- `dkps` List containers
- `dkpsa` List all containers (default lists just running)
- `dkpsv` List containers in a vertical key/value format
- `dkr` Run a command in a new container
- `dkR` Run an interactive command in a new container and automatically remove the container when it exits
- `dkRe` like `dkR` and set entry point to `/bin/bash`
- `dkRM` Remove unused data (`docker system prune`)
- `dkrm` Remove one or more containers
- `dkrmi` Clean up dangling images
- `dkrmc` Clean up exited containers
- `dkrmv` Clean up dangling volumes
- `dkrn` Rename a container
- `dks` Start one or more stopped containers
- `dkS` Restart a container
- `dkss` Display a live stream of container(s) resource usage statistics
- `dksv` Save one or more images to a tar archive (streamed to STDOUT by default)
- `dkt` Tag an image into a repository
- `dktop` Display the running processes of a container
- `dkup` Update configuration of one or more containers
- `dkv` Manage Docker volumes
- `dkvs` Show the Docker version information
- `dkpli` Pull all tagged images
- `dkw` Block until a container stops, then print its exit code
- `dkx` Stop a running container

#### container (c)

- `dkc` Manage containers
- `dkca` Attach to a running container
- `dkccp` Copy files/folders between a container and the local filesystem
- `dkcd` Inspect changes on a container's filesystem
- `dkce` Run an interactive command in a running container
- `dkcin` Display detailed information on one or more containers
- `dkck` Kill one or more running containers
- `dkcl` Fetch the logs of a container
- `dkcL` Fetch and follow (`-f`) the logs of a container
- `dkcls` List containers
- `dkcp` Pause all processes within one or more containers
- `dkcpr` Remove all stopped containers
- `dkcrn` Rename a container
- `dkcS` Restart one or more containers
- `dkcrm` Remove one or more containers
- `dkcr` Run an interactive command in a new container
- `dkcR` Run an interactive command in a new container and automatically remove the container when it exits
- `dkcre` like `dkcR` and set entry point to `/bin/bash`
- `dkcrd` Run a command in a new detached container
- `dkcs` Start one or more stopped containers
- `dkcss` Display a live stream of container(s) resource usage statistics
- `dkcx` Stop one or more running containers
- `dkctop` Display the running processes of a container
- `dkcP` Unpause all processes within one or more containers
- `dkcup` Update configuration of one or more containers
- `dkcw` Block until one or more containers stop, then print their exit codes

#### image (I)

- `dki` Manage images
- `dkib` Build an image from a Dockerfile
- `dkih` Show the history of an image
- `dkiim` Import the contents from a tarball to create a filesystem image
- `dkiin` Display detailed information on one or more images
- `dkils` List images
- `dkipr` Remove unused images
- `dkipl` Pull an image or a repository from a registry
- `dkiph` Push an image or a repository to a registry
- `dkirm` Remove one or more images
- `dkisv` Save one or more images to a tar archive (streamed to STDOUT by default)
- `dkit` Tag an image into a repository

#### volume (V)

- `dkv` Manage volumes
- `dkvin` Display detailed information on one or more volumes
- `dkvls` List volumes
- `dkvpr` Remove all unused volumes
- `dkvrm` Remove one or more volumes

#### network (N)

- `dkn` Manage networks
- `dkns` Connect a container to a network
- `dknx` Disconnects a container from a network
- `dknin` Displays detailed information on a network
- `dknls` Lists all the networks created by the user
- `dknpr` Remove all unused networks
- `dknrm` Deletes one or more networks

#### system (Y)

- `dky` Manage Docker
- `dkydf` Show docker filesystem usage
- `dkypr` Remove unused data

#### stack (K)

- `dkk` Manage Docker stacks
- `dkkls` List stacks
- `dkkps` List the tasks in the stack
- `dkKrm` Remove the stack

#### swarm (W)

- `dkw` Manage Docker Swarm

### Docker Machine

- `dkm` is short for `docker-machine`
- `dkma` Get or set the active machine
- `dkmcp` Copy files between machines
- `dkmd` Set up the default machine ; alowing you to use `dkme` without arguments
- `dkme` Set up the environment for the Docker client (eg: `dkme staging` to toggle to staging)
- `dkmin` Inspect information about a machine
- `dkmip` Get the IP address of a machine
- `dkmk` Kill a machine
- `dkmls` List machines
- `dkmpr` Re-provision existing machines
- `dkmps` is short for `docker-machine ps`
- `dkmrg` Regenerate TLS Certificates for a machine
- `dkmrm` Remove a machine
- `dkms` Start a machine
- `dkmsh` Log into or run a command on a machine with SSH
- `dkmst` Get the status of a machine
- `dkmS` Restart a machine
- `dkmu` Get the URL of a machine
- `dkmup` Upgrade a machine to the latest version of Docker
- `dkmv` Show the Docker Machine version or a machine docker version
- `dkmx` Stop a machine

### Docker Compose

- `dco` is short for `docker-compose`
- `dcb` Build or rebuild services
- `dcB` Build or rebuild services and do not use cache when building the image
- `dcd` Stop and remove containers, networks, images, and volumes
- `dce` Execute a command in a running container
- `dck` Kill containers
- `dclo` View output from containers
- `dcL` View and follow (`-f`) output from containers
- `dcls` is alias for `dcps`
- `dcp` Pause services
- `dcP` Unpause services
- `dcpl` Pull service images
- `dcph` Push service images
- `dcps` List containers
- `dcr` Run a one-off command
- `dcR` Run a one-off command and remove container after run.
- `dcrm` Remove stopped containers
- `dcs` Start services
- `dcsc` Set number of containers for a service
- `dcS` Restart services
- `dcU` Create and start containers
- `dcu` Create and start containers in detached mode (run containers in the background)
- `dcv` Show the Docker-Compose version information
- `dcx` Stop services

## Author

*The author of this module should be contacted via the [issue tracker][3].*

- [François Vantomme](https://github.com/akarzim)

[1]: https://www.docker.com/
[2]: https://github.com/zplug/zplug
[3]: https://github.com/akarzim/zsh-docker-aliases/issues

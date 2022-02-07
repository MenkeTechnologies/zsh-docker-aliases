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
- `dka!` Attach to a running container by name
- `dkb` Build an image from a Dockerfile
- `dkd` Inspect changes on a container's filesystem
- `dkdf` Show docker filesystem usage
- `dke` Run a command in a running container
- `dkE` Run an interactive command in a running container
- `dkE!` Run an interactive command in a running container by name
- `dkh` Show the history of an image
- `dki` List images
- `dkin` Return low-level information on a container, image or task
- `dkk` Kill a running container
- `dkkh` Send `kill -s HUP` signal to a running container
- `dkl` Fetch the logs of a container
- `dkL` Fetch and follow (`-f`) the logs of a container
- `dkli` Log in to a Docker registry
- `dklo` Log out from a Docker registry
- `dkls` is alias for `dkps`
- `dkp` Pause all processes within one or more containers<Paste>
- `dkP` Unpause all processes within one or more containers
- `dkpl` Pull an image or a repository from a registry
- `dkplI` Pull all tagged images
- `dkph` Push an image or a repository to a registry
- `dkps` List containers
- `dkps!` Display the first matching docker container ID by name
- `dkpsa` List all containers (default lists just running)
- `dkr` Run a command in a new container
- `dkR` Run an interactive command in a new container and automatically remove the container when it exits
- `dkRe` like `dkR` and set entry point to `/bin/bash`
- `dkrm` Remove one or more containers
- `dkrmi` Remove one or more images
- `dkrmC` Clean up exited containers
- `dkrmI` Clean up dangling images
- `dkrmV` Clean up unused volumes ( Docker >= 1.9 )
- `dkrn` Rename a container
- `dks` Start one or more stopped containers
- `dkS` Restart a container
- `dkss` Display a live stream of container(s) resource usage statistics
- `dksv` Save one or more images to a tar archive (streamed to STDOUT by default)
- `dkt` Tag an image into a repository
- `dktop` Display the running processes of a container
- `dkup` Update configuration of one or more containers
- `dkV` Manage Docker volumes
- `dkv` Show the Docker version information
- `dkw` Block until a container stops, then print its exit code<Paste>
- `dkx` Stop a running container

#### container (c)

- `dkc` Manage containers
- `dkca` Attach to a running container
- `dkccp` Copy files/folders between a container and the local filesystem
- `dkcd` Inspect changes on a container's filesystem
- `dkce` Run a command in a running container
- `dkcE` Run an interactive command in a running container
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
- `dkcr` Run a command in a new container
- `dkcR` Run an interactive command in a new container and automatically remove the container when it exits
- `dkcRe` like `dkCR` and set entry point to `/bin/bash`
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

- `dkK` Manage Docker stacks
- `dkKls` List stacks
- `dkKps` List the tasks in the stack
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
- `dkmps` is alias for `dkmls`
- `dkmrg` Regenerate TLS Certificates for a machine
- `dkmrm` Remove a machine
- `dkms` Start a machine
- `dkmsh` Log into or run a command on a machine with SSH
- `dkmst` Get the status of a machine
- `dkmS` Restart a machine
- `dkmu` Get the URL of a machine
- `dkmup` Upgrade a machine to the latest version of Docker
- `dkmV` Show the Docker Machine version or a machine docker version
- `dkmx` Stop a machine

### Docker Compose

- `dkC` is short for `docker-compose`
- `dkCb` Build or rebuild services
- `dkCB` Build or rebuild services and do not use cache when building the image
- `dkCd` Stop and remove containers, networks, images, and volumes
- `dkCe` Execute a command in a running container
- `dkCk` Kill containers
- `dkCl` View output from containers
- `dkCL` View and follow (`-f`) output from containers
- `dkCls` is alias for `dkcps`
- `dkCp` Pause services
- `dkCP` Unpause services
- `dkCpl` Pull service images
- `dkCph` Push service images
- `dkCps` List containers
- `dkCr` Run a one-off command
- `dkCR` Run a one-off command and remove container after run.
- `dkCrm` Remove stopped containers
- `dkCs` Start services
- `dkCsc` Set number of containers for a service
- `dkCS` Restart services
- `dkCu` Create and start containers
- `dkCU` Create and start containers in detached mode:
           Run Containers in the background, print new container names
- `dkCV` Show the Docker-Compose version information
- `dkCx` Stop services

## Author

*The author of this module should be contacted via the [issue tracker][3].*

- [François Vantomme](https://github.com/akarzim)

[1]: https://www.docker.com/
[2]: https://github.com/zplug/zplug
[3]: https://github.com/akarzim/zsh-docker-aliases/issues

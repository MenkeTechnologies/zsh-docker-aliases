#
# Defines Docker aliases.
#
# Author:
#   François Vantomme <akarzim@gmail.com>
#

#
# Aliases
#

# Docker
alias dk='docker'
alias dka='docker attach'
alias dkb='docker build'
alias dkd='docker diff'
alias dkdf='docker system df'
alias dke='docker exec'
alias dkE='docker exec -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t'
alias dkh='docker history'
alias dkis='docker images'
alias dkin='docker inspect'
alias dkim='docker import'
alias dkk='docker kill'
alias dkkh='docker kill -s HUP'
alias dkl='docker logs'
alias dkL='docker logs -f'
alias dkli='docker login'
alias dklo='docker logout'
alias dkls='docker ps'
alias dkp='docker pause'
alias dkP='docker unpause'
alias dkpl='docker pull'
alias dkph='docker push'
alias dkps='docker ps'
alias dkpsa='docker ps -a'
alias dkpsv='docker ps --format="ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"'
alias dkr='docker run'
alias dkR='docker run -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t --rm'
alias dkRe='docker run -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t --rm --entrypoint /bin/bash'
alias dkRM='docker system prune'
alias dkrm='docker rm'
alias dkrmi='docker rmi'
alias dkrn='docker rename'
alias dks='docker start'
alias dkS='docker restart'
alias dkss='docker stats'
alias dksv='docker save'
alias dkt='docker tag'
alias dktop='docker top'
alias dkup='docker update'
alias dkv='docker volume'
alias dkvs='docker version'
alias dkw='docker wait'
alias dkx='docker stop'

## Container (c)
alias dkc='docker container'
alias dkca='docker container attach'
alias dkccp='docker container cp'
alias dkcd='docker container diff'
alias dkce='docker container exec -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t'
alias dkcin='docker container inspect'
alias dkck='docker container kill'
alias dkcl='docker container logs'
alias dkcL='docker container logs -f'
alias dkcls='docker container ls'
alias dkcp='docker container pause'
alias dkcpr='docker container prune'
alias dkcrn='docker container rename'
alias dkcS='docker container restart'
alias dkcrm='docker container rm'
alias dkcr='docker container run -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t '
alias dkcR='docker container run -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t --rm'
alias dkcre='docker container run -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t --rm --entrypoint /bin/bash'
alias dkcrd='docker container run -e COLUMNS=`tput cols` -e LINES=`tput lines` -d'
alias dkcs='docker container start'
alias dkcss='docker container stats'
alias dkcx='docker container stop'
alias dkctop='docker container top'
alias dkcP='docker container unpause'
alias dkcup='docker container update'
alias dkcw='docker container wait'

## Image (i)
alias dki='docker image'
alias dkib='docker image build'
alias dkih='docker image history'
alias dkiim='docker image import'
alias dkiin='docker image inspect'
alias dkils='docker image ls'
alias dkipr='docker image prune'
alias dkipl='docker image pull'
alias dkiph='docker image push'
alias dkirm='docker image rm'
alias dkisv='docker image save'
alias dkit='docker image tag'

## Volume (v)
alias dkv='docker volume'
alias dkvin='docker volume inspect'
alias dkvls='docker volume ls'
alias dkvpr='docker volume prune'
alias dkvrm='docker volume rm'

## Network (n)
alias dkn='docker network'
alias dkns='docker network connect'
alias dknx='docker network disconnect'
alias dknin='docker network inspect'
alias dknls='docker network ls'
alias dknpr='docker network prune'
alias dknrm='docker network rm'

## System (y)
alias dky='docker system'
alias dkydf='docker system df'
alias dkypr='docker system prune'

## Stack (k)
alias dkk='docker stack'
alias dkkls='docker stack ls'
alias dkkps='docker stack ps'
alias dkKrm='docker stack rm'

## Swarm (w)
alias dkw='docker swarm'

## CleanUp (rm)
# Clean up exited containers (docker < 1.13)
alias dkrmc='docker rm $(docker ps -qaf status=exited)'

# Clean up dangling images (docker < 1.13)
alias dkrmi='docker rmi $(docker images -qf dangling=true)'

# Pull all tagged images
alias dkpli='docker images --format "{{ .Repository }}" | grep -v "^<none>$" | xargs -L1 docker pull'

# Clean up dangling volumes (docker < 1.13)
alias dkrmv='docker volume rm $(docker volume ls -qf dangling=true)'

# Docker Machine (m)
alias dkm='docker-machine'
alias dkma='docker-machine active'
alias dkmcp='docker-machine scp'
alias dkmin='docker-machine inspect'
alias dkmip='docker-machine ip'
alias dkmk='docker-machine kill'
alias dkmls='docker-machine ls'
alias dkmpr='docker-machine provision'
alias dkmps='docker-machine ps'
alias dkmrg='docker-machine regenerate-certs'
alias dkmrm='docker-machine rm'
alias dkms='docker-machine start'
alias dkmsh='docker-machine ssh'
alias dkmst='docker-machine status'
alias dkmS='docker-machine restart'
alias dkmu='docker-machine url'
alias dkmup='docker-machine upgrade'
alias dkmv='docker-machine version'
alias dkmx='docker-machine stop'

# Docker Compose (C)
alias dkC='docker-compose'
alias dkCb='docker-compose build'
alias dkCB='docker-compose build --no-cache'
alias dkCd='docker-compose down'
alias dkCe='docker-compose exec -e COLUMNS=`tput cols` -e LINES=`tput lines`'
alias dkCk='docker-compose kill'
alias dkCl='docker-compose logs'
alias dkCL='docker-compose logs -f'
alias dkCls='docker-compose ps'
alias dkCp='docker-compose pause'
alias dkCP='docker-compose unpause'
alias dkCpl='docker-compose pull'
alias dkCph='docker-compose push'
alias dkCps='docker-compose ps'
alias dkCr='docker-compose run -e COLUMNS=`tput cols` -e LINES=`tput lines`'
alias dkCR='docker-compose run -e COLUMNS=`tput cols` -e LINES=`tput lines` --rm'
alias dkCrm='docker-compose rm'
alias dkCs='docker-compose start'
alias dkCsc='docker-compose scale'
alias dkCS='docker-compose restart'
alias dkCu='docker-compose up'
alias dkCU='docker-compose up -d'
alias dkCv='docker-compose version'
alias dkCx='docker-compose stop'

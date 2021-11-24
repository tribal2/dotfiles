#!/usr/bin/bash

# sources
# https://gist.github.com/jgrodziski/9ed4a17709baad10dbcd4530b60dfcbb
# https://gist.github.com/mspronk/cab0c175b876ef662e25b1ba2d22b069

function help-fn {
    cat <<EOF
#################################################################################################
#                                                                                               #
#                     --------------- Useful Docker Aliases ---------------                     #
#                                                                                               #
#     # Usage:                                                                                  #
#     dhelp : this help output                                                                  #
#     dc    : docker-compose                                                                    #
#     dcu   : docker-compose up -d                                                              #
#     dcur  : docker-compose up -d --force-recreate                                             #
#     dcd   : docker-compose down                                                               #
#     dcr   : docker-compose restart                                                            #
#     dx    : [<id>|<name>] [<cmd>] Execute a command in a running container                    #
#     din   : docker inspect                                                                    #
#     dim   : docker image ls                                                                   #
#     dnet  : [<id>|<name>] Network name, IP and Alias                                          #
#     dlf   : docker logs -f                                                                    #
#     dps   : docker ps -a                                                                      #
#     dpsl  : docker ps -l                                                                      #
#     dpsp  : docker ps -a (id, name and ports)                                                 #
#     drmc  : remove all exited containers                                                      #
#     drmi  : docker rmi                                                                        #
#     drmid : remove all dangling images                                                        #
#     drun  : [<image>|'Alpine'] [<cmd>|'ash'] Execute a <cmd> in NEW container from <image>    #
#     dsr   : [<id>|<name>] Stop then remove <container>                                        #
#                                                                                               #
#################################################################################################
EOF
}

function dnet-fn-one {
    docker inspect --format '{{define "name"}}{{range $index, $element := .}}{{printf "\n   Network: %s\n        IP: %s\n   Aliases: %s\n" ($index) ($element.IPAddress) ($element.Aliases)}}{{end}}{{ printf "\n\n\n" }}{{end}} {{printf "\n CONTAINER: %s\n        ID: %s\n" (slice .Name 1 (len .Name)) (slice .Id 0 12)}}{{template "name" .NetworkSettings.Networks}}' $1
}
function dnet-fn {
    if [ ! -z "$1" ]; then
        dnet-fn-one $1
    else
        for ID in `docker ps -aq`
        do
            dnet-fn-one "$ID"
        done
    fi
}
function dx-fn {
    docker exec -it $1 ${2:-ash}
}
function drun-fn {
	docker run -it --rm ${1:-alpine} ${2:-ash}
}
function dsr-fn {
	docker stop $1;docker rm $1
}
function drmc-fn {
    docker rm $(docker ps --all -q -f status=exited)
}
function drmid-fn {
    imgs=$(docker images -q -f dangling=true)
    [ ! -z "$imgs" ] && docker rmi "$imgs" || echo "no dangling images."
}

alias dhelp=help-fn
alias dc="docker-compose"
alias dcu="docker-compose up -d"
alias dcur="docker-compose up -d --force-recreate"
alias dcd="docker-compose down"
alias dcr="docker-compose restart"
alias dx=dx-fn
alias din="docker inspect"
alias dim="docker image ls"
alias dnet=dnet-fn
alias dlf="docker logs -f"
alias dps="docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}'"
alias dpsl="docker ps -l --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'"
alias dpsp="docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Ports}}'"
alias drmc=drmc-fn
alias drmi="docker rmi"
alias drmid=drmid-fn
alias drun=drun-fn
alias dsp="docker system prune --all"
alias dsr=dsr-fn

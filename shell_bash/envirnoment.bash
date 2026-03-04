#!/bin/bash
alias ll='ls -ll'

# add to .bashrc file

function getDocker-IP-Port() {
        if [ -z $1 ]; then
                docker ps -a --format "{{.ID}}" | while read -r line ; do
                        echo $line $(docker inspect --format "{{ .Name }} {{ .NetworkSettings.Networks.bridge.IPAddress }}" $line | sed 's/\///'):$(docker port "$line" | grep -o "0.0.0.0:.*" | cut -f2 -d:)
                done
        else
                echo $(docker inspect --format "{{.ID }} {{ .Name }} {{ .NetworkSettings.Networks.bridge.IPAddress }}" $1 | sed 's/\///'):$(docker port "$1" | grep -o "0.0.0.0:.*" | cut -f2 -d:)
        fi
}


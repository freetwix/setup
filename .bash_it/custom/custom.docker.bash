
# docker-machine
#   create: docker-machine create --driver virtualbox default
#   start:  docker-machine start default

DOCKER_MACHINE_VM=default

if [ "$(docker-machine status ${DOCKER_MACHINE_VM})" == "Running" ]; then
  echo "* Found preferred DOCKER_MACHINE_VM '${DOCKER_MACHINE_VM}', setting env for it"
  eval "$(docker-machine env ${DOCKER_MACHINE_VM})"
else
  echo "* Preferred DOCKER_MACHINE_VM '${DOCKER_MACHINE_VM}' not running"
fi

# aliases

# https://github.com/spotify/docker-gc
alias docker-gc="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc"

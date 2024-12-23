#!/bin/bash

DOCKER_IMAGE=$1
DOCKER_REGISTRY=$2

function build_image {
    echo "Building Docker image $DOCKER_IMAGE..."
    $(which docker) build -t $DOCKER_IMAGE .
}

function publish_image {
    echo "Publishing Docker image $DOCKER_IMAGE to $DOCKER_REGISTRY..."
    $(which docker) tag $DOCKER_IMAGE $DOCKER_REGISTRY/$DOCKER_IMAGE
    $(which docker) push $DOCKER_REGISTRY/$DOCKER_IMAGE
}

function deploy_container {
    echo "Deploying container from image $DOCKER_REGISTRY/$DOCKER_IMAGE..."
    $(which docker) stop my-app || true && $(which docker) rm my-app || true
    $(which docker) run -d --name my-app -p 80:80 $DOCKER_REGISTRY/$DOCKER_IMAGE
}


case "$3" in
    build)
        build_image
        ;;
    publish)
        publish_image
        ;;
    deploy)
        deploy_container
        ;;
    *)
        echo "Usage: $0 <image> <registry> <command>"
        echo "<command> can be build, publish, or deploy"
        exit 1
        ;;
esac

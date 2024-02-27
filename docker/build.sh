#!/bin/bash
IMAGE_NAME="dev-llm:v141"
docker build . -t ${IMAGE_NAME}

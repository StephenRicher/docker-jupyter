#!/usr/bin/env bash


# Get python version
tag=$(awk -F'[:-]' 'NR==1 {print $2}' Dockerfile)

docker build --tag "${tag}" .

docker=$(which docker)

mkdir -p ~/.local/share/jupyter/kernels/"${tag}"

echo """{
 \"argv\": [
  \""${docker}"\",
  \"run\",
  \"--network=host\",
  \"-v\",
  \"{connection_file}:/connection-spec\",
  \""${tag}"\",
  \"python\",
  \"-m\",
  \"ipykernel_launcher\",
  \"-f\",
  \"/connection-spec\"
 ],
 \"display_name\": \"Python "${tag}"\",
 \"language\": \"python\"
}""" > ~/.local/share/jupyter/kernels/"${tag}"/kernel.json

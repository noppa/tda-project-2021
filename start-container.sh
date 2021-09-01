#!/usr/bin/bash

# Build with
# docker build -t ml-notebook .

ex="docker"
if command -v podman &> /dev/null
then
  ex="podman"
elif ! command -v docker &> /dev/null
then
  echo "Either Docker or Podman needs to be installed"
  exit 1
fi

$ex run -i -t -p 8888:8888 \
  -v .:/notebooks:z ml-notebook /bin/bash \
  -c "/opt/conda/bin/jupyter notebook password && \
  /opt/conda/bin/jupyter notebook \
  --notebook-dir=/notebooks --ip='*' --port=8888 \
  --no-browser --allow-root"

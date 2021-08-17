#!/usr/bin/sh

# Build with
# podman build -t ml-notebook .

podman run -i -t -p 8888:8888 \
  -v .:/notebooks:z ml-notebook /bin/bash \
  -c "/opt/conda/bin/jupyter notebook password && \
  /opt/conda/bin/jupyter notebook \
  --notebook-dir=/notebooks --ip='*' --port=8888 \
  --no-browser --allow-root"

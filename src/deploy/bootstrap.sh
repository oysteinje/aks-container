#!/bin/bash

set -e

echo "Bootstrapping cluster"

flux install

flux create source git flux-system \
  --url=https://github.com/fluxcd/flux2-kustomize-helm-example \
  --branch=main \
  --interval=1m

flux create kustomization bootstrap \
  --source=flux-system \
  --path="./clusters/staging" \
  --prune=true \
  --validation=client \
  --interval=10m \

echo "Bootstrap complete."

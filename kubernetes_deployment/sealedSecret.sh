#!/bin/bash

for secret_file in $(ls secret*.yaml); do
  sudo kubeseal < "${secret_file}" > "${secret_file/.yaml/.sealed.yaml}"
done

# rm secret*.yaml
# cd ..
# git add .
# git commit -m "sealed secret"
# git push

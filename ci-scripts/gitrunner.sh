
sudo gitlab-runner register \
  --url "https://gitlab.comwork.io/comwork_training/devops-training/" \
  --registration-token "26b6d80f-61af-4770-9482-d2156345dbbb" \
  --description "docker-ruby:2.6" \
  --executor "docker" \
  --template-config /applicaitons/app-test-config.template.toml \
  --docker-image ruby:2.6

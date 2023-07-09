# Commands you used for creating the runners.

In order to create the gitlab runner,run the following command : 
```bash
docker run --rm -it -v gitlab-runner-config:/etc/gitlab-runner gitlab/gitlab-runner:latest register
```

to run GitLab Runner as a Docker container,run the following command
```bash
docker run -d --name gitlab-runner --restart always \
-v gitlab-runner-config:/etc/gitlab-runner \
-v /var/run/docker.sock:/var/run/docker.sock \
gitlab/gitlab-runner:latest
```

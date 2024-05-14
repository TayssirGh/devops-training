## Solution
First i have created 2 runners in the gitlab-ci settings. 
Then i register it locally and using the host shell as executor for the jobs with this command:

```bash
gitlab-runner register  --url https://gitlab.comwork.io  --token <token>
```

Finally i activate the runners so that they can execute the jobs if a commit event is triggered inside the project using this command :

```bash
gitlab-runner run
```
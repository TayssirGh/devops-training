In order to create a runner I first created a runner from the gitlab UI 
> settings -> CI/CD -> Runners -> New Project runner 


Then I registered the runner 
>gitlab-runner register  --url https://gitlab.comwork.io  --token *****

And finally I ran the runner before pushing the changes into the branch 
>gitlab-runner run

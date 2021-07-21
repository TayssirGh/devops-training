# Training outline

When you start the training, please create the following branches inside the current repository that have the following
names :

- `t-<your-number>-dev` : This is the branch that inside of which you will be making progress before merging changes to
  your production branch.
- `t-<your-number>-prod` : This is the branch that will represent your accepted, turned-in work. Accepted results of
  each exercice will be merged from the development branch into this one upon completion and validation.

`<your-number` represents, well... your number. If you are the first to start the training, your number should be `01`.
After which, each and every subsequent trainee should increment this number to get theirs.

## Turning in the work

When working on a particular exercice, you should always develop on your `t-<your-number>-dev` branch, create a merge
request from `t-<your-number>-dev` to `t-<your-number>-prod` and send it to your trainer for validation. You should
never push to the `master` branch, nor to the branch of a fellow trainee. If you ever have the need to create a branch,
it should have the following prefix `t-<your-number>-` to distinguish your work form that of the others.

## Environment variables inside the CI

If you ever have to add global environment variables inside the `Gitlab CI`, they should always be prefixed the
following pattern : `T<YOUR-NUMBER>_` in order to distinguish your variables from those of others.
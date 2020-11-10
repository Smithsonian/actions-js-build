# GitHub Action for Git merge

This Action for git merges the branch that triggered the action into the deploy branch specified by the checkout step.

For example, if this job is set to run when a new commit is pushed to 'master' and the `ref` for the checkout step is set to 'dev-deploy' then this step will merge master into dev-deploy.

## Usage

See [example configuration](../README.md#example-usage) for a workflow that includes a merge step.

### Inputs

* `mergeBranch` - **Required**. The branch to merge"

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.

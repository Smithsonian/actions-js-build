# GitHub Action for Git commit

This Action for git commits any changed files and pushes those changes back to the origin repository.

## Usage

See [example configuration](../README.md#example-usage) for a workflow that includes a commit step.

### Inputs

* `commitMessage` - **Optional**. Git Commit Message. Defaults to "Regenerate build artifacts."
* `wdPath` - **Optional**. To specify a directory other than the repository root to check for changed files.

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.

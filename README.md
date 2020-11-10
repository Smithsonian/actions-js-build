# Smithsonian Fork of elstudio/actions-js-build

This fork has been modified to accommodate GitHub Actions needed for building
sites that use forumone/gesso.

This repository contains three actions:

- **merge** (smithsonian/actions-js-build/merge@master): Merges the branch that triggered this action onto the branch specified in the 'Checkout deploy branch` step.
- **build** (smithsonian/actions-js-build/build@master): Installs npm dependencies and then runs `gulp build`.
- **commit** (smithsonian/actions-js-build/commit@master): Commits any file changes, and pushes them to the working branch specified in the 'Checkout working branch' step.

## Example usage

```yaml
name: Build and commit Gesso theme files to deploy branch

on:
  push:
    branches: [ master ]

jobs:
  gesso-dev-build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout deploy branch
      uses: actions/checkout@v2
      with:
        ref: dev-deploy

    - name: Merge master into deploy branch
      uses: smithsonian/actions-js-build/merge@master
      with:
        mergeBranch: master

    - name: Compile with Gulp
      uses: smithsonian/actions-js-build/build@master
      with:
        wdPath: ./htdocs/themes/gesso

    - name: Commit changes to deploy branch
      uses: smithsonian/actions-js-build/commit@master
      with:
        commitMessage: Automated commit by GitHub Actions to build Gesso files
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.

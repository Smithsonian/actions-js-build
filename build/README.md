# GitHub Action for gulp build

- **build** (elstudio/actions-js-build/build@master): Looks for a gulpfile.js or Gruntfile.js in the working directory, then installs any required npm packages and runs the build tool. If it finds neither gulp or grunt, the script runs npm. Set the workflow `args` arguments to run the tasks of your choice.

This Action for [npm](https://www.npmjs.com/) installs any required npm packages, then installs and runs gulp.

## Usage

See [example configuration](../README.md#example-usage) for a workflow that includes a build step.

### Inputs

* `wdPath` - **Optional**. To specify a directory other than the repository root where NPM's Package.json and either gulpfile.js or Gruntfile.js may be found.


## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.

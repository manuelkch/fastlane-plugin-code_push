# CodePush Fastlane Plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-code_push)

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-code_push`, add it to your project by running:

```bash
fastlane add_plugin code_push
```

## About plugin

Includes CodePush functionalities for local use and build server:

### Login action

```
code_push_login(access_key: YOURSECRETACCESSKEY)
```
Options:  

Key  | Description | Env Var | Default
------------- | ------------- | ------------- | -------------
access_key  | Access Key for CodePush Login  | CODE_PUSH_ACCESS_KEY  |
enforce  | Enforce logout before login  |  | false


### Release React action

### Promote action
https://github.com/Microsoft/code-push/blob/master/cli/README.md#promoting-updates

```
code_push_promote(app_name: YOURCODEPUSHAPPNAME)
```
Options:  

Key  | Description | Env Var | Default
------------- | ------------- | ------------- | -------------
app_name  | CodePush app name for promoting to  | FASTLANE_CODE_PUSH_APP_NAME  |
from  | sourceDeploymentName  |  | Staging
to  | destDeploymentName  |   | Production
dry_run  | Print the command that would be run, and don't run it  |  | false
## Dependencies
CodePush CLI :
http://microsoft.github.io/code-push/


## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

**Note to author:** Please set up a sample project to make it easy for users to explore what your plugin does. Provide everything that is necessary to try out the plugin in this project (including a sample Xcode/Android project if necessary)

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using `fastlane` Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About `fastlane`

`fastlane` is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).

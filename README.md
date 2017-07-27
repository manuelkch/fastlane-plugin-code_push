# CodePush Fastlane Plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-code_push)

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-code_push`, add it to your project by running:

```bash
fastlane add_plugin code_push
```

## Dependencies
CodePush CLI :
http://microsoft.github.io/code-push/

## About plugin

Includes "some" CodePush functionalities for local use and build server:
The functionallity is currently limited to the options described below. The plugin got created out of a specific business need. So if you'd like to have more freedom to specify things like parameters by your needs, create a pull request or ask for it....

### Login action
https://github.com/Microsoft/code-push/blob/master/cli/README.md#access-keys

```
code_push_login(access_key: YOURSECRETACCESSKEY)
```
Options:  

Key  | Description | Env Var | Default
------------- | ------------- | ------------- | -------------
access_key  | Access Key for CodePush Login  | CODE_PUSH_ACCESS_KEY  |
enforce  | Enforce logout before login  |  | false

"enforce" is usefull if you want to be assure that actions are done by a specfic "user" and not by  the may current logged in user. Like in the context of a automatic build process

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


### Release React action

https://github.com/Microsoft/code-push/blob/master/cli/README.md#releasing-updates-react-native

```
code_push_release_react(
        app_name: "YOURAPPNAME",
        target_binary_version: "1.0.5"
      )
```

Key  | Description | Env Var | Default
------------- | ------------- | ------------- | -------------
app_name  | CodePush app name for releasing | FASTLANE_CODE_PUSH_APP_NAME  |
execution_dir_path  | Release React CLI command execution dir path. Set to project root when you execute fastlane in a diffrent dir than package.json stays  |  | ./
platform  | Platform for releasing to  |  | android
deployment  | Deployment name for releasing to  |   | Staging
target_binary_version  | Target binary version for example 1.0.1  |  |
mandatory  | manadtory update or not  |   | true
description  | Release description for CodePush  |  | no description for release
disabled  | Specifies whether this release should be immediately downloadable  [boolean] [Standard: false]  |  | false
dry_run  | Print the command that would be run, but don't run it  |  | false
## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

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

module Fastlane
  module Actions
    class CodePushReleaseReactAction < Action
      def self.run(params)
        command = "code-push release-react #{params[:app_name]} #{params[:platform]} -d #{params[:deployment]} "\
          "--des \"#{params[:description]}\" "
        if params[:mandatory]
          command += "-m "
        end
        if params[:target_binary_version]
          command += "-t #{params[:target_binary_version]} "
        end
        if params[:dry_run]
          UI.message("Dry run!".red + " Would have run: " + command + "\n")
        else
          sh(command.to_s)
        end
      end

      def self.description
        "CodePush release-react functionality for fastlane"
      end

      def self.authors
        ["Manuel Koch"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Fastlane Cli Wrapper for CodePush's release-react command"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :app_name,
                                      env_name: "FASTLANE_CODE_PUSH_APP_NAME",
                                      type: String,
                                      optional: false,
                                      description: "CodePush app name for releasing"),
          FastlaneCore::ConfigItem.new(key: :platform,
                                       type: String,
                                       optional: true,
                                       default_value: "android",
                                       description: "Platform for releasing to"),
          FastlaneCore::ConfigItem.new(key: :deployment,
                                       type: String,
                                       optional: true,
                                       default_value: "Staging",
                                       description: "Deployment name for releasing to"),
          FastlaneCore::ConfigItem.new(key: :target_binary_version,
                                       is_string: false,
                                       optional: true,
                                       description: "Target binary version for example 1.0.1"),
          FastlaneCore::ConfigItem.new(key: :mandatory,
                                       is_string: false,
                                       default_value: true,
                                       optional: true,
                                       description: "mandatory update or not"),
          FastlaneCore::ConfigItem.new(key: :description,
                                       type: String,
                                       optional: true,
                                       default_value: "no description for release",
                                       description: "Release description for CodePush"),
          FastlaneCore::ConfigItem.new(
                                      key: :dry_run,
                                      description: "Print the command that would be run, and don't run it",
                                      is_string: false,
                                      default_value: false)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end

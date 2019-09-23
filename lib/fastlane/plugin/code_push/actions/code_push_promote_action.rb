module Fastlane
  module Actions
    class CodePushPromoteAction < Action
      def self.run(params)
        command = "npx code-push promote #{params[:app_name]} #{params[:from]} #{params[:to]}"
        if params[:dry_run]
          UI.message("Dry run!".red + " Would have run: " + command + "\n")
        else
          sh(command.to_s)
        end
      end

      def self.description
        "CodePush promote"
      end

      def self.authors
        ["Manuel Koch"]
      end

      def self.return_value
      end

      def self.details
        "CodePush promote functionality"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :app_name,
                                      env_name: "FASTLANE_CODE_PUSH_APP_NAME",
                                      type: String,
                                      optional: false,
                                      description: "CodePush app name for promoting to"),
          FastlaneCore::ConfigItem.new(key: :from,
                                      type: String,
                                      optional: true,
                                      default_value: "Staging",
                                      description: "sourceDeploymentName"),
          FastlaneCore::ConfigItem.new(key: :to,
                                       type: String,
                                       optional: true,
                                       default_value: "Production",
                                       description: "destDeploymentName"),
          FastlaneCore::ConfigItem.new(key: :dry_run,
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

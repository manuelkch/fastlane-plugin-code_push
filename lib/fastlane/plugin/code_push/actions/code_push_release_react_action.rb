module Fastlane
  module Actions
    class CodePushReleaseReactAction < Action
      def self.run(params)
        Dir.chdir "#{params[:execution_dir_path]}" do
          command = "code-push release-react #{params[:app_name]} #{params[:platform]} -d #{params[:deployment]} "\
            "--des \"#{params[:description]}\" "
          if params[:mandatory]
            command += "-m "
          end
          if params[:target_binary_version]
            command += "-t #{params[:target_binary_version]} "
          end
          if params[:disabled]
            command += "-x "
          end
          if params[:no_duplicate_release_error]
            command += "--noDuplicateReleaseError "
          end
          if params[:bundle_name]
            command += "-b #{params[:bundle_name]} "
          end
          if params[:output_dir]
            command += "-o #{params[:output_dir]} "
          end
          if params[:sourcemap_output]
            command += "-s #{params[:sourcemap_output]} "
          end
          if params[:entry_file]
            command += "-e #{params[:entry_file]} "
          end
          if params[:dry_run]
            UI.message("Dry run!".red + " Would have run: " + command + "\n")
          else
            sh(command.to_s)
          end
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
         FastlaneCore::ConfigItem.new(key: :execution_dir_path,
                                     type: String,
                                     optional: true,
                                     default_value: "./",
                                     description: "Release React CLI command execution dir"),
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
          FastlaneCore::ConfigItem.new(key: :dry_run,
                                       description: "Print the command that would be run, and don't run it",
                                       is_string: false,
                                       default_value: false),
          FastlaneCore::ConfigItem.new(key: :disabled,
                                      is_string: false,
                                      default_value: false,
                                      optional: true,
                                      description: "Specifies whether this release should be immediately downloadable"),
          FastlaneCore::ConfigItem.new(key: :no_duplicate_release_error,
                                      is_string: false,
                                      default_value: false,
                                      optional: true,
                                      description: "Specifies whether to return an error if the main bundle is identical to the latest codepush release"),
          FastlaneCore::ConfigItem.new(key: :bundle_name,
                                      is_string: true,
                                      optional: true,
                                      description: "Specifies the name of the bundle file"),
          FastlaneCore::ConfigItem.new(key: :output_dir,
                                      is_string: true,
                                      optional: true,
                                      description: "Specifies path to where the bundle and sourcemap should be written"),
          FastlaneCore::ConfigItem.new(key: :sourcemap_output,
                                      is_string: true,
                                      optional: true,
                                      description: "Specifies path to write sourcemap to"),
          FastlaneCore::ConfigItem.new(key: :entry_file,
                                      is_string: true,
                                      optional: true,
                                      description: "Specifies the relative path to the app's root/entry JavaScript file")
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end

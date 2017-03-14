module Fastlane
  module Actions
    class CodePushLoginAction < Action
      def self.run(params)
        if params[:enforce] == true
          Helper::CodePushLoginHelper.log_out
        end
        if Helper::CodePushLoginHelper.is_logged_in == false
          if params[:access_key].instance_of?(String)
            Helper::CodePushLoginHelper.log_in(params[:access_key])
          else
            UI.error("Provide parameter :access_key String")
          end
        else
          UI.important "Login skipped !!! You were allready logged in. Logout first "
        end
      end

      def self.description
        "CodePush logi with accessKey if not allready logged in"
      end

      def self.authors
        ["Manuel Koch"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Generall CodePush login functionality for fastlane with pre check if user is allready logged in"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :access_key,
                                      env_name: "CODE_PUSH_ACCESS_KEY",
                                      type: String,
                                      optional: false,
                                      description: "Access Key for CodePush Login"),
          FastlaneCore::ConfigItem.new(key: :enforce,
                                       type: TrueClass,
                                       optional: true,
                                       default_value: false,
                                       description: "Enforce logout before login"),
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end

module Fastlane
  module Actions
    class CodePushLoginAction < Action
      def self.run(params)
        if params[:enforce] == true
          Helper::CodePushLoginHelper.log_out
        end
        if Helper::CodePushLoginHelper.is_logged_in == false
          if params[:token].instance_of?(String)
            Helper::CodePushLoginHelper.log_in(params[:token])
          else
            UI.user_error!("Provide parameter :token String")
          end
        else
          UI.important "Login skipped !!! You were allready logged in. Logout first "
        end
      end

      def self.description
        "AppCenter login with accessKey"
      end

      def self.authors
        ["Manuel Koch", "Hannan Shaik"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Generall CodePush login functionality for fastlane with optional enforced relogin"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :token,
                                      env_name: "APP_CENTER_ACCESS_TOKEN",
                                      type: String,
                                      optional: false,
                                      description: "Access Key for AppCenter Login"),
          FastlaneCore::ConfigItem.new(key: :enforce,
                                       type: TrueClass,
                                       optional: true,
                                       default_value: false,
                                       description: "Enforce logout before login")
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end

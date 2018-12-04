module Fastlane
  module Helper
    class CodePushLoginHelper
      def self.log_in(token)
        Action.sh("appcenter login --token #{token}", print_command: false)
      rescue
        UI.user_error!("something went wrong during login with access key #{token}")
      end
      def self.log_out
        Action.sh("appcenter logout")
      rescue
      end

      def self.is_logged_in
        value = true
        begin
          Action.sh("appcenter whoami", false)
        rescue
          value = false
        end
        value
      end
    end
  end
end

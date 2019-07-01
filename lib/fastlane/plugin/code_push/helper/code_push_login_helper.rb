module Fastlane
  module Helper
    class CodePushLoginHelper
      def self.log_in(access_key, server_url="")
        Action.sh("code-push login --accessKey #{access_key} #{server_url}", print_command: false)
      rescue
        UI.user_error!("something went wrong during login with access key #{access_key} and server url #{server_url}")
      end
      def self.log_out
        Action.sh("code-push logout")
      rescue
      end

      def self.is_logged_in
        value = true
        begin
          Action.sh("code-push whoami", false)
        rescue
          value = false
        end
        value
      end
    end
  end
end

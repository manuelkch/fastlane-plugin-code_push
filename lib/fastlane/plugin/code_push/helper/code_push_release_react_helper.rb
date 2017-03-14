module Fastlane
  module Helper
    class CodePushReleaseReactHelper

      def self.log_in(accessKey)
        begin
          Action.sh("code-push login --accessKey #{accessKey}")
        rescue => error
          UI.user_error!(error)
        end
      end

      def self.log_out
        begin
        Action.sh("code-push logout")
        rescue => error
        end
      end

      def self.is_logged_in
        value = true
        begin
        Action.sh("code-push whoami")
        rescue => error
          value = false
        end
        value
      end

    end
  end
end

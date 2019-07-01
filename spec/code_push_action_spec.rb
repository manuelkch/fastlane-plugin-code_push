describe FastlaneCore::Helper::CodePushLoginHelper do
  describe '#Login' do
    it 'code_push cli should be installed and runnable' do
    end
  end
  describe '#Login' do
    it 'login with invalid key should fail' do
      demo_key = "wefnklwefnkfnwecnwerkflw"
      demo_server = "foo.bar.shibby"
      expect(Fastlane::UI).to receive(:user_error!).with("something went wrong during login with access key #{demo_key} and server url #{demo_server}")
      FastlaneCore::Helper::CodePushLoginHelper.log_in(demo_key.to_s, demo_server.to_s)
    end
  end
end

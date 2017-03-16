describe FastlaneCore::Helper::CodePushLoginHelper do
  describe '#Login' do
    it 'codepush cli should be installed and runnable' do
    end
  end
  describe '#Login' do
    it 'login with invalid key should fail' do
      demo_key = "wefnklwefnkfnwecnwerkflw"
      expect(Fastlane::UI).to receive(:user_error!).with("something went wrong during login with access key #{demo_key}")
      FastlaneCore::Helper::CodePushLoginHelper.log_in(demo_key.to_s)
    end
  end
end

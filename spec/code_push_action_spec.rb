describe Fastlane::Actions::CodePushAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The code_push plugin is working!")

      Fastlane::Actions::CodePushAction.run(nil)
    end
  end
end

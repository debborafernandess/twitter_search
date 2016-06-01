RSpec.describe Mention do
  describe '#all' do
    it 'mentions' do
      mentions = Mention.new.all

      expect(mentions).not_to be_nil
    end

    it 'dont contains in reply to user id 42' do
      mentions = Mention.new
      mentions = mentions.all

      expect(mentions).not_to include(42)
    end
  end
end

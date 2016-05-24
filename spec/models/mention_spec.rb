RSpec.describe Mention do
  describe '#all' do
    it 'mentions' do
      username = 'mary@gmail.com'
      mentions = Mention.new(username)

      expect(mentions.all).not_to be_empty
    end
  end
end

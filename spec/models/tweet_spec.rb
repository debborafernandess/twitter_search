RSpec.describe Tweet do
  describe 'Mentions' do
    it '#search' do
      expect(Tweet.search).not_to be_empty
    end

    xit '#search_in_api' do
      mentions = Mention.new
      mentions = mentions.all

      expect{Tweet.search_in_api}.to change{Tweet.count}.by(mentions.count)
    end
  end
end

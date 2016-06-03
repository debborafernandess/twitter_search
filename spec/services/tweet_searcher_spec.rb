RSpec.describe TweetSearcher do
  describe 'Search and save results' do
    it '#search_in_api' do
      expect { TweetSearcher.new.search_in_api }.to change { Tweet.count }
    end
  end
end

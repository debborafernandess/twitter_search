RSpec.describe Tweet do
  describe 'Mentions' do
    it '#search' do
      expect(Tweet.search).not_to be_empty
    end

    it '#order' do
      tweets = create(:tweet)
      most_followers = create(:tweet, user_followers_count: 6)
      most_retweets  = create(:tweet, retweet_count: 6)
      most_favorites = create(:tweet, favourites_count: 6)

      expect(Tweet.search).to eq([most_followers, most_retweets, most_favorites, tweets])
    end

    it '#search_in_api' do
      mentions = Mention.new
      mentions.all

      expect { Tweet.search_in_api }.to change { Tweet.count }
    end
  end
end

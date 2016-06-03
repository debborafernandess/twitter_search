RSpec.describe Tweet do
  describe 'Mentions' do
    it '#order' do
      tweets = create(:tweet)
      most_followers = create(:tweet, user_followers_count: 6)
      most_retweets  = create(:tweet, retweet_count: 6)
      most_favorites = create(:tweet, favourites_count: 6)

      expect(Tweet.all).to eq([most_followers,
                               most_retweets,
                               most_favorites,
                               tweets])
    end
  end
end

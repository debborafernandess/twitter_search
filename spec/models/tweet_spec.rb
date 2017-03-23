RSpec.describe Tweet do
  context '.default_scope' do
    it 'orders by most followeds, most retweeted and favorited respectively' do
      tweets = create(:tweet)
      most_followers = create(:tweet, user_followers_count: 6)
      most_retweets  = create(:tweet, retweet_count: 6)
      most_favorites = create(:tweet, favourites_count: 6)

      expect(described_class.all).to eq([most_followers,
                               most_retweets,
                               most_favorites,
                               tweets])
    end
  end

  context '.top_mentioners' do
    it 'returns top mentioners on top' do
      uol_t1 = create(:tweet, user_screen_name: 'uol')
      uol_t2 = create(:tweet, user_screen_name: 'uol')
      amazon_tt = create(:tweet, user_screen_name: 'amazon')
      digital_t1= create(:tweet, user_screen_name: 'digital ocean')
      digital_t2 = create(:tweet, user_screen_name: 'digital ocean')
      digital_t3 = create(:tweet, user_screen_name: 'digital ocean')

      expect(described_class.top_mentioners)
        .to eq([digital_t1, digital_t2, digital_t3, uol_t1, uol_t2, amazon_tt])
    end
  end
end

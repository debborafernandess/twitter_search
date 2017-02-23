RSpec.describe TweetBuilder do
  context '.search_in_api' do
    it 'searches tweets and persists mentions' do
      allow(MentionSearcher).to receive(:without_replies)
        .and_return([{
         'favourites_count' => 1,
         'in_reply_to_user_id' => 10,
         'retweet_count' => 2,
         'text' => 'Hello @locaweb',
         'created_at' => 'Mon Apr 26 06:01:55 +0000 2010',
         'user' => {
           'followers_count' => 2,
           'screen_name' => 'jane_doe'
         }

      }])

      expect { described_class.save }.to change { Tweet.count }
    end
  end
end

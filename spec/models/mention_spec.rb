RSpec.describe Mention do
  describe '#all' do
    it 'mentions' do
      mentions = Mention.new.all

      expect(mentions).not_to be_nil
    end

    it 'dont contains in reply to user id 42' do
      mentions = Mention.new
      mentions.all

      tweets = mentions.tweets.map { |tweet| tweet['in_reply_to_user_id'] }

      expect(tweets).not_to include(Mention::USER_ID)
    end

    it 'contains mention to @locaweb' do
      mentions = Mention.new
      mentions.all

      tweets = mentions.tweets.map { |tweet| tweet['text'] }

      tweets.each do |tweet|
        expect(tweet).to match(/@locaweb/)
      end
    end
  end
end

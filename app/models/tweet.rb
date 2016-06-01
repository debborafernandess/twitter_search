class Tweet < ActiveRecord::Base

  def self.search
    search_in_api unless exists?
    all
  end

  def self.search_in_api
    mentions = Mention.new
    mentions = mentions.all

    save_api_response(mentions)
  end

  def self.save_api_response(tweets)
    tweets.each do |tweet|
      Tweet.create!(
        favourites_count:     tweet['favourites_count'] || 0,
        in_reply_to_user_id:  tweet['in_reply_to_user_id'],
        retweet_count:        tweet['retweet_count'],
        text:                 tweet['text'],
        tweeted_at:           tweet['created_at'],
        user_followers_count: tweet['user']['followers_count'],
        user_screen_name:     tweet['user']['screen_name']
      )
    end
  end

end

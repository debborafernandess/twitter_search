class Tweet < ActiveRecord::Base

  def self.search(query = {})
    TweetSearcher.new.search_in_api if query[:more] || !exists?

    order('user_followers_count desc,
          retweet_count desc,
          favourites_count desc')
  end
end

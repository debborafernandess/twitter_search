class Tweet < ActiveRecord::Base
  default_scope do
    order('user_followers_count desc,
          retweet_count desc,
          favourites_count desc')
  end

  def self.top_mentioners
  all
      .group_by(&:user_screen_name)
      .sort_by { |_user, tweets| [tweets.count, tweets.map(&:user_followers_count)] }
      .reverse
      .collect { |users_tweets| users_tweets.last }
      .flatten
  end
end

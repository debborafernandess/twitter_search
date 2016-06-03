class Tweet < ActiveRecord::Base
  default_scope do
    order('user_followers_count desc,
          retweet_count desc,
          favourites_count desc')
  end

  def self.top_haters
    all
      .group_by(&:user_screen_name)
      .sort_by { |_key, val| [val.count, val.map(&:user_followers_count)] }
      .reverse
  end
end

class Tweet
  include ActiveModel::Model
  attr_accessor :contributors, :coordinates, :created_at, :entities, :favorited,
                :geo, :id, :id_str, :in_reply_to_screen_name, :place,
                :in_reply_to_status_id, :in_reply_to_status_id_str,
                :in_reply_to_user_id, :in_reply_to_user_id_str, :metadata,
                :retweet_count, :retweeted, :source, :text, :truncated, :user

  def initialize(attributes={})
    super
  end
end

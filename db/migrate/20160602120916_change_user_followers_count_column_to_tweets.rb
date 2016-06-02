class ChangeUserFollowersCountColumnToTweets < ActiveRecord::Migration
  def change
    change_column :tweets, :user_followers_count, 'integer USING CAST(user_followers_count AS integer)'
  end
end

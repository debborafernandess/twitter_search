class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :in_reply_to_user_id
      t.integer :retweet_count
      t.integer :favourites_count
      t.string :user_screen_name
      t.string :user_followers_count
      t.text :text
      t.datetime :tweeted_at

      t.timestamps null: false
    end
  end
end

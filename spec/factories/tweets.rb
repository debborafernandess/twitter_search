FactoryGirl.define do
  factory :tweet do
    favourites_count 1
    in_reply_to_user_id 1
    retweet_count 1
    text "MyText"
    tweeted_at "2016-05-31 17:54:36"
    user "MyString"
    user_followers_count 1
    user_screen_name 'sofj'
  end
end

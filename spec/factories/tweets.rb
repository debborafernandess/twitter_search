FactoryGirl.define do
  factory :tweet do
    favourites_count 1
    in_reply_to_user_id 1
    retweet_count 1
    text Faker::Lorem.sentence
    tweeted_at Faker::Time.between(2.days.ago, Time.zone.today)
    user_followers_count 1
    user_screen_name Faker::Internet.user_name
  end
end

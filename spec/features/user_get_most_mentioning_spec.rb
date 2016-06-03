feature 'Get most mentionners Tweets' do
  scenario 'and group his tweets' do
    top_hater     = create(:tweet,
                           user_screen_name: 'top_hater',
                           user_followers_count: 2)
    hater_tweets  = create_list(:tweet, 2, user_screen_name: 'loca_hater')
    normal_tweet  = create(:tweet)

    all_tweets    = Tweet.top_haters

    visit root_path

    click_on 'Top Mencionadores'

    expect(page).to have_css('h1', text: 'Top Mencionadores')

    within('#tweets') do
      expect(page).to have_css('th', text: 'Usuário')
      expect(page).to have_css('th', text: 'Seguidores')
      expect(page).to have_css('th', text: 'Tweet')
      expect(page).to have_css('th', text: 'RTs')
      expect(page).to have_css('th', text: 'Likes')
      expect(page).to have_css('th', text: 'Data')

      all_tweets.each do |_name, tweets|
        tweets.each do |tweet|
          expect(page).to have_link(tweet.user_screen_name)
          expect(page).to have_css('td', text: tweet.user_followers_count)
          expect(page).to have_css('td', text: tweet.text)
          expect(page).to have_css('td', text: tweet.retweet_count)
          expect(page).to have_css('td', text: tweet.favourites_count)
          expect(page).to have_link(tweet.tweeted_at.strftime('%d/%m/%Y %m:%H'))
        end
      end
    end
  end
end

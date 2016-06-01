feature 'User gets mentioned Tweets' do
  scenario 'first time' do
    tweets = create_list(:tweet, 5)

    visit root_path

    click_on 'Menções'

    expect(page).to have_css('h1', text: 'Novas menções')

    within('#tweets') do
      expect(page).to have_css('th', text: 'Usuário')
      expect(page).to have_css('th', text: 'Seguidores')
      expect(page).to have_css('th', text: 'Tweet')
      expect(page).to have_css('th', text: 'RTs')
      expect(page).to have_css('th', text: 'Likes')
      expect(page).to have_css('th', text: 'Data')

      tweets.each do |tweet|
        expect(page).to have_link(tweet.user_screen_name, href: "//twitter.com/#{tweet.user_screen_name}")
        expect(page).to have_css('td', text: tweet.user_followers_count)
        expect(page).to have_css('td', text: tweet.text)
        expect(page).to have_css('td', text: tweet.retweet_count)
        expect(page).to have_css('td', text: tweet.favourites_count)
        expect(page).to have_link(tweet.tweeted_at.strftime('%d/%m/%Y %m:%H'), href: "//twitter.com/#{tweet.user_screen_name}")
      end
    end
  end
end

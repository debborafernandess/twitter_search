feature 'Get most mentioners' do
  scenario 'and group its tweets' do
    tweet = create(:tweet)
    tweet_top = create_list(:tweet, 2, user_screen_name: 'hater')

    visit root_path
    click_on 'Top Mencionadores'

    expect(page).to have_css('h1', text: 'Top Mencionadores')

    within('#tweets') do
      expect(page).to have_link(tweet_top[0].user_screen_name)
      expect(page).to have_link(tweet_top[1].user_screen_name)
      expect(page).to have_link(tweet.user_screen_name)
    end
  end
end

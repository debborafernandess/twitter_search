feature 'User visits home' do
  context 'when has mentions' do
    scenario 'sees tweet information' do
      tweet = create(:tweet)

      visit root_path

      expect(page).to have_css('a.navbar-brand', text: 'Twitter SAC')
      expect(page).to have_link('Menções', href: search_tweets_path)
      expect(page)
        .to have_link('Top Mencionadores', href: mentionners_tweets_path)

      within('#tweets') do
        expect(page).to have_content(tweet.user_screen_name)
        expect(page).to have_content(tweet.user_followers_count)
        expect(page).to have_content(tweet.text)
        expect(page).to have_content(tweet.retweet_count)
        expect(page).to have_content(tweet.favourites_count)
      end
    end
  end

  context 'when does not have mentions' do
    scenario 'sees blank information' do
      visit root_path

      expect(page).to have_css('a.navbar-brand', text: 'Twitter SAC')
      expect(page).to have_link('Menções', href: search_tweets_path)
      expect(page)
        .to have_link('Top Mencionadores', href: mentionners_tweets_path)

      within('#tweets') do
        expect(page).to have_content('Sem menções para analisar')
      end
    end
  end
end

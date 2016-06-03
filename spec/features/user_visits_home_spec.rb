feature 'User visits home' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('a.navbar-brand', text: 'Twitter SAC')
    expect(page).to have_link('Menções', href: search_tweets_path)
    expect(page)
      .to have_link('Top Mencionadores', href: mentionners_tweets_path)
  end
end

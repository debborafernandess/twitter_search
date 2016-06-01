feature 'User gets mentioned Tweets' do
  scenario 'first time' do
    visit root_path

    click_on 'Menções'
byebug

    expect(page).to have_css('h1', text: 'Novas menções')

    within('#tweets') do
      expect(page).to have_css('th', text: 'Usuário')
      expect(page).to have_css('th', text: 'Seguidores')
      expect(page).to have_css('th', text: 'Tweet')
      expect(page).to have_css('th', text: 'RTs')
      expect(page).to have_css('th', text: 'Likes')
      expect(page).to have_css('th', text: 'Data')

    end
  end
end

feature 'Get Tweets' do
  scenario 'inform email' do
    visit root_path

    within('#user') do
      fill_in 'email', with: Faker::Internet.email
      click_on 'Obter Tweets'
    end

    expect(page).to have_css('h1', text: '@locaweb menções')

    within('#tweets') do
      expect(page).to have_content('Usuário')
      expect(page).to have_content('Seguidores')
      expect(page).to have_content('Tweet')
    end
  end

  scenario 'without email' do
    visit root_path


    within('#user') do
      fill_in 'email', with: ''
      click_on 'Obter Tweets'
    end

    within('.error') do
      expect(page).to have_content('Informe seu e-mail para começar')
    end
  end
end

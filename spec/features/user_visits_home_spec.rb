feature 'User visits home' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('a.navbar-brand', text: 'Twitter SAC')
    expect(page).to have_content('Informe seu e-mail para começar')
  end
end

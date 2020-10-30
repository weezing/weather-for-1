require 'rails_helper'

feature 'Visitor signs in' do
  scenario 'vith valid credentials and logs out' do
    user = create(:user, password: 'password')
    visit root_path

    click_on('Login')

    fill_in('Email', with: user.email)
    fill_in('Password', with: 'password')

    click_on('Login')

    expect(page).to have_text('Logged in successfully')

    click_on('Logout')
    expect(page).to have_text('Goodbye!')
  end

  scenario 'vith invalid credentials' do
    visit root_path

    click_on('Login')

    fill_in('Email', with: 'nobody@example.com')
    fill_in('Password', with: 'password')

    click_on('Login')

    expect(page).to have_text('Wrong password, try again!')
  end
end

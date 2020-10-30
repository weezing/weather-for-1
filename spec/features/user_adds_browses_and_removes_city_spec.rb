require 'rails_helper'

feature 'User adds city' do
  scenario 'vith valid name' do
    user = create(:user, password: 'password')
    visit root_path

    click_on('Login')

    fill_in('Email', with: user.email)
    fill_in('Password', with: 'password')

    click_on('Login')

    expect(page).to have_text('Logged in successfully')

    click_on('Browse your cities')

    expect(page).to have_text('Your cities (0)')

    click_on('Add city')

    fill_in('Name', with: 'London')
    click_on('Submit')

    expect(page).to have_text('City added successfully')
    expect(page).to have_text('Your cities (1)')

    click_on('Show forecast')

    expect(page).to have_text('Forecast for London:')

    click_on('Back')

    click_link 'Remove'

    expect(page).to have_text('City was successfully removed')
    expect(page).to have_text('Your cities (0)')
  end
end

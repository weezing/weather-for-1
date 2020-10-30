require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'vith valid credentials' do
    visit root_path

    click_on('Sign up')

    fill_in('Email', with: 'user@example.com')
    fill_in('user_form_password', with: 'password')
    fill_in('user_form_password_confirmation', with: 'password')

    click_on('Submit')

    expect(page).to have_text('Registration successful')
  end

  scenario 'vith invalid credentials' do
    visit root_path

    click_on('Sign up')

    fill_in('Email', with: 'user@example.com')
    fill_in('user_form_password', with: 'password')
    fill_in('user_form_password_confirmation', with: 'password1')

    click_on('Submit')

    expect(page).to have_text("Password confirmation doesn't match Password")
  end
end

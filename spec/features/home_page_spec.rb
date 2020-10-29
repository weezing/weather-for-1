require 'rails_helper'

feature 'Home page' do
  scenario 'sends greetings' do
    visit root_path

    expect(page).to have_text('Hello world!')
  end
end

# frozen_string_literal: true

feature 'Configure Game screen' do
  scenario 'displayed when entering website' do
    visit '/'
    expect(page).to have_content("Welcome the World's Simplest Poker Game")
  end
end

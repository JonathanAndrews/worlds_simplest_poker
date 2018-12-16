# frozen_string_literal: true

feature 'Configure Game screen' do
  scenario 'displayed when entering website' do
    visit '/'
    expect(page).to have_content("Welcome the World's Simplest Poker Game")
  end

  scenario 'should have a number of players input' do
    visit '/'
    expect(page).to have_content('How many players?')
  end

  scenario 'should have a hand size input' do
    visit '/'
    expect(page).to have_content('How many cards in each hand?')
  end

  scenario 'can input 2 players with 2 cards' do
    visit '/'
    fill_in :no_of_players, with: 2
    fill_in :hand_size, with: 2
  end

  scenario 'redirected to config page if not enough cards' do
    visit '/'
    fill_in :no_of_players, with: 52
    fill_in :hand_size, with: 2
    click_button("Play")
    expect(page).to have_content("Welcome the World's Simplest Poker Game")
    expect(page).to have_content('How many cards in each hand?')
    expect(page).to have_content('How many players?')
  end

  scenario 'redirected to config page shows flash message' do
    visit '/'
    fill_in :no_of_players, with: 52
    fill_in :hand_size, with: 2
    click_button("Play")
    expect(page).to have_content("Not enough dards in the deck...")
  end
end

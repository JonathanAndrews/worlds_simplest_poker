# frozen_string_literal: true

feature 'Winner screen' do
  scenario "has 'And the Winner is' text" do
    visit '/'
    fill_in :no_of_players, with: 2
    fill_in :hand_size, with: 2
    click_button('Play')
    expect(page).to have_content('And the winner is')
  end

  scenario "has 'Play Another Hand' button" do
    visit '/'
    fill_in :no_of_players, with: 2
    fill_in :hand_size, with: 2
    click_button('Play')
    click_button('Play another Hand?')
    expect(page).to have_content('And the winner is')
  end

  scenario "has 'Brand New Game?' button" do
    visit '/'
    fill_in :no_of_players, with: 2
    fill_in :hand_size, with: 2
    click_button('Play')
    click_button('Brand New Game?')
    expect(page).to have_content("Welcome the World's Simplest Poker Game")
  end

  scenario 'shows the hands' do
    visit '/'
    fill_in :no_of_players, with: 2
    fill_in :hand_size, with: 2
    click_button('Play')
    expect(page).to have_content('player_1')
    expect(page).to have_content('player_2')
  end
end

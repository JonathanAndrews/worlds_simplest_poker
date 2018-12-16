feature "Configure Game screen" do
  scenario "displayed when entering website" do
    visit "/"
    expect(page).to have_content("Hello")
  end
end
require "rails_helper"

feature "Locating Best Buy Stores" do
  it "shows stores within a 25 mile radius of a specified location" do
    visit "/"
    fill_in "Postal Code", with: "80202"
    click_on "search"
    expect(current_path).to eq("/search")
    expect(page).to have_content("17 Total Stores")
    within ".search-results" do
      expect(page).to have_selector(".store", count: 10)
      within ".store-1" do
        expect(page).to have_selector(".long-name")
        expect(page).to have_selector(".city")
        expect(page).to have_selector(".distance")
        expect(page).to have_selector(".phone-number")
        expect(page).to have_selector(".store-type")
      end
    end
  end
end

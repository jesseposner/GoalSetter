require 'spec_helper'
require 'rails_helper'

feature "the create goal process" do

  scenario "has a new goal page" do
    create_new_user
    visit new_goal_url
    expect(page).to have_content "New Goal"
  end

  feature "creating a goal" do
    create_new_user
    before(:each) do
      visit new_goal_url
      fill_in 'Title', with: "Pass Assessment"
      fill_in 'Password', with: "Win at life all of the time."
      click_on "Create Goal"
    end
  end

  it "shows title on show page after create" do
    visit goal_url(Goal.last)
    expect(page).to have_content "Pass Assessment"
  end
end

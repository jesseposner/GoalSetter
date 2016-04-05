require 'spec_helper'
require 'rails_helper'

feature "the create goal process" do
  before(:each) do
    create_new_user
    visit new_goal_url
    fill_in 'Title', with: "Pass Assessment"
    fill_in 'description', with: "Win at life all of the time."
    choose('private')
    click_on "Create Goal"
  end

  scenario "has a new goal page" do
    visit new_goal_url
    expect(page).to have_content "Create Goal"
  end

  scenario "shows title on show page after create" do
    visit goal_url(Goal.last)
    expect(page).to have_content "Pass Assessment"
  end
end

require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Username', :with => "testing_username"
      fill_in 'Password', :with => "biscuits"
      click_on "Sign Up"
    end

    it "shows username on the homepage after signup" do
      visit users_url
      expect(page).to have_content 'testing_username'
    end
  end
end

feature "logging in" do
  create_new_user
  before(:each) do
    visit new_session_url
    fill_in 'Username', :with => "testing_username"
    fill_in 'Password', :with => "biscuits"
    click_on "Sign In"
  end

  it "shows username on the homepage after login" do
    visit users_url
    expect(page).to have_content 'testing_username'
  end
end

feature "logging out" do
  # before(:each) do
  #   create_new_user
  #   click_on "Log Out"
  # end

  it "begins with logged out state" do
    visit users_url
    expect(page).to have_content 'Sign Up'
    expect(page).to have_content 'Sign In'
  end

  it "doesn't show username on the homepage after logout" do
    visit users_url
    expect(page).to_not have_content 'testing_username'
  end
end

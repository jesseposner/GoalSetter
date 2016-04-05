require 'rails_helper'

RSpec.describe User, type: :model do
  describe "password encryption" do

    it "does not save passwords to the database" do
      User.create!(username: "bob", password: "hunter12")
      user = User.find_by_username("bob")
      expect(user.password).to_not be("hunter12")
    end

    it "encrypts the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: "jack_bruce", password: "abcdef")
    end

    it "returns nil if can't find user" do
      user = User.find_by_credentials('none', 'what')
      expect(user).to be(nil)
    end

    it "ensures session token" do
      user = User.create!(username: "bob", password: "password")
      expect(user.session_token).to_not be_nil
    end

    it "validates password is minimum 6 characters" do
      user = User.new(username: "bob", password: "go")
      expect(user).to_not be_valid
    end

    it { should validate_presence_of :username}

    it { should validate_presence_of :password_digest}

    it { should validate_presence_of :session_token}

    it "should require a username" do
      user = User.create(username: "", password: "password")
      user.valid?
      expect(user.errors).to have_key(:username)
    end

    it "should require a password" do
      user = User.create(username: "bob", password: "")
      user.valid?
      expect(user.errors).to have_key(:password)
    end
  end
end

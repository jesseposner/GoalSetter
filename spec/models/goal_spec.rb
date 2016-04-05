require 'rails_helper'

RSpec.describe Goal, type: :model do

  describe "goal instantiation" do
    before(:each) do
      goal = Goal.create!(title: "Pass Assessment",
      description: "Win at life all of the time.")
    end

    it "sets private to true as default" do
      expect(goal.private).to_be true
    end

    it "sets private to false if specified" do
      goal_public = Goal.create!(title: "Pass Assessment",
                                 description: "Win at life all of the time.",
                                 private: false)
      expect(goal_public.private).to_be false
    end

    it "sets user_id to current user's id" do
      expect(goal.user_id).to_be current_user.id
    end

    it { should validate_presence_of :title }

    it { should validate_presence_of :description }

    it { should validate_presence_of :user_id }
  end
end

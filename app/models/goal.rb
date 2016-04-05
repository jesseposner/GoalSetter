class Goal < ActiveRecord::Base
  validates :title, :description, :user_id, presence: true
  validates :private, inclusion: { in: [true, false] }

  belongs_to :user
end

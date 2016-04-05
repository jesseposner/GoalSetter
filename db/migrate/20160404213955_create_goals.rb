class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, presence: true
      t.string :description, presence: true
      t.boolean :private, presence: true, default: false
      t.integer :user_id, presence: true

      t.timestamps null: false
    end
  end
end

class CreateDislikes < ActiveRecord::Migration
  def change
    create_table :dislikes do |t|
      t.integer :user_id, null: false
      t.integer :disinterest_id, null: false
    end
  end
end

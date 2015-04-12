class AddIndexToAttributes < ActiveRecord::Migration
  def change
    add_index :users, :gender
    add_index :users, :age
  end
end

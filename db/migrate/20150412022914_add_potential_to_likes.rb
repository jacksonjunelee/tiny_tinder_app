class AddPotentialToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :potential, :integer
  end
end

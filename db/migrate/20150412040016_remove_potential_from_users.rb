class RemovePotentialFromUsers < ActiveRecord::Migration
  def change
    remove_column :likes, :potential
  end
end

class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_column :users, :seeking_index, :string
    add_column :users, :seeked_index, :string
  end
end

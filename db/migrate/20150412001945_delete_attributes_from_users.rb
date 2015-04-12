class DeleteAttributesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :seeking_index
    remove_column :users, :seeked_index
  end
end

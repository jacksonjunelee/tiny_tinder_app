class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :gender, null: false
      t.string :interested_gender, null: false
      t.integer :age, null: false
      t.integer :preferred_age, null: false
      t.timestamps null: false
    end
  end
end

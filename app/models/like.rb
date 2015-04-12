class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :interest, :class_name => "User"
end

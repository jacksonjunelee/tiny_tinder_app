class Dislike < ActiveRecord::Base
  belongs_to :user
  belongs_to :disinterest, :class_name => "User"
end

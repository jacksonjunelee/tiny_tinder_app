class User < ActiveRecord::Base
  # has_many :user_interests, :foreign_key => "user_id",
  #     :class_name => "Interest"
  #
  #  has_many :interests, :through => :user_interests
end

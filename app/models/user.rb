class User < ActiveRecord::Base
  has_many :likes
  has_many :dislikes
  has_many :interests, through: :likes
  has_many :disinterests, through: :dislikes

  validates :username, presence: true

  def find_interest
    interested_gender = self.interested_gender
    preferred_age = self.preferred_age
    preferred_age_range = preferred_age..(preferred_age+8)
    # Find matches based on the user's input
    interests = User.where({interested_gender: interested_gender,
                          preferred_age: preferred_age_range})
                   .where.not(id: self.id)
    interested_users = []
    interests.map do |interest|
      # check if the user has "Yes" or "No" the person yet
      if !(self.interests.include?(interest) || self.disinterests.include?(interest))
        # maximize matches
        if interest.interests.include?(self)
          if rand > 0.4
            interested_users.unshift(interest)
          else
            interested_users.push(interest)
          end
        else
          interested_users.push(interest)
        end
      end
    end
    # return one to the user
    interested_users[0] if interested_users != nil
  end
end

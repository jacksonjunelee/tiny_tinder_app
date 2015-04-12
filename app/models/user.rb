class User < ActiveRecord::Base
  has_many :likes
  has_many :dislikes
  has_many :interests, through: :likes
  has_many :disinterests, through: :dislikes

  def find_interest
    interested_gender = self.interested_gender
    preferred_age = self.preferred_age
    preferred_age_range = preferred_age..(preferred_age+8)
    interest = User.where({interested_gender: interested_gender,
                          preferred_age: preferred_age_range})
                   .where.not(id: self.id)
                   .find_each(batch_size: 1) do |interest|
                     if !self.interests.include?(interest) && !self.disinterests.include?(interest)
                       interest
                     end
                   end
                # .limit(1) if interest != nil
    interest[0] if interest != nil
  end
end

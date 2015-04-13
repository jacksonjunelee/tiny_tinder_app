require 'rails_helper'

describe User do

  let(:user) { User.new(username: "Jackson",
                       gender: "Male",
                       interested_gender: "Female",
                       age: 23,
                       preferred_age: 23) }


  describe 'model validations' do
    it "is valid with a username, gender, interested_gender, age, preferred_age" do
      expect(user).to be_valid
    end

    describe 'username' do
      let(:user) { User.new(username: nil,
                           gender: "Male",
                           interested_gender: "Female",
                           age: 23,
                           preferred_age: 23) }

      it 'requires a username' do
        expect(user).not_to be_valid
      end
    end
  end

  describe 'associations' do
    it 'has many interests' do
      expect(User.reflect_on_association(:interests).macro).to eq :has_many
    end

    it 'has many disinterests' do
      expect(User.reflect_on_association(:disinterests).macro).to eq :has_many
    end
  end

  it "has interests" do
    jennifer = User.create(username: "Jennifer", gender: "Female", interested_gender: "Male", age: 23, preferred_age: 23)
    user.interests << jennifer

    expect(user.interests).to eq([jennifer])
  end

end

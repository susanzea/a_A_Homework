require 'rails_helper'

describe User do
  subject(:user) do
    FactoryBot.build(:user,
      email: "susan@susan.com",
      password: "password")
  end

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }


  describe "#is_password?" do
    it "should check if password is correct" do 
      expect(user.password_digest.is_password?("password")).to be true
    end

    it "should identify is password is incorrect" do
      expect(user.password_digest.is_password?("pw")).to be false
    end

  end


  describe "#reset_session_token!" do
    it "should assign session token to new value" do 
      original_token = user.session_token
      new_token = user.reset_session_token!
      expect(new_token).to_not eq(original_token)
    end
  end

  describe "::find_by_credentials" do
    it "return user with given credentials" do 
      expect(User.find_by_credentials("susan@susan.com", "password")).to eq(user)
    end

    it "return nil if user does not exit" do 
      expect(User.find_by_credentials("andrés@andrés.com", "passwordss")).to eq(nil)
    end
  end



end

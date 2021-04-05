require 'rails_helper'

RSpec.describe User, type: :model do


    it "should save a user if given valid attributes" do 
      @user = User.new(
        firstname: "Matthew",
        lastname: "Cook",
        email: "matthew@gmail.com", 
        password: "password",
        password_confirmation: "password",
      )
      @user.save
      expect(@user).to be_valid
    end





  
end

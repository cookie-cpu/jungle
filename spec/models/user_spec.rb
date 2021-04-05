require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do


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


    it "should be invalid if the email already exists" do 
      @user = User.new(
        firstname: "Matthew",
        lastname: "Cook",
        email: "test@test.com", 
        password: "password",
        password_confirmation: "password",
      )
      @user.save

      @user2 = User.new(
        firstname: "Matthew",
        lastname: "Cook",
        email: "TEST@TEST.com", 
        password: "password",
        password_confirmation: "password",
      )
      @user2.save


      expect(@user2).not_to be_valid
    end


    it "should be invalid if password is less than 5 characters" do 
      @user = User.new(
        firstname: "Matthew",
        lastname: "Cook",
        email: "MATTHEW@gmail.com", 
        password: "123",
        password_confirmation: "123",
      )

      @user.save

      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    
    it 'should validate with valid credentials' do
      @user = User.new(
        firstname: "Matthew",
        lastname: "Cook",
        email: "matthew@gmail.com", 
        password: "password",
        password_confirmation: "password",
      )
      @user.save

      logInInfo = User.authenticate_with_credentials(@user.email, @user.password)

      expect(logInInfo.id).to eq(@user.id)
    end
    


  end
end

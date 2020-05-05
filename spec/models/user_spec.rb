require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  # let(:user) {User.new(:password => 'password', )}

  it 'pass if password and password_confirmation, email, first name, and last name is present' do
    @user = User.create(:first_name => 'John', :last_name => 'Doe', :email => 'johndoe@hotmail.com', :password => 'password', :password_confirmation => 'password')
    expect(@user).to be_valid
  end


  it 'requires name to be present' do
    @user = User.create(:first_name => 'John', :last_name => 'Doe', :email => 'johndoe@hotmail.com', :password => 'password', :password_confirmation => 'password')
    @user.password = nil
    # expect(@product).not_to be_valid
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'should create a new user if password and confirmation match' do
    @user = User.create(:first_name => 'John', :last_name => 'Doe', :email => 'johndoe@hotmail.com', :password => 'password', :password_confirmation => 'password')
    expect(@user).to be_valid
  end

    it 'Emails must be unique' do
      @user1 = User.create({:first_name => 'John', :last_name => 'Doe', :email => 'test@test.COM', :password => 'password', :password_confirmation => 'password'})
      @user2 = User.create({:first_name => 'John', :last_name => 'Doe', :email => 'TEST@TEST.com', :password => 'password', :password_confirmation => 'password'})
      expect(@user1).to be_valid
      expect(@user2).not_to be_valid  
    end

    xit 'Password minimum length' do
      @user = User.create(:first_name => 'John', :last_name => 'Doe', :email => 'johndoe@hotmail.com', :password => '123', :password_confirmation => 'password')
      expect(@user).not_to be_valid  
    end
  end

  describe '.authenticate_with_credentials' do

    it 'authenticates with correct email and password' do
      @user = User.create(:first_name => 'John', :last_name => 'Doe', :email => 'johndoe@hotmail.com', :password => 'password', :password_confirmation => 'password')
      expect(@user).to be_valid

      @correct_user = User.authenticate_with_credentials('johndoe@hotmail.com', 'password')
      expect(@correct_user.email).to eq "johndoe@hotmail.com"

      @incorrect_email = User.authenticate_with_credentials('wrongemail@hotmail.com', 'password')
      expect(@incorrect_email).to be_nil

      @incorrect_password = User.authenticate_with_credentials('johndoe@hotmail.com', 'wrongpassword')
      expect(@incorrect_password).to be_nil

    end
  end
end

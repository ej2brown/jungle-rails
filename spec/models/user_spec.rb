require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  # let(:user) {User.new(:password => 'password', )}

  xit 'pass if password and password_confirmation, email, first name, and last name is present' do
    @user = User.create(:first_name => 'John', :last_name => 'Doe', :email => 'johndoe@hotmail.com', :password => 'password', :password_confirmation => 'password')
    expect(@user).to be_valid
  end


  xit 'requires name to be present' do
    @user = User.create(:first_name => 'John', :last_name => 'Doe', :email => 'johndoe@hotmail.com', :password => 'password', :password_confirmation => 'password')
    @user.password = nil
    # expect(@product).not_to be_valid
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  xit 'should create a new user if password and confirmation match' do
    @user = User.create(:first_name => 'John', :last_name => 'Doe', :email => 'johndoe@hotmail.com', :password => 'password', :password_confirmation => 'password')
    expect(@user).to be_valid
  end

  # it 'password to not match password_confirmation' do
  #   @user = User.new
  #   @user.password = 'password'
  #   @user.password_confirmation = 'drowssap'
  #   expect(@user.password).not_to eq(@user.password_confirmation)
  # end

    xit 'Emails must be unique' do
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
    xit 'validates email as case insensitive' do
      @user = User.create(:first_name => 'John', :last_name => 'Doe', :email => 'johndoe@hotmail.com', :password => 'password', :password_confirmation => 'password')
      expect(@user).to be_valid
      correct_user = User.authenticate_with_credentials("john@doe.com", "password")
      # user2 = User.authenticate_with_credentials(:email, :password)
      # raise user2.inspect
      # expect(@user).to eq(User.authenticate_with_credentials(subject.email, subject.password))
      # expect(user.email).to match("test@test.com")
    end


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

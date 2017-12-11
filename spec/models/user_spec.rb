require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'should have a valid test' do
      @user = User.new(firstname: 'Matt', lastname: 'Emond', email: 'matt@example.com',
                        password: 'matt12323', password_confirmation: 'matt12323')
      expect(@user).to be_valid
    end

    it 'should be invalid without a matching password confirmation' do
      @user = User.new(firstname: 'Matt', lastname: 'Emond', email: 'Matt@example.com',
                        password: 'matt123', password_confirmation: 'matt1')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should have a unique email address' do
      @user = User.new(firstname: 'Matt', lastname: 'Emond', email: 'matt@example.com',
                        password: 'matt123', password_confirmation: 'matt123')
      @user2 = User.new(firstname: 'Matt', lastname: 'Emond', email: 'Matt@example.com',
                        password: 'matt123', password_confirmation: 'matt123')
      @user.save!
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should include a first name' do
      @user = User.new(firstname: nil, lastname: 'Emond', email: 'Matt@example.com',
                        password: 'matt123', password_confirmation: 'matt123')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'should include a last name' do
      @user = User.new(firstname: 'Matt', lastname: nil, email: 'Matt@example.com',
                        password: 'matt123', password_confirmation: 'matt123')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'should include an email address' do
      @user = User.new(firstname: 'Matt', lastname: 'Emond', email: nil,
                        password: 'matt123', password_confirmation: 'matt123')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'should include a password with minimum 6 characters' do
      @user = User.new(firstname: 'Matt', lastname: 'Emond', email: 'Matt@example.com',
                        password: 'matt1', password_confirmation: 'matt1')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

  end

  describe '.authenticate_with_credentials' do

    before :each do
      @user = User.new(firstname: 'Matt', lastname: 'Emond', email: 'Matt@example.com',
                        password: 'matt123', password_confirmation: 'matt123')
      @user.save!
    end

    it 'should return a truthy value' do
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to be_truthy
    end

    it 'should return a truthy value' do
      expect(User.authenticate_with_credentials(' Matt@example.com ', @user.password)).to be_truthy
    end

    it 'should return a truthy value' do
      expect(User.authenticate_with_credentials(' Matt@example.com ', @user.password)).to be_truthy
    end

  end

end

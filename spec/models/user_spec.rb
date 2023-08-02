require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    before(:each) do
      @user = User.new(
        first_name: "Anthony",
        last_name: "Tran",
        email: "anthony@gmail.com", 
        password: "development123",   
        password_confirmation: "development123"
      )
    end

    it 'Should have password and password_confirmation match to be valid' do
      @user.password_confirmation = "wrong"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "Should have a unique email" do
      user_two = User.create(
        first_name: "Anthony",
        last_name: "Tran",
        email: "anthony@gmail.com", 
        password: "development123",   
        password_confirmation: "development123"
      )
      user_three = User.create(
        first_name: "Anthony",
        last_name: "Tran",
        email: "anthony@gmail.com", 
        password: "development123",   
        password_confirmation: "development123"
      )
      expect(user_three).to_not be_valid
    end

    it "Should have unique email to be valid, not matter what" do
      user_three = User.create(
        first_name: "Anthony",
        last_name: "Tran",
        email: "anthony@gmail.com", 
        password: "development123",   
        password_confirmation: "development123"
      )
      user_four = User.create(
        first_name: "Anthony",
        last_name: "Tran",
        email: "ANTHONY@GMAIL.COM", 
        password: "development123",   
        password_confirmation: "development123"
      )
      expect(user_four).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "Should return nil if user can't be authenticated" do
      user_six = User.create(
        first_name: "Anthony",
        last_name: "Tran",
        email: "anthony@gmail.com", 
        password: "development123",   
        password_confirmation: "development123"
      )
      expect(User.authenticate_with_credentials('anthony@gmail.com', "hello")).to be_nil
    end

    it "Should return the user if the user can't be authenticated" do
      user_six = User.create(
        first_name: "Anthony",
        last_name: "Tran",
        email: "anthony@gmail.com", 
        password: "development123",   
        password_confirmation: "development123"
      )
      expect(User.authenticate_with_credentials('anthony@gmail.com', "development123")).to be_truthy.and have_attributes(:email => "anthony@gmail.com")
    end

    it "Should save user email after applying lowercase and removing whitespace" do
      user_seven = User.create(
        first_name: "Anthony",
        last_name: "Tran",
        email: "anthony@gmail.com", 
        password: "development123",   
        password_confirmation: "development123"
      )
      expect(User.authenticate_with_credentials(" ANTHONY@gmail.com", "development123")).to be_truthy.and have_attributes(:email => 'anthony@gmail.com')
    end
    
  end
    
end

# needs password and password confirmation fields
# need example of match and an example of not matching.
# required when creatingt he models so need example.
#  emails must be unique and not case sensitive. TEST@TEST.com should not be allowed if test@test.COM is in the database
# Email, first_name, and last_name should also be required.
# password must have a minimum length when a user account is being created.

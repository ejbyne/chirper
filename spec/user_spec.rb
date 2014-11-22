require 'spec_helper'

  describe User do

    it 'is created with a username, first name, last_name, email and password_digest' do
      expect(User.count).to eq(0)
      add_user
      expect(User.count).to eq(1)
      user = User.first
      expect(user.user_name).to eq("roger_t")
      expect(user.first_name).to eq("Roger")
      expect(user.last_name).to eq("Test")
      expect(user.email).to eq("test@test.com")
      expect(user.password_digest).not_to be nil
    end

    it 'is not created if the email and email confirmation do not match' do
      expect(User.count).to eq(0)
      User.create(  user_name:              "roger_t",
                    first_name:             "Roger",
                    last_name:              "Test",
                    email:                  "test@test.com",
                    email_confirmation:     "test2@test.com",
                    password:               "test",
                    password_confirmation:  "test")
      expect(User.count).to eq(0)
    end

    it 'is not created if the password and password confirmation do not match' do
      expect(User.count).to eq(0)
      User.create(  user_name:              "roger_t",
                    first_name:             "Roger",
                    last_name:              "Test",
                    email:                  "test@test.com",
                    email_confirmation:     "test@test.com",
                    password:               "test",
                    password_confirmation:  "test2")
      expect(User.count).to eq(0)
    end

    it 'is not created if there is already a user with the same username' do
      expect(User.count).to eq(0)
      add_user
      expect(User.count).to eq(1)
      User.create(  user_name:              "roger_t",
                    first_name:             "Roger",
                    last_name:              "Test2",
                    email:                  "test2@test.com",
                    email_confirmation:     "test2@test.com",
                    password:               "test2",
                    password_confirmation:  "test2")
      expect(User.count).to eq(1)
      expect(User.first.last_name).to eq("Test")
    end

    it 'is not created if there is already a user with the same email' do
      expect(User.count).to eq(0)
      add_user
      expect(User.count).to eq(1)
      User.create(  user_name:              "roger_t2",
                    first_name:             "Roger",
                    last_name:              "Test2",
                    email:                  "test@test.com",
                    email_confirmation:     "test@test.com",
                    password:               "test2",
                    password_confirmation:  "test2")
      expect(User.count).to eq(1)
      expect(User.first.last_name).to eq("Test")
    end

  end

  def add_user
    User.create(  user_name:              "roger_t",
                  first_name:             "Roger",
                  last_name:              "Test",
                  email:                  "test@test.com",
                  email_confirmation:     "test@test.com",
                  password:               "test",
                  password_confirmation:  "test")
  end

#     scenario 'when being a new user he visits the site' do
#       expect { sign_up }.to change(User, :count).by(1)
#       expect(User.first.email).to eq("test@test.com")
#     end

#   end


# def sign_up(  user_name =               "roger_t",
#               first_name =              "Roger",
#               last_name =               "Test",
#               email =                   "test@test.com",
#               email_confirmation =      "test@test.com",
#               password =                "test",
#               password_confirmation =   "test")
#   visit '/users/new'
#   fill_in :user_name, :with => user_name
#   fill_in :first_name, :with => first_name
#   fill_in :last_name, :with => last_name
#   fill_in :email, :with => email
#   fill_in :email_confirmation, :with => email_confirmation
#   fill_in :password, :with => password
#   fill_in :password_confirmation, :with => password_confirmation
#   click_button("Sign Up")
# end
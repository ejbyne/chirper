require 'spec_helper'

describer User do

  feature 'user signs up' do

    scenario 'when being a new user he visits the site' do
      expect { sign_up }.to change(User, :count).by(1)
      expect(User.first.email).to eq("test@test.com")
    end
    
  end

end

def sign_up(  user_name =               "roger_t",
              first_name =              "Roger",
              last_name =               "Test",
              email =                   "test@test.com",
              email_confirmation =      "test@test.com",
              password =                "test",
              password_confirmation =   "test")
  visit '/users/new'
  fill_in :user_name, :with => user_name
  fill_in :first_name, :with => first_name
  fill_in :last_name, :with => last_name
  fill_in :email, :with => email
  fill_in :email_confirmation, :with => email_confirmation
  fill_in :password, :with => password
  fill_in :password_confirmation, :with => password_confirmation
  click_button("Sign Up")
end
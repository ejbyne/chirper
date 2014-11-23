Given(/^I have logged in$/) do
  create_user
  visit '/sessions/new'
  fill_in "user_name", :with => "roger_t"
  fill_in "password", :with => "test"
  click_button("Sign In")
end

When(/^I click "(.*?)"$/) do |arg1|
  click_link(arg1)
end

When(/^I then click "(.*?)"$/) do |arg1|
  click_button(arg1)
end

def create_user
  User.create(  user_name:             "roger_t",
                first_name:            "Roger",
                last_name:             "Test",
                email:                 "test@test.com",
                email_confirmation:    "test@test.com",
                password:              "test",
                password_confirmation: "test") 
end
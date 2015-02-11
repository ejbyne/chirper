When(/^I enter my sign\-in details and click "(.*?)"$/) do |arg1|
  create_user
  visit '/sessions/new'
  fill_in "user_name", :with => "roger_t"
  fill_in "password", :with => "test"
  click_button(arg1)
end

When(/^I enter an incorrect username and click "(.*?)"$/) do |arg1|
  create_user
  visit '/sessions/new'
  fill_in "user_name", :with => "roger_t2"
  fill_in "password", :with => "test"
  click_button(arg1)
end

When(/^I enter an incorrect password and click "(.*?)"$/) do |arg1|
  create_user
  visit '/sessions/new'
  fill_in "user_name", :with => "roger_t"
  fill_in "password", :with => "test2"
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

Given(/^I visit the homepage$/) do
  visit '/'
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Given(/^I click the "(.*?)" button on the homepage$/) do |arg1|
  visit('/')
  click_link(arg1)
end

When(/^I enter my sign\-up details and click "(.*?)"$/) do |arg1|
  fill_in "user_name", :with => "roger_t"
  fill_in "first_name", :with => "Roger"
  fill_in "last_name", :with => "Test"
  fill_in "email", :with => "test@test.com"
  fill_in "email_confirmation", :with => "test@test.com"
  fill_in "password", :with => "test"
  fill_in "password_confirmation", :with => "test"
  click_button(arg1)
end

Given(/^a username has already been registered$/) do
  step('I click the "Sign Up" button on the homepage')
  step('I enter my sign-up details and click "Sign Up"')
end

When(/^I try to register with the same username and click "(.*?)"$/) do |arg1|
  visit '/users/new'
  fill_in "user_name", :with => "roger_t"
  fill_in "first_name", :with => "Roger"
  fill_in "last_name", :with => "Test2"
  fill_in "email", :with => "test2@test.com"
  fill_in "email_confirmation", :with => "test2@test.com"
  fill_in "password", :with => "test2"
  fill_in "password_confirmation", :with => "test2"
  click_button(arg1)
end

Given(/^an email has already been registered$/) do
  step('I click the "Sign Up" button on the homepage')
  step('I enter my sign-up details and click "Sign Up"')
end

When(/^I try to register with the same email and click "(.*?)"$/) do |arg1|
  visit '/users/new'
  fill_in "user_name", :with => "roger_t2"
  fill_in "first_name", :with => "Roger"
  fill_in "last_name", :with => "Test2"
  fill_in "email", :with => "test@test.com"
  fill_in "email_confirmation", :with => "test@test.com"
  fill_in "password", :with => "test2"
  fill_in "password_confirmation", :with => "test2"
  click_button(arg1)
end

When(/^I enter an email and email confirmation that don't match and click "(.*?)"$/) do |arg1|
  visit '/users/new'
  fill_in "user_name", :with => "roger_t"
  fill_in "first_name", :with => "Roger"
  fill_in "last_name", :with => "Test"
  fill_in "email", :with => "test@test.com"
  fill_in "email_confirmation", :with => "test2@test.com"
  fill_in "password", :with => "test"
  fill_in "password_confirmation", :with => "test"
  click_button(arg1)
end

When(/^I enter a password and password confirmation that don't match and click "(.*?)"$/) do |arg1|
  fill_in "user_name", :with => "roger_t"
  fill_in "first_name", :with => "Roger"
  fill_in "last_name", :with => "Test"
  fill_in "email", :with => "test@test.com"
  fill_in "email_confirmation", :with => "test@test.com"
  fill_in "password", :with => "test"
  fill_in "password_confirmation", :with => "test2"
  click_button(arg1)
end

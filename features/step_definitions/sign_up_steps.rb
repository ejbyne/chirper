When(/^I enter my sign\-up details and click "(.*?)"$/) do |arg1|
  fill_in "user_name", :with => "roger_t"
  fill_in "first_name", :with => "Roger"
  fill_in "last_name", :with => "Test"
  fill_in "email", :with => "test@test.com"
  fill_in "email_confirmation", :with => "test@test.com"
  fill_in "password", :with => "test"
  fill_in "password_confirmation", :with => "test"
  click_button("Sign Up")
end
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

When(/^I enter my sign\-in details and click "(.*?)"$/) do |arg1|
  fill_in "email", :with => "test@test.com"
  fill_in "password", :with => "test"
  click_button "Sign In"
end


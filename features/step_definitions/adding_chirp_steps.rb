When(/^I add a message$/) do
  fill_in "message", :with => "Hello I am Roger"
  click_button("Chirp")
end

Then(/^I should see my message on the homepage$/) do
  expect(page).not_to have_content("Enter your Chirp:")
  expect(page).to have_content("Hello I am Roger")
end
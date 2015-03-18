When(/^I add a message$/) do
  fill_in "message", :with => "Hello I am Roger"
  click_button("Chirp")
end

Then(/^I should see my chirp on the homepage$/) do
  expect(page).not_to have_content("Enter your Chirp:")
  expect(page).to have_content("Hello I am Roger")
  expect(page).to have_content("Chirped by Roger Test (roger_t)")
end

Given(/^some chirps have been added$/) do
  click_link("Chirp")
  fill_in "message", :with => "Hello I am Roger"
  click_button("Chirp")
  click_link("Chirp")
  fill_in "message", :with => "Hello me again"
  click_button("Chirp")
  click_link("Chirp")
  fill_in "message", :with => "Back again!"
  click_button("Chirp")
end

Then(/^the chirps should be sorted in chronological order$/) do
  chirps = page.all("li.chirp")
  expect(chirps[0]).to have_content("Back again!")
  expect(chirps[1]).to have_content("Hello me again")
  expect(chirps[2]).to have_content("Hello I am Roger")
end

Given(/^I have not logged in$/) do
  visit('/')
end

Then(/^I am unable to add a chirp$/) do
  expect(page).not_to have_link('Chirp', exact: true)
  visit('/chirps/new')
  expect(page).to have_content('You must log in to add a chirp')
end

Then(/^I see see the time and date of the message on the homepage$/) do
  expect(page).to have_content(Time.now.strftime("at %l:%M%P on %d.%m.%Y"))
end

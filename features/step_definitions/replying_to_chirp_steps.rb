Given(/^a chirp has been added$/) do
  add_user
  add_chirp
end

When(/^I add a reply$/) do
  fill_in "message", :with => "Hi back!"
  click_button("Reply")
end

Then(/^I should see my reply on the homepage$/) do
  expect(page).to have_content("Hello")
  expect(page).to have_content("Hi back")
end

Then(/^I am unable to reply to a chirp$/) do
  click_link("Reply")
  expect(page).to have_content('You must log in to reply to a chirp')
end

def add_chirp
  Chirp.create( message:      "Hello",
                user_id:      1,
                created_at:   time = Time.now)
end

def add_user
  User.create(  id:                     1,
                user_name:              "roger_t",
                first_name:             "Roger",
                last_name:              "Test",
                email:                  "test@test.com",
                email_confirmation:     "test@test.com",
                password:               "test",
                password_confirmation:  "test")
end

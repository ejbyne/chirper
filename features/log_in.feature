Feature: Logging in
In order to use Chirper
As a maker
I want to log in

Scenario: Visiting the homepage
  Given I visit the homepage
  Then I should see "Welcome to Chirper!"

Scenario: Logging in
  Given I click the "Sign In" button on the homepage
  When I enter my sign-in details and click "Sign In"
  Then I should see "Welcome, roger_t"

Scenario: I can't log in with the incorrect username
  Given I click the "Sign In" button on the homepage
  When I enter an incorrect username and click "Sign In"
  Then I should see "The username or password is incorrect"

Scenario: I can't log in with the incorrect password
  Given I click the "Sign In" button on the homepage
  When I enter an incorrect password and click "Sign In"
  Then I should see "The username or password is incorrect"
  
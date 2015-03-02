Feature: In order to use Chirper
As a maker
I want to sign up to the service

Scenario: Visiting the homepage
  Given I visit the homepage
  Then I should see "Welcome to Chirper"

Scenario: Signing up
  Given I click the "Sign Up" button on the homepage
  When I enter my sign-up details and click "Sign Up"
  Then I should see "Welcome, roger_t"

Scenario: I can't sign up if the username is already taken
  Given a username has already been registered
  When I try to register with the same username and click "Sign Up"
  Then I should see "User name is already taken"

Scenario: I can't sign up if the email is already taken
  Given an email has already been registered
  When I try to register with the same email and click "Sign Up"
  Then I should see "Email is already taken"

Scenario: I can't sign up if the email and email confirmation don't match
  Given I click the "Sign Up" button on the homepage
  When I enter an email and email confirmation that don't match and click "Sign Up"
  Then I should see "Email does not match the confirmation"

Scenario: I can't sign up if the password and password confirmation don't match
  Given I click the "Sign Up" button on the homepage
  When I enter a password and password confirmation that don't match and click "Sign Up"
  Then I should see "Password does not match the confirmation"
  
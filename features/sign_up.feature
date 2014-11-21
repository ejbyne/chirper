Feature: In order to use Chirper
As a maker
I want to sign up to the service

Scenario: Visiting the homepage
  Given I visit the homepage
  Then I should see "Welcome to Chirper"

Scenario: Signing up
  Given I click the "Sign Up" button on the homepage
  When I enter my sign-up details and click "Sign Up"
  Then I should see "Welcome, Roger!"
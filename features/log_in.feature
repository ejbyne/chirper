Feature: Logging in
In order to use Chirper
As a maker
I want to sign up to the service

Scenario: Visiting the homepage
  Given I visit the homepage
  Then I should see "Welcome to Chirper!"

Scenario: Logging in
  Given I click the "Sign In" button on the homepage
  When I enter my sign-in details and click "Sign In"
  Then I should see "Welcome, Test"

Feature: Adding chirp
In order to let people know what I am doing
As a maker
I want to post a message (chirp) to Chirper

Scenario: Adding a chirp
  Given I have logged in
  When I click "Chirp"
  And I add a message
  Then I should see my chirp on the homepage
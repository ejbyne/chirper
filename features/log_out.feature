Feature: Logging out
In order to avoid others to use my account
As a maker
I want to log out

Scenario: Successful log out
  Given I have logged in
  When I click "Sign Out"
  And I then click "Yes"
  Then I should see "Good bye!"

Scenario: Unsuccessful log out
  Given I have logged in
  When I click "Sign Out"
  And I then click "No"
  Then I should see "Not signed out"



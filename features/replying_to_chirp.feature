Feature: Replying to a chirp
In order to give my opinion on a tweet
As a maker
I want to post a reply to a chirp

Scenario: Replying to a chirp
  Given a chirp has been added
  When I have logged in
  And I click "Reply"
  And I add a reply
  Then I should see my reply on the homepage

Scenario: User must be logged in to reply to a chirp
  Given a chirp has been added
  When I have not logged in
  Then I am unable to reply to a chirp

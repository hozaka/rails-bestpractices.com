Feature: Register
  Scenario: register successful
    When I go to register page
    And I fill in the following:
      | Username              | flyerhzm           |
      | Email                 | flyerhzm@gmail.com |
      | Password              | flyerhzm           |
      | Password confirmation | flyerhzm           |
    And I press "Register"
    Then I should be on the home page
    And I should see "Register successful!"

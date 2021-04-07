Feature: Login
  I want to be able to login the system using ui

  Scenario: Employee Login with UI
    Given a employee
    When I visit login page
    Then I fill "email" with "email@email.com"
    Then I fill "password" with "12345"
    Then I press "commit"
    Then I should see content
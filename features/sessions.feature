Feature: Session API
  I want to be able to login the system

  Scenario: Employee Login
    Given a employee
    When Login to the system
    Then I should successfully login


  Scenario: Employee Login Fail
    Given no employees created
    When Login to the system with wrong password and email
    Then I should fail
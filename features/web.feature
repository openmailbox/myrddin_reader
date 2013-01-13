Feature: Using the web interface
  As a user
  I want to use the web interface
  So I can read the bboards

  Scenario: Visit the homepage
    When I login with username "test" and password "testing"
    And I visit "/"
    Then I should see "BBoard Index"

  Scenario: View a board index
    Given I am logged in
    When I visit "/"
    And I click on "General"
    Then I should see a link to "test"

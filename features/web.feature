Feature: Using the web interface
  As a user
  I want to use the web interface
  So I can read the bboards

  Scenario: Visit the homepage
    When I login with username "test" and password "testing"
    Then I should see "BBoard Index"

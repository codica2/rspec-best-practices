Feature: Add clocks to investment, edit clocks on investment
  Background:
    Given A production database
    And All investors' password changed
    And Admin is logged in

  @javascript
  Scenario: Add clocks to investment without them
    When I visit investment without clocks for 2016 year
    And I click "Create" link
    Then I should see "New 2016 Clock"
    And I enter Current Occupancy clock data
    And I click "Submit" button
    Then I should see "Clock successfully created."

  @javascript
  Scenario: Edit investment's clocks
    When I visit investment with clocks for 2016 year
    And I click "Edit" link
    Then I should see "Edit 2016 Clock"
    And I enter Current Occupancy clock data
    And I click "Submit" button
    And I should see "Clocks successfully updated"

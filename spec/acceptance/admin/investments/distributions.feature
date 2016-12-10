Feature: Add distribution to investment and delete it
  Background:
    Given A production database
    And All investors' password changed
    And Admin is logged in

  @javascript
  Scenario: Add distribution to investment and delete it
    When I visit investment without distributions for 2016 year
    And I select "2017"
    Then I should see 2017 selected
    And I click submit input
    Then I should see "New year added."
    And I click "Edit" link
    Then I should see "Edit Distribution:"
    And I enter Distributions data
    And I click submit input
    Then I should see "Distribution history updated."
    And I click delete distribution link
    Then I should see "Do you want to delete this distribution year?"
    And I click "Delete" button
    Then I should see "Distribution successfully deleted."

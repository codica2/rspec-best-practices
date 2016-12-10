Feature: Add financial snapshot to investment, edit investment's financial snapshot
  Background:
    Given A production database
    And All investors' password changed
    And Admin is logged in

  @javascript
  Scenario: Add financial snapshot to investment
    When I visit investment without financial snapshot for 2016 year
    Then I should see "Financial Snapshot for this year is not created yet."
    And I click "Create" link
    Then I should see "New Financial Snapshot"
    And I enter Financial Snapshot data
    And I click "Create" button
    Then I should see "Financial Snapshot successfully created."

  @javascript
  Scenario: Edit financial snapshot and delete it
    When I visit investment with financial snapshot for 2016 year
    And I click "Edit" link
    Then I should see "Edit Financial Snapshot"
    And I enter Financial Snapshot data
    And I click "Update" button
    Then I should see "Financial Snapshot successfully updated."
    And I click "Delete" link
    Then I should see "Do you want to delete this financial snapshot?"
    And I click "Remove" button
    Then I should see "Financial Snapshot successfully deleted."

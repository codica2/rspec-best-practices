Feature: Export investors' data
  Background:
    Given A production database
    And All investors' password changed
    And Admin is logged in

  @javascript
  Scenario: Export investors' data
    When I visit "/admin/investors"
    And I click "Export Investor's data" button
    And I trigger click on "Select all"
    And I click on next button in the footer
    And I trigger click on "Select all"
    And I submit export payment methods form

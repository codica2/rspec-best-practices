Feature: Export payment methods
  Background:
    Given A production database
    And All investors' password changed
    And Admin is logged in

  @javascript
  Scenario: Export payment methods
    When I visit "/admin/investors"
    And I click "Export Payment Methods" button
    And I trigger click on "Select all"
    And I click on next button in the footer
    And I trigger click on "Select all"
    And I submit export payment methods form

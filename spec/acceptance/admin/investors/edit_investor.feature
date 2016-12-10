Feature: Edit Investor
  Background:
    Given A production database
    And All investors' password changed
    And Admin is logged in

  @javascript
  Scenario: Edit sample investor
    When I visit sample investor's page
    And I click "Edit" link
    Then I should see "Editing"
    And I fill form fields with:
      | Name       | Buck Tillman |
      | Occupation | Developer    |
    And I click "Update" button
    Then I should see "Investor:"
    And I should see following content:
      | Buck Tillman |
      | Developer    |

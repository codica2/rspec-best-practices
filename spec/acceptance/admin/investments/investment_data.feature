Feature: Add investor to investment, edit investor's investment data and delete investor
  Background:
    Given A production database
    And All investors' password changed
    And Admin is logged in

  @javascript
  Scenario: Add investor to sample investment
    When I visit sample investment page and click Investors
    And I fill form fields with:
      | Invest amount                           | 1000 |
      | Dragonfly fee                           | 30   |
      | Tax withholding for foreigner investors | 10   |
    And I click "Add Investor" button
    Then I should see "Investor successfully added."

  @javascript
  Scenario: Edit investor in sample investment
    When I visit sample investment page and click Investors
    And I click "Edit" link
    Then I should see "Edit Investors:"
    And I edit invest amount of investor
    And I click "Update" button
    Then I should see "Investors successfully updated."

  @javascript
  Scenario: Delete sample investor from investment
    When I visit sample investment page and click Investors
    And I delete sample investor from investment
    Then I should see "Do you want to delete this investor from investment?"
    And I click "Remove" button
    Then I should see "Investor successfully deleted from investment."

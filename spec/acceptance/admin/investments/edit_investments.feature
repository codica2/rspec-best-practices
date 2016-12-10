Feature: Edit investments
  Background:
    Given A production database
    And All investors' password changed
    And Admin is logged in

  @javascript
  Scenario: Edit sample development investment
    When I visit sample development investment
    And I click "Edit" link
    Then I should see "Editing:"
    And I select Sold
    And I fill form fields with:
      | #sale-date-picker                 | 2016-12-1  |
      | #estimated_completion_date-picker | 2016-11-30 |
      | Distribution                      | 30000      |
    And I set investment status completed
    And I click "Update" button
    Then I should see "Investment was successfully updated."

  @javascript
  Scenario: Edit sample multi family investment
    When I visit sample multi family investment
    And I click "Edit" link
    Then I should see "Editing:"
    And I fill form fields with:
      | #sale-date-picker                     | 2016-12-1 |
      | Final Distribution                    | 30000     |
      | Sales price                           | 50000     |
      | Projected capex                       | 50000     |
      | Profit less reserves for distribution | 25000     |
    And I set investment status completed
    And I click "Update" button
    Then I should see "Investment was successfully updated."

  @javascript
  Scenario: Edit sample loan
    When I visit sample loan
    And I click "Edit" link
    Then I should see "Editing:"
    And I fill form fields with:
      | Address | San Francisco 1 |
    And I click "Update" button
    Then I should see "Investment was successfully updated."

Feature: Add investments of all types
  Background:
    Given A production database
    And All investors' password changed
    And Admin is logged in

  @javascript
  Scenario: Add development investment
    When I visit "/admin/investments"
    Then I should be on "/admin/investments"
    And I should see "Investments"
    And I click "New Development Investment" link
    And I wait 1 seconds
    Then I should be on "/admin/investments/new"
    And I should see "New Development investment"
    And I fill form fields with:
      | Name                              | NEW DEVELOPMENT INVESTMENT |
      | Complex name                      | COMPLEX NAME               |
      | Address                           | San Francisco 1            |
      | #purchase-date-picker             | 2016-11-18                 |
      | #estimated_completion_date-picker | 2016-12-18                 |
      | Purchase price                    | 10000                      |
      | Equity at purchase                | 10000                      |
      | Debt at purchase                  | 5000                       |
      | Debt interest                     | 5000                       |
      | Construction cost                 | 10000                      |
      | Capital improvements              | 5000                       |
      | Box URL                           | https://www.google.com     |
    And I click "Create" button
    Then I should see "Investment was successfully created."
    And I should see following content:
      | NEW DEVELOPMENT INVESTMENT |
      | COMPLEX NAME               |
      | San Francisco 1            |
      | 2016-11-18                 |
      | 2016-12-18                 |
      | $10,000                    |
      | $10,000                    |
      | $5,000                     |
      | $5,000                     |
      | $10,000                    |
      | $5,000                     |

  @javascript
  Scenario: Add multi-family investment
    When I visit "/admin/investments"
    Then I should be on "/admin/investments"
    And I should see "Investments"
    And I click "New Multi-Family Investment" link
    And I wait 1 seconds
    Then I should be on "/admin/investments/new"
    And I should see "New Multi family investment"
    And I fill form fields with:
      | Name                  | NEW MULTI FAMILY INVESTMENT |
      | Complex name          | COMPLEX NAME                |
      | Address               | San Francisco 1             |
      | #purchase-date-picker | 2016-11-18                  |
      | Purchase price        | 10000                       |
      | Equity at purchase    | 10000                       |
      | Debt at purchase      | 5000                        |
      | Debt interest         | 5000                        |
      | Projected capex       | 5000                        |
      | Capital improvements  | 5000                        |
      | Box URL               | https://www.google.com      |
    And I click "Create" button
    Then I should see "Investment was successfully created."
    And I should see following content:
      | NEW MULTI FAMILY INVESTMENT |
      | COMPLEX NAME                |
      | San Francisco 1             |
      | 2016-11-18                  |
      | $10,000                     |
      | $10,000                     |
      | $5,000                      |
      | $5,000                      |
      | $5,000                      |
      | $5,000                      |

  @javascript
  Scenario: Add new loan
    When I visit "/admin/investments"
    Then I should be on "/admin/investments"
    And I should see "Investments"
    And I click "New Loan" link
    And I wait 1 seconds
    Then I should be on "/admin/investments/new"
    And I should see "New Loan investment"
    And I fill form fields with:
      | Name                  | NEW LOAN INVESTMENT |
      | Address               | San Francisco 1     |
    And I click "Create" button
    Then I should see "Investment was successfully created."
    And I should see "Loan: NEW LOAN INVESTMENT"

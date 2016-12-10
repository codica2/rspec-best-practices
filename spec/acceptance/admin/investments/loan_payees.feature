Feature: Loan payees
  Background:
    Given A production database
    And All investors' password changed
    And Admin is logged in

  @javascript
  Scenario: Add payee to sample loan
    When I visit loan with some payees
    And I click "Payee" link
    Then I should see "Payees:"
    And I fill form fields with:
      | #loan_date_date_picker                   | 2016-12-1  |
      | Loan amount                              | 10000      |
      | #end_of_loan_date_picker                 | 2016-12-7  |
      | #end_of_loan_after_extension_date_picker | 2016-12-10 |
      | Dividend pay date                        | 10         |
      | Interest rate                            | 100        |
    And I select loan distribution
    And I click "Add Payee" button
    Then I should see "Lender successfully added."

  @javascript
  Scenario: Edit sample lender in loan
    When I visit loan with some payees
    And I click "Payee" link
    Then I should see "Payees:"
    And I click "Edit" link
    Then I should see "Edit Payees:"
    And I edit first payee
    Then I click "Update" button
    And I should see "Lenders successfully updated."

  @javascript
  Scenario: Delete sample lender from sample loan
    When I visit loan with some payees
    And I click "Payee" link
    Then I should see "Payees:"
    And I delete sample lender from loan
    Then I should see "Do you want to delete this investor from investment?"
    And I click "Remove" button
    Then I should see "Lender successfully deleted from loan."

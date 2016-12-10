Feature: Investor sign in
  Background:
    Given A sample database

  @javascript
  Scenario: Investor signs in for a first time
    When I visit "/"
    Then I should be on "/investors/sign_in"
    And I should see "You need to sign in before continuing."
    And I fill form fields with:
      | Email    | investor@example.com |
      | Password | UZGE4nqP5buQ         |
    And I click "Investor Login" button
    Then I should be on "/verify_authy_form"
    And I should see "Please enter the code you have just received to your cell phone"
    And I fill form fields with:
      | #authy-token | 1234567 |
    And I click "Submit" button
    Then I should be on "/investors/edit"
    And I should see "You must update your password because this is the first time that you've signed in. Password should contain 8 - 15 charecters."
    And I fill form fields with:
      | #investor_current_password      | UZGE4nqP5buQ |
      | #investor_password              | 5uz5wNPUdtys |
      | #investor_password_confirmation | 5uz5wNPUdtys |
    And I click "Change my password" button
    Then I should be on "/investor/profile"
    And I should see "Your password has been changed successfully."
    And I click "Log Out" link
    Then I should be on "/investors/sign_in"
    And I should see "Log into this account for existing CAREP investors only and enables our investors to view investment reports/other information"

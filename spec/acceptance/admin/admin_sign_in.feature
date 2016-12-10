Feature: Admin sign in
  Background:
    Given A sample database

  Scenario: Admin logs in
    When I visit "/admin/sign_in"
    And I fill form fields with:
      | Email    | admin@example.com |
      | Password | UZGE4nqP5buQ      |
    And I click "Log in" button
    Then I should be on "/verify_authy_form"
    And I fill form fields with:
      | #authy-token | 1234567 |
    And I click "Submit" button
    Then I should be on "/admin/investments"
    And I should see "Signed in successfully!"
    And I click "Log Out" link
    Then I should be on "/admin/sign_in"
    And I should see "Signed out successfully."

Feature: Add investor
  Background:
    Given A production database
    And All investors' password changed
    And Admin is logged in

  @javascript
  Scenario: Add investor
    When I visit "/admin/investors"
    And I should be on "/admin/investors"
    And I should see "Investors"
    And I click "New Investor" link
    And I wait 1 seconds
    Then I should be on "/admin/investors/new"
    And I should see "New Investor"
    And I fill form fields with:
      | Name              | Buck Tillman         |
      | Occupation        | Investor             |
      | Phone number      | 1-936-703-7590       |
      | Email             | another@investor.com |
      | Itin ssn          | itin_ssn             |
      | Box URL           | http://some_url.com  |
      | Wire transfer fee | 30                   |
      | Attention         | Attention            |
      | Institution       | Institution          |
      | Address 1         | 1624 Kiarra Street   |
      | Address 2         | Apt. 774             |
      | City              | Deckowside           |
      | State             | Maine                |
      | Postal code       | 46936                |
    And I click on ".chosen-container.chosen-container-single" selector
    And I click on "United States"
    And I wait 5 seconds
    And I click "Create" button
    Then I should see "Investor was successfully created."
    And I fill form fields with:
      | q_name_or_username_or_phone_number_or_email_cont | Buck Tillman |
    And I hit Enter on "#q_name_or_username_or_phone_number_or_email_cont"
    And I wait 1 seconds
    And I click "Buck Tillman" link
    And I should see following content:
      | Buck Tillman         |
      | Investor             |
      | 1-936-703-7590       |
      | another@investor.com |
      | itin_ssn             |
      | Attention            |
      | Institution          |
      | 1624 Kiarra Street   |
      | Apt. 774             |
      | Deckowside           |
      | Maine                |
      | 46936                |

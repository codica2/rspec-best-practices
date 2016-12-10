Feature: Delete investor
  Background:
    Given A production database
    And All investors' password changed
    And Admin is logged in

  @javascript
  Scenario: Delete sample investor
    When I visit "/admin/investors"
    And I should be on "/admin/investors"
    And I should see "Investors"
    And I choose sample investor and click delete
    Then I should see "Do you want to delete investor?"
    And I click Delete button
    And I take screenshot
    Then I should see "Investor was successfully destroyed."

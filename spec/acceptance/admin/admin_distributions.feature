Feature: Admin Distributions
  Background:
    Given A production database
    And All investors' password changed
    And Admin is logged in

  @javascript
  Scenario: Visit all admin distribution years
    When I visit "/admin/admin_distributions"
    Then I should see "Distributions"
    And I click through all distribution years

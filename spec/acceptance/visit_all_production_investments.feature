Feature: Visit all investments on production database
  Background:
    Given A production database
    And All investors' password changed

  @javascript
  Scenario: Visit all investments
    When I log in as investor with the biggest number of investments
    Then I visit all investments and click all links there

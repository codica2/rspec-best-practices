Feature: Progresses
  Background:
    Given A production database
    And All investors' password changed
    And Admin is logged in

  @javascript
  Scenario: Add progress to sample development investment
    When I visit sample development investment with some progresses
    And I click "Progresses" link
    Then I should see "Progresses:"
    And I fill form fields with:
      | Description | Some description |
    And I select good
    And I click "Add Progress" button
    Then I should see "Progress successfully added."

  @javascript
  Scenario: Edit sample progress of sample development investment
    When I visit sample development investment with some progresses
    And I click "Progresses" link
    Then I should see "Progresses:"
    And I click "Edit" link
    Then I should see "Edit Progresses:"
    And I edit first progress
    And I click "Update" button
    Then I should see "Progresses successfully updated."

  @javascript
  Scenario: Delete sample progress from investment
    When I visit sample development investment with some progresses
    And I click "Progresses" link
    Then I should see "Progresses:"
    And I delete sample progress from investment
    Then I should see "Do you want to delete this progress?"
    And I click "Delete" button
    Then I should see "Progress successfully destroyed."

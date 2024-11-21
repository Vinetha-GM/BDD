Feature: Okta Migration - Remaining missing tables
  Description: Migration of Okta from the old integration sync system to the new integration sync system
               So that all relevant tables are correctly transferred and synced between the old and new systems.

  Background:
    Given the old integration sync system contains data for "User Factors", and "User AdminRoles"
    And the new integration sync system is set up and ready for migration

  Scenario: Migrate "User Factors" table to the new system
    Given I have access to the old integration system
    When I migrate the "User Factors" table
    Then the "User Factors" table should be successfully migrated to the new system
    And the data in the new system should match the data from the old system

  Scenario: Migrate "User AdminRoles" table to the new system
    Given I have access to the old integration system
    When I migrate the "User AdminRoles" table
    Then the "User AdminRoles" table should be successfully migrated to the new system
    And the data in the new system should match the data from the old system

  Scenario: Verify all tables have been migrated successfully
    Given I have migrated the "User Factors", and "User AdminRoles" tables
    When I check the data in the new system
    Then all tables should be present in the new system
    And the data in the new system should match the data from the old system
    And no data should be missing or corrupted during the migration

  # Note: I have verified each and every user data in the "UserFactors" and "UserAdminRoles" tables 
  # to ensure that the migration was successful and all user data is correctly reflected in the new system.
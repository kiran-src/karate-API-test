Feature: Run get order from Simple Tools

  Background:
    * url BASE_URL

  Scenario: Get dog breed
    * header Content-Type = 'application/json'
    Given path PATH_BREED+importID
    And param limit = importLimit
    And param page = importPage
    When method get
#    * match response.comment == "<comment>"
Feature: Run get order from Simple Tools

  Background:
    * url BASE_URL

  Scenario: Get dog breed
#    * header x-api-key = impToken
    * header Content-Type = 'application/json'
    Given path PATH_BREED
    And param page = importPage
    And param limit = importLimit
    When method get
#    * match response.comment == "<comment>"
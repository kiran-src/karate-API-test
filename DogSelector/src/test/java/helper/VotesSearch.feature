Feature: Run get order from Simple Tools

  Background:
    * url BASE_URL

  Scenario: Get dog breed
    * header x-api-key = TOKEN_KEY
    * header Content-Type = 'application/json'
    Given path PATH_VOTE+importID
    When method get
#    * match response.comment == "<comment>"
Feature: Run get order from Simple Tools

  Background:
    * url BASE_URL

  Scenario: Post Vote

    * header x-api-key = TOKEN_KEY
    * header Content-Type = 'application/json'
    Given path PATH_VOTE
    And request importBody
    When method post
#    * match response.comment == "<comment>"
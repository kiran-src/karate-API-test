Feature: Run get order from Simple Tools

  Background:
    * url BASE_URL

  Scenario: Post Vote
    * header x-api-key = TOKEN_KEY
    * header Content-Type = 'application/json'
    Given path PATH_VOTE+importID
    When method delete
#    * match response.comment == "<comment>"
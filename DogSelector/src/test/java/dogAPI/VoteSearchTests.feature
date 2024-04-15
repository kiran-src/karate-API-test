#noinspection CucumberUndefinedStep
Feature: Run and Test Dog API

  Background:

  Scenario: Test positive cases to search all votes
    * def inputData = {'importID': ''}
    * def breedFind = call read('classpath:helper/VotesSearch.feature') inputData
    * match breedFind.responseStatus == 200
    * print breedFind.response
    * match each breedFind.response[*].image_id == '#string'
    * match each breedFind.response[*].sub_id == '#string'
    * match each breedFind.response[*].created_at == '#string'
    * match each breedFind.response[*].value == '#number'

  Scenario: Test positive cases to search single votes
    * def inputData = {'importID': '194823'}
    * def breedFind = call read('classpath:helper/VotesSearch.feature') inputData
    * match breedFind.responseStatus == 200
    * match breedFind.response.image_id == '#string'
    * match breedFind.response.sub_id == '#string'
    * match breedFind.response.created_at == '#string'
    * match breedFind.response.value == '#number'

  Scenario: Test positive cases to search single votes fir a second time
    * def inputData = {'importID': '194823'}
    * def breedFind = call read('classpath:helper/VotesSearch.feature') inputData
    * match breedFind.responseStatus == 200
    * match breedFind.response.image_id == '#string'
    * match breedFind.response.sub_id == '#string'
    * match breedFind.response.created_at == '#string'
    * match breedFind.response.value == '#number'

  Scenario Outline: Test negative cases to search votes
    * def inputData = {'importID': <id>}
    * def breedFind = call read('classpath:helper/VotesSearch.feature') inputData
    * match breedFind.responseStatus == <status>

    Examples:
      |id|status|
      |'afasefe'|404|
      |999999999|404|
#
#  Scenario Outline: Test negative cases to search all breeds
#    * def inputData = {'importID': '', 'importLimit': <limit>, 'importPage': <page>}
#    * def breedFind = call read('classpath:helper/breedSearch.feature') inputData
#    * match breedFind.responseStatus == <status>
#
#    Examples:
#      |id|limit|page|status|
#      |''|-10| 0|400      |
#      |''|10|-1|400      |
#      |''|'aaa'| 0|200      |
#      |''|10|'aaa'|200      |
#      |8798|''|''|200      |
#      |-8798|''|''|200      |
#      |'bads'|''|''|200      |


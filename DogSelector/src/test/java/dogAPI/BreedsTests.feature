#noinspection CucumberUndefinedStep
Feature: Run and Test Dog API

  Background:

  Scenario Outline: Test positive cases to search all breeds
    * def inputData = {'importID': <id>, 'importLimit': <limit>, 'importPage': <page>}
    * def breedFind = call read('classpath:helper/breedSearch.feature') inputData
    * match breedFind.responseStatus == 200
    * match each breedFind.response[*].id == '#number'
    * match each breedFind.response[*].name == '#string'
    * match each breedFind.response[*].bred_for == '#string'
    * match each breedFind.response[*].breed_group == '#string'
    * match each breedFind.response[*].life_span == '#string'
    * match each breedFind.response[*].temperament == '#string'
    * match each breedFind.response[*].origin == '#string'
    * match each breedFind.response[*].reference_image_id == '#string'
    * match each breedFind.response[*].weight.imperial == '#string'
    * match each breedFind.response[*].weight.metric == '#string'
    * match each breedFind.response[*].height.imperial == '#string'
    * match each breedFind.response[*].height.metric == '#string'

    Examples:
      |id|limit|page|
      |''|10| 0|
      |''|10|''|
      |''|''| 0|
      |''|''|''|

  Scenario: Test positive cases to search single breed
    * def inputData = {'importID': 2, 'importLimit': '', 'importPage': ''}
    * def breedFind = call read('classpath:helper/breedSearch.feature') inputData
    * match breedFind.responseStatus == 200
    * match breedFind.response.id == '#number'
    * match breedFind.response.name == '#string'
    * match breedFind.response.bred_for == '#string'
    * match breedFind.response.breed_group == '#string'
    * match breedFind.response.life_span == '#string'
    * match breedFind.response.temperament == '#string'
    * match breedFind.response.origin == '#string'
    * match breedFind.response.reference_image_id == '#string'
    * match breedFind.response.weight.imperial == '#string'
    * match breedFind.response.weight.metric == '#string'
    * match breedFind.response.height.imperial == '#string'
    * match breedFind.response.height.metric == '#string'

  Scenario Outline: Test negative cases to search all breeds
    * def inputData = {'importID': '', 'importLimit': <limit>, 'importPage': <page>}
    * def breedFind = call read('classpath:helper/breedSearch.feature') inputData
    * match breedFind.responseStatus == <status>

    Examples:
      |id|limit|page|status|
      |''|-10| 0|400      |
      |''|10|-1|400      |
      |''|'aaa'| 0|200      |
      |''|10|'aaa'|200      |
      |8798|''|''|200      |
      |-8798|''|''|200      |
      |'bads'|''|''|200      |


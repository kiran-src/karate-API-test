#noinspection CucumberUndefinedStep
Feature: Run and Test Dog API

  Background:
    * def vote_id = 0
    * def body =
    """
    {
	"image_id":"TsX2uGPRr",
    "value":"Vali",
	"sub_id": "my-user-1234"
    }
    """

  Scenario: Test positive cases to post and delete votes
    * def inputData = {'importBody': {"image_id":"TsX2uGPRr","value":"Vali","sub_id":"my-user-1234"}}
    * def votePost = call read('classpath:helper/VotesPost.feature') inputData
    * match votePost.responseStatus == 201
    * match votePost.response.message == 'SUCCESS'
    * match votePost.response.id == '#number'
    * match votePost.response.image_id == '#string'
    * match votePost.response.sub_id == '#string'
    * match votePost.response.value != ''


    * def inputData2 = {'importID': '#(votePost.response.id)'}
    * def breedFind = call read('classpath:helper/VotesDelete.feature') inputData2
    * match breedFind.responseStatus == 200

#    * karate.set ('karate.vote_id', votePost.response.id)

  Scenario Outline: Test negative cases to post votes
    * def inputData = {'importBody': <bodyPost>}
    * def votePost = call read('classpath:helper/VotesPost.feature') inputData
    * match votePost.responseStatus == <status>

    Examples:
    |bodyPost|status|
    |{}      |400   |
    |''      |400   |

  Scenario Outline: Test negative cases to delete votes
    * def inputData = {'importID': <id>}
    * def breedFind = call read('classpath:helper/VotesDelete.feature') inputData
    * match breedFind.responseStatus == <status>

    Examples:
      |id|status|
      |'afasefe'|404|
      |999999999|404|



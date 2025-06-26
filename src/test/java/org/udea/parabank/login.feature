@appContact_login
Feature: Login to Contact Application

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Customer Login
    Given path '/users/login'
    And request
    """
    {
        "email": "pruebaj@gmail.com",
        "password": "1234567"
    }
    """
    When method POST
    Then status 200
    * def token = response.token
    And match response ==
    """
    {
        "user": {
            "_id": '#string',
            "firstName": '#string',
            "lastName": '#string',
            "email": '#string',
            "__v": #number,
        },
        "token": '#string'
    }
    """
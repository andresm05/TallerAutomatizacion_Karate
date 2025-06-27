Feature: Add contact

Background:
  * url baseUrl
  * header Accept = 'application/json'
  * def loginResult = call read('login.feature')
  * def token = loginResult.token
  * header Authorization = 'Bearer ' + token

Scenario: Add contact
    Given path '/contacts'
    * def contact =
    """
    {
    "firstName": "David",
    "lastName": "MonteNegro",
    "birthdate": "1990-05-15",
    "email": "ana" + java.lang.System.currentTimeMillis() + "@correo.com",
    "phone": "3" + Math.floor(Math.random() * 1000000000),
    "street1": "Av. Siempre Viva 123",
    "street2": "Depto 1",
    "city": "Bogotá",
    "stateProvince": "Cundinamarca",
    "postalCode": "110111",
    "country": "Colombia"
    }
    """
    And request contact
    When method POST
    Then status 201
    And match response ==
        """
        {
        "_id": '#string',
        "firstName": '#string',
        "lastName": '#string',
        "birthdate": '#string',
        "email": '#string',
        "phone": '#string',
        "street1": '#string',
        "street2": '#string',
        "city": '#string',
        "stateProvince": '#string',
        "postalCode": '#string',
        "country": '#string',
        "owner": '#string',
        "__v": '#number'
        }
        """

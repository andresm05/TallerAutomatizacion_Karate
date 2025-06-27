Feature: Add contact

Background:
  * url baseUrl
  * header Accept = 'application/json'
  * def loginResult = call read('login.feature')
  * def token = loginResult.token
  * def email = 'user' + java.lang.System.currentTimeMillis() + '@mail.com'
  * def phone = Math.floor(Math.random() * 10000000000).toString()
  * header Authorization = 'Bearer ' + token

Scenario: Add contact
    Given path '/contacts'
    And request
    """
    {
    "firstName": "David",
    "lastName": "Montenegro",
    "birthdate": "1970-01-01",
    "email": "#(email)",
    "phone": "#(phone)",
    "street1": "123 Main St",
    "street2": "Apt 4B",
    "city": "Springfield",
    "stateProvince": "IL",
    "postalCode": "62701",
    "country": "Colombia"
    }
    """
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

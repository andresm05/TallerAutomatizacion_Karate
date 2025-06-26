Feature: Add contact

Background:
  * url baseUrl
  * header Accept = 'application/json'
  * def loginResult = call read('login.feature')
  * def token = loginResult.token
  * header Authorization = 'Bearer ' + token

Scenario: Add contact
  Given path '/contacts'
  And request
    """
    {
      "firstName": "Cristhian",
      "lastName": "Paez",
      "birthdate": "1970-01-01",
      "email": "cristhianPaez@gmail.com",
      "phone": "1234567890",
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
      "_id": '#number',
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

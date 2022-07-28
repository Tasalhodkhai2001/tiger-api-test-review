@EndToEnd
Feature: Automate End to End Scenario

  Background: genrate token
    Given url "https://tek-insurance-api.azurewebsites.net/"
    And path "/api/token"
    And request
      """
      {
        "username": "supervisor",
        "password": "tek_supervisor"
      }
      """
    When method post
    Then status 200
    And print response
    * def createdToken = response.token

  Scenario: Create New Account ,Add address ,phone, and car into it
     Given path "/api/accounts/add-primary-account"
    * def getData = Java.type('tiger.api.fakeData.review.FakeDataReview')
    * def  email = getData.getEmail()
    * def firstname =  getData.getfirstName()
    * def lastname = getData.getLastName()
    * def Title = getData.getTitle()
    * def dob =  getData.getDob()
    * def phoneNumber = getData.getPhoneNumber()
    * def phoneE = getData.getPhoneExtension()
    * def SAddress = getData.getStreetAddress()
    * def cityName = getData.getCityName()
    * def stateName = getData.getStateName()
    * def postalCode = getData.getpostalCode()
    And request
      """
      {
        "email": "#(email)",
        "firstName": "#(firstname)",
        "lastName": "#(lastname)",
        "title": "#(Title)",
        "gender": "MALE",
        "maritalStatus": "SINGLE",
        "employmentStatus": "Student",
        "dateOfBirth": "#(dob)",
        "new": true
      }
      """
    And header Authorization = "Bearer " + createdToken
    When method post
    And status 201
    And print response
    * def dynamicId = response.id
    * def expectedResult = response.email
    Then assert expectedResult == email
    #Then assert expectedResult == "#(email)"
    # Adding phone number to the account
    Given path "/api/accounts/add-account-phone"
    And param primaryPersonId = dynamicId
    And request
      """
      {
        "phoneNumber": "#(phoneNumber)",
        "phoneExtension": "#(phoneE)",
        "phoneTime": "AnyTime",
        "phoneType": "Home"
      }
      """
    And header Authorization = "Bearer " + createdToken
    When method post
    And status 201
    And print response
    # Adding Address to acount
    Given path "/api/accounts/add-account-address"
    And param primaryPersonId = dynamicId
    And request
      """
      {
       
        "addressType": "Apartment",
        "addressLine1": "#(SAddress)",
        "city": "#(cityName)",
        "state": "#(stateName)",
        "postalCode": "#(postalCode)",
        "current": true
      }
      """
    And header Authorization = "Bearer " + createdToken
    When method post
    And status 201
    And print response
    #
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId = dynamicId
    And request
      """
      {
        "make": "Jeep",
        "model": "new",
        "year": "2024",
        "licensePlate": "Afg-1"
      }
      """
    And header Authorization = "Bearer " + createdToken
    When method post
    And status 201
    And print response

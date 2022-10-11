Feature: Verify the home page Data

  Background:
    * url baseUrlCme
    * def country = country

  @topSearches
  Scenario: Get Top Searches
    Given path '/api/elastic/getTopSearches'
    And param size = 10
    When method GET
    Then status 200
    And assert responseBytes.length > 3

  @allCountries
  Scenario: Get All Countries
    Given path '/api/location/countries'
    When method GET
    Then status 200
    And assert responseBytes.length > 3

  @country @ignore
  Scenario: Get User Country by IP
    Given url 'https://api.country.is'
    When method GET
    Then status 200
    And assert responseBytes.length > 3
    * def cont = response.country

  @webinars
  Scenario: Get Webinar List
    Given path '/api/webinar/getWebinarsList'
    When method GET
    Then status 200
    And assert responseBytes.length > 3

  @homeRecommendation
  Scenario: Get home page Recommendations
#    * def country = call read('home.feature@country')
    Given path '/api/home/recommendations/v1'
    And param isHomePage = true
    And param countryCode = country
    When method GET
    Then status 200
    And assert responseBytes.length > 3

  @homeBanner
  Scenario: Get Home banners
#    * def country = call read('home.feature@country')
    Given path 'api/v1/home-banner/user'
    And param countryCode = country
    When method GET
    Then status 200
    And assert responseBytes.length > 3

  @newsCoverage
  Scenario: Get News coverage
    Given path 'api/v1/newsCoverage/user'
    And param countryCode = country
    When method GET
    Then status 200
    And assert responseBytes.length > 3

  @sendAppLink
  Scenario: Send OC Doctor app link
    Given path '/api/msg/getAppLink'
    When request {"mobileNumber":"6565055127"}
    * method POST
    Then status 200
    And assert responseBytes.length > 3


    #comment
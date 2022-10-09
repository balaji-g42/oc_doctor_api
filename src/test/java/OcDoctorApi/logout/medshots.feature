Feature: Verify the Medshots landing Page

  Background:
    * url baseUrlMed
    * def country = country

  @dailyUpdates
  Scenario: Medshots Daily updates Section
    Given path '/api/medshots/v1/getMedshots'
    When request {"pageNumber":1,"pageSize":5,"category":"DAILY_UPDATES","homePage":true,"specialityIds":[]}
    * method POST
    Then status 200
    * assert responseBytes.length > 3

  @editorialPicks
  Scenario: Medshots Editorial Picks Section
    Given path '/api/medshots/v1/getMedshots'
    When request {"pageNumber":1,"pageSize":5,"category":"EDITORIAL_PICKS","homePage":true,"specialityIds":[]}
    * method POST
    Then status 200
    * assert responseBytes.length > 3

  @recommendedMedshots
  Scenario: Medshots Recommended Medshots Section
    Given path '/api/medshots/v1/getMedshots'
    When request {"pageNumber":1,"pageSize":5,"category":"RECOMMENDED","homePage":true,"specialityIds":[]}
    * method POST
    Then status 200
    * assert responseBytes.length > 3

  @panorama
  Scenario: Medshots Panorama Section
    Given path '/api/medshots/v1/getMedshots'
    When request {"pageNumber":1,"pageSize":5,"category":"PANORAMA","homePage":true,"specialityIds":[]}
    * method POST
    Then status 200
    * assert responseBytes.length > 3

  @basedOnHistory
  Scenario: Medshots Based on History Section
    Given path '/api/medshots/v1/getMedshots'
    When request {"pageNumber":1,"pageSize":5,"category":"BASED_ON_HISTORY","homePage":true,"specialityIds":[]}
    * method POST
    Then status 200
    * assert responseBytes.length > 3

  @trending
  Scenario: Medshots trending Section
    Given path '/api/medshots/v1/getMedshots'
    When request {"pageNumber":1,"pageSize":5,"category":"TRENDING","homePage":true,"specialityIds":[]}
    * method POST
    Then status 200
    * assert responseBytes.length > 3
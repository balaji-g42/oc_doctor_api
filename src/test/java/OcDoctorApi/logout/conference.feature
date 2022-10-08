Feature: Verify the Conference page Data

  Background:
    * url baseUrlCme
    * def country = country
    * header Accept = 'application/json'

  @conferences @positive
  Scenario: Get Conferences list
    Given path 'api/filters/viewAll'
    And params {category : 'CONFERENCES', pageNumber : 1, pageSize : 8}
    When request {"sortAndFilterRequest":{},"quickFilterRequest":{}}
    * method POST
    Then status 200
    And assert responseBytes.length > 3
    * def page = response.totalPages

    #Going to lastPage
    Given path 'api/filters/viewAll'
    And params {category : 'CONFERENCES', pageNumber : #(page), pageSize : 8}
    When request {"sortAndFilterRequest":{},"quickFilterRequest":{}}
    * method POST
    Then status 200
    And assert responseBytes.length > 3
    And match response.isLast == true

  @conferences @negative
  Scenario: Get Recommended CME/CPD list
    Given path 'api/filters/viewAll'
    And params {category : 'CONFERENCES', pageNumber : 1, pageSize : 8}
    When request {"sortAndFilterRequest":{},"quickFilterRequest":{}}
    * method POST
    Then status 200
    And assert responseBytes.length > 3
    * def page = response.totalPages-1

    #Going to lastPage
    Given path 'api/filters/viewAll'
    And params {category : 'CONFERENCES', pageNumber : #(page), pageSize : 8}
    When request {"sortAndFilterRequest":{},"quickFilterRequest":{}}
    * method POST
    Then status 200
    And assert responseBytes.length > 3
    And match response.isLast == false

  @sortAndFilter
  Scenario: Sort and Filter options for the Page
    Given path '/api/filters/sortAndFilter'
    When request {"categories":["CONFERENCES"]}
    * method POST
    Then status 200
    And assert responseBytes.length > 3
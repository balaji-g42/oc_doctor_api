Feature: Verify the CME/CPD Page all Apis

  Background:
    * url baseUrlCme
    * def country = country

  @recommendedCme @positive
  Scenario: Get Recommended CME/CPD list
    Given path 'api/filters/viewAll'
    And params {category : 'RECOMMENDED_CME', pageNumber : 1, pageSize : 8}
    When request {"sortAndFilterRequest":{},"quickFilterRequest":{}}
    * method POST
    Then status 200
    And assert responseBytes.length > 3
    * def page = response.totalPages

    #Going to lastPage
    Given path 'api/filters/viewAll'
    And params {category : 'RECOMMENDED_CME', pageNumber : #(page), pageSize : 8}
    When request {"sortAndFilterRequest":{},"quickFilterRequest":{}}
    * method POST
    Then status 200
    And assert responseBytes.length > 3
    And match response.isLast == true

  @recommendedCme @negative
  Scenario: Get Recommended CME/CPD list
    Given path 'api/filters/viewAll'
    And params {category : 'RECOMMENDED_CME', pageNumber : 1, pageSize : 8}
    When request {"sortAndFilterRequest":{},"quickFilterRequest":{}}
    * method POST
    Then status 200
    And assert responseBytes.length > 3
    * def page = response.totalPages-1

    #Going to lastPage
    Given path 'api/filters/viewAll'
    And params {category : 'RECOMMENDED_CME', pageNumber : #(page), pageSize : 8}
    When request {"sortAndFilterRequest":{},"quickFilterRequest":{}}
    * method POST
    Then status 200
    And assert responseBytes.length > 3
    And match response.isLast == false

  @sortAndFilter
  Scenario: Sort and Filter options for the Page
    Given path '/api/filters/sortAndFilter'
    When request {"categories":["RECOMMENDED_CME"]}
    * method POST
    Then status 200
    And assert responseBytes.length > 3
Feature: Verify the Global search All Apis

  Background:
    * url baseUrlCme
    * def country = country

  @trendingSearch
  Scenario: Get Top Searches
    Given path '/api/elastic/getTopSearches'
    And param size = 10
    When method GET
    Then status 200
    And assert responseBytes.length > 3

  @elasticSearch
  Scenario: Search for the keyword entered
    Given path '/api/elastic/search'
    When request {"text":"oral","status":"fetching"}
    * method POST
    Then status 200
    * assert responseBytes.length > 3

  @elasticSearchFilters
  Scenario: Filter Details for Elastic Search
    Given path 'api/elastic/filters'
    When method GET
    Then status 200
    * assert responseBytes.length > 3

  @spellCheck
  Scenario: Spell Check and Suggestion for Search
    Given path '/api/elastic/spellcheck'
    When request {"text":"oral"}
    * method POST
    Then status 200
    * assert responseBytes.length > 3
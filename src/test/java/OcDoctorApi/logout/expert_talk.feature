Feature: Verify the Expert Talk landing Page

  Background:
    * url baseUrlCme
    * def country = country

  @expertTalkLandingPage
  Scenario: Expert talk landing page data
    Given path '/api/home/recommendations/v1'
    * params {isHomePage:false,countryCode:#(country),screen:EXPERT_TALK_LANDING_PAGE}
    When method GET
    Then status 200
    * assert responseBytes.length > 3
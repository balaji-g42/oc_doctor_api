Feature: Common Requests
  Background:
    * url baseUrlCme

    @country
    Scenario: Get the Country Code
      Given url 'https://api.country.is'
      When method GET
      Then status 200
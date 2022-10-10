Feature: Verify the login Api should trigger otp
  Background: 
    * url baseUrlCme
    * def country = country
    * def mobile = mobile
    
    @Login
    Scenario: With Correct Mobile Number OTP should trigger
      Given path '/api/v2/login'
      When request {"mobileNumber":"#(mobile)","countrySortName":"#(country)"}
      * method POST
      Then status 200
      * if (response.newUser == false) karate.call(true, 'classpath:OcDoctorApi/authentication/login.feature@verifyOtp')
      * def accessToken =  response.users.accessToken
      * print accessToken
      
      @verifyOtp @ignore
      Scenario: With Correct Otp User Should login
        Given path '/api/v2/login/otpVerification'
        When request {"mobileNumber":"#(mobile)","otp":"111111"}
        * method POST
        Then status 200
#        * print accessToken
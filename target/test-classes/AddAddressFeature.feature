Feature: create an account and add address to the account

 

# step1) Get a token
# step2) Generate an Account 
# Step3) add address to generate account

 

 Background: Create new Account.
 Given url "https://tek-insurance.azurewebsites.net"
 * def createAccountResult = callonce read('CreateAccountFeature.feature')
 And print createAccountResult 
 * def primaryPersonId = CreateAccountResult.response.id 
 * def token = createAccountResult.result.response.token
 
 Scenario: Add address to an account
      Given path '/api/account/add-account-address'
   Given param primaryPersonId = primaryPersonId
   Given header Authorization = "Bearer" + token
   Given request
   """
   {
  "id": "Home",
  "addressType": "1212 Crimdell bridge Ter",
  "addressLine1": "string",
  "city": "Stering",
  "state": "VA",
  "postalCode": "20166",
  "countryCode": "+1",
  "current": true
   }
  """
 When method post
 Then status 201
 And print response


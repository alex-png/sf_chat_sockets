@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
     @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account result =  [SELECT id, name, (SELECT id, name FROM Contacts) FROM Account WHERE id=:accountid ];
        return result;
        }
}
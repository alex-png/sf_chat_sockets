public class HelloWorldController {

    @AuraEnabled
    public static List<Contact> getContacts(){
		List<Contact> contacts = [SELECT Id, FirstName, LastName FROM Contact];
        return contacts;
    }
}
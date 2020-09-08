public with sharing class allAvailableContacts {
//with sharing will apply user record level security
    public static List<Contact> getContacts(){
    	List<Contact> allContacts = new List<Contact>();
        if(!Schema.SObjectType.Contact.isAccessible()){
                //query for required fields in all records of this object, then strip fields which should not be visible to user.
                allContacts = Security.stripInaccessible(AccessType.READABLE, [SELECT firstName, lastName, phone, email FROM Contact]).getRecords();    
                System.debug(allContacts);
                return allContacts;
        }
        system.debug(allContacts);
        return allContacts;
    }
} //end of class
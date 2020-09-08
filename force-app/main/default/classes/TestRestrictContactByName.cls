@isTest public class TestRestrictContactByName {
    @isTest static void TestRestrictContactByName(){
        Contact con = new Contact(FirstName='Al', LastName = 'INVALIDNAME',email='Test@test.com');
        Test.startTest();
        try{
            insert con;
        }catch(Exception e){
            
        }
        Test.stopTest();
    }   
}
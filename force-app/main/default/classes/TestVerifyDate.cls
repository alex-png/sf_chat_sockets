@isTest
public class TestVerifyDate {
    @isTest static void testCheckDates(){
    //Date.today(),Date.today().addDays(32)
		Date today = Date.today();
        Date tomorrow = Date.today().addDays(1);
        Date after30 = Date.today().addDays(32);
        system.assertEquals(tomorrow, VerifyDate.CheckDates(today, tomorrow));
		system.assertEquals(today, VerifyDate.CheckDates(today, after30));        
    }
    
}
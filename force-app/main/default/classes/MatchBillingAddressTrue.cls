public class MatchBillingAddressTrue {
    public static void checkBox(List<Account> accts){
        for(Account acct:accts){
            if(acct.Match_Billing_Address__c == true && acct.BillingPostalCode != ''){
                acct.ShippingPostalCode = acct.BillingPostalCode;
            }
        }
    }
}
//With 'AccountAddressTrigger' active, if an Account has a Billing Postal 
//Code and 'Match_Billing_Address__c' is true, the record should have the 
//Shipping Postal Code set to match on insert or update.
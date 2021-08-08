/**
 *? author: Liam Jeong
 **  contact: dev.liam.jeong@gmail.com
 *? since: 2021-08-08
 *! description:
 *      1. retrive list of accounts
 *      2. iterate the list, and set the Shipping Postal Code to match the Billing Postal Code
 *          2-1. only if Match Billing Address is true
*/
public with sharing class AddressMatcher {
    
    public static void setAddress(List<Account> accts) {
        
        try {                        

            for (Account acct : accts) {
            
                if (true == acct.Match_Billing_Address__c) {
                    
                    acct.ShippingPostalCode = acct.BillingPostalCode;
                    System.debug('ShippingPostalCode: ' + acct.ShippingPostalCode + ' | BillingPostalCode: ' + acct.BillingPostalCode);

                }                

            }    

        } catch (Exception e) {
            
            System.debug('Cause by: ' + e.getCause());
            System.debug('Line Number: ' + e.getLineNumber());
            System.debug('Stack Trace: ' + e.getStackTraceString());
            System.debug('Message: ' + e.getMessage());

        }
        

    }

}

/**
 * @author  Liam Jeong
 * @since   2022-05-23
 *? @purpose  To pass Apex Triggers module in the Salesforce Trailhead
 *? @requirement 
 **      1. Get Started with Apex Triggers
 *          Create an Apex trigger that sets an account’s Shipping Postal Code to match the Billing Postal Code 
 *          if the Match Billing Address option is selected. 
 *          Fire the trigger before inserting an account or updating an account.
 */
public with sharing class AccountTriggerHandler {
    
    /**
     *! @description
     *      If the Match Billing Address option is true,
     *          it sets the account’s Shipping Postal Code to match the Billing Postal Code 
     */
    static void setShippingPostalCode(Account acct){

        if (acct.Match_Billing_Address__c) {
            
            acct.ShippingPostalCode = acct.BillingPostalCode;            

        }

    }

    public static void beforeInsert(List<Account> accounts){

        if (accounts != null) {
            
            for (Account acct : accounts) {
                                                
                setShippingPostalCode(acct);

            }

        }

    }
    public static void beforeUpate(List<Account> accounts){

        if (accounts != null) {
            
            for (Account acct : accounts) {
                
                setShippingPostalCode(acct);

            }

        }

    }

}

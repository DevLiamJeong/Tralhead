/**
 *? author: Liam Jeong
 **  contact: dev.liam.jeong@gmail.com
 *? since: 2021-08-08
 *! description:
 *      
*/
@isTest
private class TestAddressMatcher {
    
    @TestSetup
    static void makeData(){
        
        List<Account> acctsWithBillingPostalCode = new List<Account>();
        List<Account> acctsWithoutBillingPostalCode = new List<Account>();

        for (Integer i = 0; i < 100; i++) {
            
            acctsWithBillingPostalCode.add(new Account(Name='With Billing Postal Code', BillingPostalCode='11111', Match_Billing_Address__c=true));
            acctsWithBillingPostalCode.add(new Account(Name='With Billing Postal Code', BillingPostalCode='11111', Match_Billing_Address__c=false));
            acctsWithoutBillingPostalCode.add(new Account(Name='Without Billing Postal Code', Match_Billing_Address__c=true));
            
        }

        System.debug(acctsWithBillingPostalCode.size());        // 100
        System.debug(acctsWithoutBillingPostalCode.size());     // 100

        insert acctsWithBillingPostalCode;
        insert acctsWithoutBillingPostalCode;

    }

    @IsTest
    static void positiveCase(){
        
        Test.startTest();
        
        Boolean isWorkingAsIntended = true;

        for (Account acct : [SELECT Id, ShippingPostalCode, BillingPostalCode FROM Account WHERE Name='With Billing Postal Code' AND Match_Billing_Address__c=true]) {
            
            if(acct.ShippingPostalCode != acct.BillingPostalCode){

                isWorkingAsIntended = false;

            }

        }

        System.assertEquals(true, isWorkingAsIntended, 'It should be true...');

        Test.stopTest();
        
    }

    @IsTest
    static void negativeCase(){
        
        Test.startTest();
        
        Boolean isWorkingAsIntended = true;

        for (Account acct : [SELECT Id, ShippingPostalCode, BillingPostalCode FROM Account WHERE Name='With Billing Postal Code' AND Match_Billing_Address__c=false]) {
            
            if(acct.ShippingPostalCode != acct.BillingPostalCode){

                isWorkingAsIntended = false;
                break;

            }

        }

        System.assertNotEquals(true, isWorkingAsIntended, 'It should be true...');

        for (Account acct : [SELECT Id, ShippingPostalCode, BillingPostalCode FROM Account WHERE Name='Without Billing Postal Code' AND Match_Billing_Address__c=true]) {
            
            if(acct.ShippingPostalCode == acct.BillingPostalCode){

                isWorkingAsIntended = false;
                break;

            }

        }

        System.assertNotEquals(true, isWorkingAsIntended, 'It should be false...');

        Test.stopTest();
        
    }

    @IsTest
    static void exceptionCase(){
        
        Test.startTest();
        
        List<Account> accts = new List<Account>();

        Account errorAcct;        

        accts.add(errorAcct);

        AddressMatcher.setAddress(accts);
        
        Test.stopTest();
        
    }

}

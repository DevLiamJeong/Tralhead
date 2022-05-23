@isTest
private class AccountTriggerHandlerTest {
    
    final static Integer mNumOfTestCases = 20;

    @TestSetup
    static void makeData(){
        
        List<Account> accts = new List<Account>();
        for (Integer i = 0; i < mNumOfTestCases; i++) {
            
            accts.add(new Account(Name='Test', Match_Billing_Address__c=true));

        }
        for (Integer i = 0; i < mNumOfTestCases; i++) {
            
            accts.add(new Account(Name='Test', Match_Billing_Address__c=true, BillingPostalCode='11111'));

        }

        insert accts;

    }

    @IsTest
    static void positiveCase(){
        
        List<Account> insertedAccts = [SELECT Id FROM Account WHERE ShippingPostalCode='11111'];

        System.assertEquals(mNumOfTestCases, insertedAccts.size());

        List<Account> willbeUpdated = new List<Account>();

        for (Account acct : [SELECT Id FROM Account WHERE BillingPostalCode!='11111']) {
            
            acct.BillingPostalCode = '11111';
            willbeUpdated.add(acct);

        }
        
        update willbeUpdated;

        List<Account> totalAccts = [SELECT Id FROM Account WHERE ShippingPostalCode='11111'];
        System.assertEquals(mNumOfTestCases*2, totalAccts.size());

    }

}

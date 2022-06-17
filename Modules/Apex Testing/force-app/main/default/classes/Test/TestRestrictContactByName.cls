/**
 * @description       : 
 * @author            : Liam Jeong: dev.liam.jeong@gmail.com
 * @group             : 
 * @last modified on  : 2022-06-17
 * @last modified by  : Liam Jeong: dev.liam.jeong@gmail.com
 * Modifications Log
 * Ver   Date         Author                                 Modification
 * 1.0   2022-06-17   Liam Jeong: dev.liam.jeong@gmail.com   Initial Version
**/
@isTest
private class TestRestrictContactByName {
    
   static Integer mNumbOfTestcases = 200;

   @IsTest
   static void positiveCase(){
    
        String invalidName ='INVALIDNAME';

        List<Contact> cons = new List<Contact>();

        for (Integer i = 0; i < mNumbOfTestcases; i++) {
            
            cons.add(new Contact(LastName=invalidName));

        }

        try {

            insert cons;

        } catch (Exception e) {
            
            System.assertEquals('The Last Name "' + invalidName + '" is not allowed for DML', 
                                e.getDmlMessage(0),
                                'The expected error message.');

        }
    
   }

}

/**
 * @description       : To test VerifyDate.cls
 * @author            : Liam Jeong: dev.liam.jeong@gmail.com
 * @group             : 
 * @last modified on  : 2022-06-17
 * @last modified by  : Liam Jeong: dev.liam.jeong@gmail.com
 * Modifications Log
 * Ver   Date         Author                                 Modification
 * 1.0   2022-06-17   Liam Jeong: dev.liam.jeong@gmail.com   Initial Version
**/
@isTest
private class TestVerifyDate {
    
    @IsTest
    static void testCases(){
        
        Date date1 = Date.newInstance(2022, 7, 1);
        Date date2 = Date.newInstance(2022, 7, 20);

        // DateWithin30Days true case
        System.assertEquals(date2, 
                            VerifyDate.CheckDates(date1, date2), 
                            'DateWithin30Days returned true');
        
        // DateWithin30Days true case since date1 is later than date2
        date1 = date1.addDays(25);
        System.assertEquals(Date.newInstance(2022, 7, 31), 
                            VerifyDate.CheckDates(date1, date2),
                            'DateWithin30Days returned true & SetEndOfMonthDate works well');

        // DateWithin30Days true case since the gap between date1 and date2 is less than 30 days.
        date1 = date1.addDays(-10);
        System.assertEquals(Date.newInstance(2022, 7, 31), 
                            VerifyDate.CheckDates(date1, date2),
                            'DateWithin30Days returned true  & SetEndOfMonthDate works well');
        
    }

}
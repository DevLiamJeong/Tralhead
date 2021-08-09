/**
 *? author: Liam Jeong
 **  contact: dev.liam.jeong@gmail.com
 *? since: 2021-08-08
 *! description:
        positveCase
        negativeCase
        exceptionCase
 */
@isTest
private class TestTaskCreator {
    
    @TestSetup
    static void makeData(){
     
        List<Opportunity> opps = new List<Opportunity>();

        for (Integer i = 0; i < 10; i++) {
            
            opps.add(new Opportunity(Name='Positive Case', CloseDate=Date.today(), StageName='Prospecting'));
            opps.add(new Opportunity(Name='Positive Case', CloseDate=Date.today(), StageName='Closed Won'));

            opps.add(new Opportunity(Name='Negative Case', CloseDate=Date.today(), StageName='Prospecting'));
            opps.add(new Opportunity(Name='Negative Case', CloseDate=Date.today(), StageName='Prospecting'));

        }

        insert opps;
        
    }

    @IsTest
    static void positiveCase(){
        
        Test.startTest();
        
        List<Opportunity> opps = [SELECT Id, Name, StageName FROM Opportunity WHERE Name='Positive Case'];

        System.assertEquals(20, opps.size());

        List<Task> tasks = [SELECT Id FROM Task WHERE WhatId IN :opps];

        System.assertEquals(10, tasks.size());

        Test.stopTest();
        
    }

    @IsTest
    static void negativeCase(){
        
        Test.startTest();
        
        List<Opportunity> opps = [SELECT Id, Name, StageName FROM Opportunity WHERE Name='Negative Case'];

        System.assertEquals(20, opps.size());

        List<Task> tasks = [SELECT Id FROM Task WHERE WhatId IN :opps];

        System.assertNotEquals(10, tasks.size());

        Test.stopTest();
        
    }
    
    @IsTest
    static void exceptionCase(){
        
        Test.startTest();
        
        List<Opportunity> opps = new List<Opportunity>();

        Opportunity opp = new Opportunity(Name='Positive Case', CloseDate=Date.today(), StageName='Closed Won');
        opp.addError('Mock Error');

        opps.add(opp);

        TaskCreator.createFollowUpTask(opps);

        Test.stopTest();
        
    }

}

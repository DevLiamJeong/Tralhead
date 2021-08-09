/**
 *? author: Liam Jeong
 **  contact: dev.liam.jeong@gmail.com
 *? since: 2021-08-08
 *! description:
    Creating flolow-up task if the opportunity's stage is closed won
 */
public with sharing class TaskCreator {
    
    public static void createFollowUpTask(List<Opportunity> opps) {
        
        try {
            
            List<Task> followUpTasks = new List<Task>();

            for (Opportunity opp : opps) {
            
                if (opp.StageName == 'Closed Won') {
                 
                    followUpTasks.add(new Task(Subject='Follow Up Test Task', WhatId=opp.Id));
                    
                }

            }

            Database.SaveResult[] srList = Database.insert(followUpTasks, false);

            for (Database.SaveResult sr : srList) {
                if (sr.isSuccess()) {
                    
                    System.debug('Successfully inserted task. Task ID: ' + sr.getId());

                }
                else {
                            
                    for(Database.Error err : sr.getErrors()) {
                        System.debug('The following error has occurred.');                    
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('Task fields that affected this error: ' + err.getFields());
                    }

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

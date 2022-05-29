/**
 * @author  Liam Jeong
 * @since   2022-05-26
 *? @purpose  To pass Apex Triggers module in the Salesforce Trailhead
 *? @requirement
 **      1. Bulk Apex Triggers
 *          Create a bulkified Apex trigger that adds a follow-up task to an opportunity 
 *          if its stage is Closed Won. Fire the Apex trigger after inserting or updating an opportunity.
 */
public with sharing class OpportunityTriggerHandler {
    //!=========================== MEMBER METHODS ===========================//
    /**
     * @params
     *      List of Opportunities
     *! @description
     *      If the stage is Closed Won,
     *          it creates a Task(Subject='Follow Up Test Task', WhatId=opp.Id).
     */
    static void createFollowUpTasks(List<Opportunity> opps){

        List<Task> followUpTasks = new List<Task>();

        for (Opportunity opp : opps) {
            
            if (opp.StageName == 'Closed Won') {

                Task followUpTask = new Task();

                followUpTask.Subject = 'Follow Up Test Task';
                followUpTask.WhatId = opp.Id;
                followUpTask.Priority = 'Normal';
                followUpTask.Status = 'Not Started';

                followUpTasks.add(followUpTask);
    
            }            

        }

        insert followUpTasks;                

    }
    /**
     * @params
     *      List of Opportunities
     *! @description
     *      If given Opportunity records have associated Account record,
     *          it can't be deleted.
     */
    static void relatedToAccount(List<Opportunity> opps){

        for (Opportunity opp : opps) {
            
            if (opp.AccountId != null) {
                                
                opp.addError('This opportunity CANNOT be deleted since it has  associated Account.\n' +
                             'Please detach the Account record and try again.');

            }

        }

    }
    
    //!=========================== TRIGGER METHODS ===========================//
    public static void beforeDelete(Map<Id, Opportunity> triggerOldMap){
        
        relatedToAccount(triggerOldMap.values());

    }
    public static void afterInsert(Map<Id, Opportunity> triggerNewMap){        
                
        createFollowUpTasks(triggerNewMap.values());

    }
    public static void afterUpate(Map<Id, Opportunity> triggerNewMap){        

        createFollowUpTasks(triggerNewMap.values());

    }

}

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
    /**
     *? @params
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
    public static void afterInsert(Map<Id, Opportunity> oppsById){        
        
        System.debug('afterInsert(Trigger Handler): ' + oppsById.size());
        createFollowUpTasks(oppsById.values());

    }
    public static void afterUpate(Map<Id, Opportunity> oppsById){        

        System.debug('afterUpate(Trigger Handler): ' + oppsById.size());
        createFollowUpTasks(oppsById.values());

    }

}

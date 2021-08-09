/**
 *? author: Liam Jeong
 **  contact: dev.liam.jeong@gmail.com
 *? since: 2021-08-08
 *! requirements:
 * Object: Opportunity
 * Events: after insert and after update
 * Condition: Stage is Closed Won
 * Operation: Create a task
 *                      Subject: Follow Up Test Task
 *                      WhatId = the opportunity ID (associates the task with the opportunity)
 *  Bulkify the trigger so that it can insert or update 200 or more opportunities
 * 
 */
trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
        
        TaskCreator.createFollowUpTask(Trigger.new);

    }

}
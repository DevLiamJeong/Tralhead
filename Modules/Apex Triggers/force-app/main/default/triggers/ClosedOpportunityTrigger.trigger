/**
 * @author  Liam Jeong
 * @since   2022-05-26
 *? @purpose  To pass Apex Triggers module in the Salesforce Trailhead
 *? @requirement
 **      1. Bulk Apex Triggers
 *          Create a bulkified Apex trigger that adds a follow-up task to an opportunity 
 *          if its stage is Closed Won. Fire the Apex trigger after inserting or updating an opportunity.
 */
trigger ClosedOpportunityTrigger on Opportunity (after insert, after update
                                                //before insert, before update,before delete, after delete, after undelete
                                                ) {

    switch on Trigger.OperationType {

        when  BEFORE_INSERT{            

        }
        when  BEFORE_UPDATE{                        

        }        
        when  BEFORE_DELETE{
            
        }
        when  AFTER_INSERT{
            System.debug('AFTER_INSERT');
            OpportunityTriggerHandler.afterInsert(Trigger.newMap);
        }
        when  AFTER_UPDATE{
            System.debug('AFTER_UPDATE');
            OpportunityTriggerHandler.afterUpate(Trigger.newMap);
        }
        when  AFTER_DELETE{
            
        }
        when  AFTER_UNDELETE{
            
        }

    }

}
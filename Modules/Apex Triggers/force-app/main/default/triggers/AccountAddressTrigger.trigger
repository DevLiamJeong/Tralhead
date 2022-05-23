/**
 * @author  Liam Jeong
 * @since   2022-05-23
 ** @purpose  To pass Apex Triggers module in the Salesforce Trailhead
 ** @requirement
 **      1. Get Started with Apex Triggers
 *          Create an Apex trigger that sets an account’s Shipping Postal Code to match the Billing Postal Code 
 *          if the Match Billing Address option is selected. 
 *          Fire the trigger before inserting an account or updating an account.
 */
trigger AccountAddressTrigger on Account (before insert, before update
                                         //,before delete, after insert, after update, after delete, after undelete
) { 

    switch on Trigger.OperationType {
        when  BEFORE_INSERT{

            system.debug('Before Insert: ' + Trigger.new.size());            
            AccountTriggerHandler.beforeInsert(Trigger.new);

        }
        when  BEFORE_UPDATE{

            system.debug('Before Update: ' + Trigger.new);
            AccountTriggerHandler.beforeUpate(Trigger.new);            

        }        
        when  BEFORE_DELETE{
            
        }
        when  AFTER_INSERT{
            
        }
        when  AFTER_UPDATE{
            
        }
        when  AFTER_DELETE{
            
        }
        when  AFTER_UNDELETE{
            
        }        
    }

}
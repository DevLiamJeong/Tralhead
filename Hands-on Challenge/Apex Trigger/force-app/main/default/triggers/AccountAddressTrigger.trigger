/**
 *? author: Liam Jeong
 **  contact: dev.liam.jeong@gmail.com
 *? since: 2021-08-08
 *! requirement: 
    * Object: Account
    * Events: before insert and before update
    * Condition: Match Billing Address is true
    *  Operation: set the Shipping Postal Code to match the Billing Postal Code
 */

trigger AccountAddressTrigger on Account (before insert, before update) {

    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
        
        AddressMatcher.setAddress(Trigger.new);

    }

}
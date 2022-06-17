// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class WorkThanks {
    global Id Id;
    global SObject Owner;
    global Id OwnerId;
    global Boolean IsDeleted;
    global Datetime CreatedDate;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime LastModifiedDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime SystemModstamp;
    global User Giver;
    global Id GiverId;
    global String Message;
    global FeedItem FeedItem;
    global Id FeedItemId;
    global List<WorkBadge> Badges;
    global List<WorkThanksShare> Shares;
    global List<AccountFeed> RelatedRecord;

    global WorkThanks () 
    {
    }
}
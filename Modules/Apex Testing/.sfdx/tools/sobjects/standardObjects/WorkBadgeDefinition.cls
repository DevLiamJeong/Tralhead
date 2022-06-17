// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class WorkBadgeDefinition {
    global Id Id;
    global SObject Owner;
    global Id OwnerId;
    global Boolean IsDeleted;
    global String Name;
    global Datetime CreatedDate;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime LastModifiedDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime SystemModstamp;
    global Datetime LastViewedDate;
    global Datetime LastReferencedDate;
    global Boolean IsCompanyWide;
    global String Description;
    global String ImageUrl;
    global Boolean IsActive;
    global Integer LimitNumber;
    global Boolean IsLimitPerUser;
    global Date LimitStartDate;
    global Integer GivenBadgeCount;
    global Boolean IsRewardBadge;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<WorkAccess> WorkAccesses;
    global List<WorkBadge> Badges;
    global List<WorkBadgeDefinitionFeed> Feeds;
    global List<WorkBadgeDefinitionHistory> Histories;
    global List<WorkBadgeDefinitionShare> Shares;
    global List<ContentVersion> FirstPublishLocation;
    global List<FeedComment> Parent;
    global List<FlowRecordRelation> RelatedRecord;

    global WorkBadgeDefinition () 
    {
    }
}
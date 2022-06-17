// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class AssociatedLocation {
    global Id Id;
    global Boolean IsDeleted;
    global String AssociatedLocationNumber;
    global Datetime CreatedDate;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime LastModifiedDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime SystemModstamp;
    global Datetime LastViewedDate;
    global Datetime LastReferencedDate;
    global Account ParentRecord;
    global Id ParentRecordId;
    global Location Location;
    global Id LocationId;
    global String Type;
    global Datetime ActiveFrom;
    global Datetime ActiveTo;
    global List<AssociatedLocationHistory> Histories;
    global List<RecordAction> RecordActions;
    global List<RecordActionHistory> RecordActionHistories;
    global List<FlowRecordRelation> RelatedRecord;

    global AssociatedLocation () 
    {
    }
}
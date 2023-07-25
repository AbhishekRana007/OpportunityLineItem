trigger OpportunityLineItemTrigger on OpportunityLineItem(before insert, after insert, before delete ){

    TriggerFactory.initiateHandler(OpportunityLineItem.sObjectType);
}
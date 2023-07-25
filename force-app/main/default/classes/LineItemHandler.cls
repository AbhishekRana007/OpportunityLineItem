public with sharing class LineItemHandler implements ITrigger,database.stateful{
    map<id, AggregateResult> LineItemOldData = new map<id, AggregateResult>();
    map<id, Decimal> DeletedData = new map<id, Decimal>();
    public void bulkBefore(){

        /*if (Trigger.isDelete){


            Set<id> Ids = new Set<id>();
            list<OpportunityLineItem> LineItems = trigger.old;
            for (OpportunityLineItem oo : LineItems){
                Ids.add(oo.OpportunityId);
            }
            List<AggregateResult> opportunitiesAscending = [SELECT max(serial_no__c)counter, OpportunityId
                                                            FROM OpportunityLineItem
                                                            where OpportunityId in:Ids
                                                            group by OpportunityId];
            for (AggregateResult Aggri : opportunitiesAscending){
                DeletedData.put((id) Aggri.get('OpportunityId'), (Decimal) Aggri.get('counter'));
                system.debug(DeletedData + ' ' + 'is the datat');
            }

            LineItemHelper.deleteer(DeletedData);
        }*/
        if (trigger.isInsert){

            Set<id> Ids = new Set<id>();
            list<OpportunityLineItem> LineItems = trigger.new;
            for (OpportunityLineItem oo : LineItems){
                Ids.add(oo.OpportunityId);
            }
            List<AggregateResult> opportunitiesAscending = [SELECT max(serial_no__c)counter, OpportunityId
                                                            FROM OpportunityLineItem
                                                            where OpportunityId in:Ids
                                                            group by OpportunityId];
            for (AggregateResult Aggri : opportunitiesAscending){
                LineItemOldData.put((id) Aggri.get('OpportunityId'), Aggri);
            }

            LineItemHelper.LineItemMatcher(trigger.new, LineItemOldData);
        }
        system.debug('--- bulkbEfore is  called Agriculture');
    }

    public void bulkAfter(){

        system.debug('--- bulkAfter is  called Agriculture');
    }

    public void beforeInsert(SObject so){
        system.debug('--- beforeInsert is  called Agriculture');
    }

    public void beforeUpdate(SObject oldSo, SObject so){
        system.debug('--- beforeUpdate is  called Agriculture');
    }

    public void beforeDelete(SObject so){
        system.debug('--- beforeDelete is  called Agriculture');
    }

    public void afterInsert(sObject so){
    }

    public void afterUpdate(SObject oldSo, SObject so){

        system.debug('--- afterUpdate is  called Agriculture');
    }

    public void afterDelete(SObject so){
        system.debug('--- afterDelete is  called Agriculture');
    }

    public void andFinally(){

        system.debug('--- andFinally  called Agriculture');
    }

}
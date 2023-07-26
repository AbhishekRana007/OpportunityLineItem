public with sharing class LineItemHelper implements Database.Stateful{
    Private static map<id, Decimal> DeletedData1;
    Public static void deleteer(map<id, Decimal> DeletedData){
        DeletedData1 = DeletedData;
        System.debug(DeletedData1);
    }

    public static void LineItemMatcher(LIST<OpportunityLineItem> AlllineItem, map<id, Decimal> LineItemOldData){
        System.debug(DeletedData1);
        for (OpportunityLineItem opplineitem : AlllineItem){
            LIST<OpportunityLineItem> Bunch = new List<OpportunityLineItem>();
            for (OpportunityLineItem opplineitem1 : AlllineItem){
                if (opplineitem.OpportunityId == opplineitem1.OpportunityId){
                    Bunch.add(opplineitem1);
                }
            }
            Decimal x = 1;


            for (OpportunityLineItem ccs : Bunch){
                /* if ((Decimal) LineItemOldData.get(ccs.OpportunityId).get('counter') < (Decimal) DeletedData1.get(ccs.OpportunityId) && !DeletedData1.isEmpty() && DeletedData1.containsKey(ccs.OpportunityId)){
                 ccs.Serial_no__c = (Decimal) DeletedData1.get(ccs.OpportunityId) + x;
                 } else{
                 ccs.Serial_no__c = (Decimal) LineItemOldData.get(ccs.OpportunityId).get('counter') + x;
                 }*/
                ccs.Serial_no__c = (Decimal) LineItemOldData.get(ccs.OpportunityId) + x;
                x++;
            }

        }
    }

}
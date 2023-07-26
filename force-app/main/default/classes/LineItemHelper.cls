public with sharing class LineItemHelper implements Database.Stateful{
    public static void LineItemMatcher(LIST<OpportunityLineItem> AlllineItem, map<id, Decimal> LineItemOldData){
        for (OpportunityLineItem opplineitem : AlllineItem){

            LIST<OpportunityLineItem> Bunch = new List<OpportunityLineItem>();
            for (OpportunityLineItem opplineitem1 : AlllineItem){

                if (opplineitem.OpportunityId == opplineitem1.OpportunityId){
                    Bunch.add(opplineitem1);
                }
            }
            System.debug(Bunch.Size());
            Decimal x = 1;


            for (OpportunityLineItem ccs : Bunch){

                if (!LineItemOldData.isEmpty()){

                    ccs.Serial_no__c = (Decimal) LineItemOldData.get(ccs.OpportunityId) + x;

                } else{

                    ccs.Serial_no__c = x;

                }
                x++;
            }

        }
    }

}
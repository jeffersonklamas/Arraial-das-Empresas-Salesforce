/**
Se voltar para prospecção, todos os itens da festa serão excluídos.
Falta, criar o processo para excluir a Quadrilha personalizada.
 */

// Vai para o arquivo OpportunityTriggerHandler

public class ApagarItensFestaSeVoltaProspeccao {
    private List<Opportunity> newList;
    private Map<id, Opportunity> oldMap;
    // private Map<id, Opportunity> mapItensFiltered = new Map <id, Opportunity>();
    public List<Item_Festa__c> itensParaApagar = new List<Item_Festa__c>();

    public ApagarItensFestaSeVoltaProspeccao(List<Opportunity> lstItensNew, Map<id, Opportunity> mapDataOld) {
        this.newList = lstItensNew;
        this.oldMap = mapDataOld;
        filter();
    }

    private void filter(){
        Map<id, Item_Festa__c> mapItensFesta = new Map<Id, Item_Festa__c>([SELECT id, item__C, Oportunidade__c, item__r.Name FROM Item_Festa__c]);
        System.debug('Items da Festa' + mapItensFesta);
        for(Opportunity itemOpp : newList){
            if((itemOpp.StageName != OldMap.get(itemOpp.id).StageName) && 
                (OldMap.get(itemOpp.id).StageName != 'Prospecção' &&
                    itemOpp.StageName == 'Prospecção')){
                        System.debug('Dentro do If do Stage Name');
                for(Item_Festa__c itemDaFesta : mapItensFesta.values()){
                    if(itemDaFesta.Oportunidade__c == itemOpp.Id){
                        // mapItensFiltered.put(itemDaFesta.id, itemDaFesta);
                        itensParaApagar.add(itemDaFesta);
                        // System.debug('mapItensFiltered' + mapItensFiltered);
                    }
                }
            }
        }
    }

    public void run(){
        if(!itensParaApagar.isEmpty()){
            delete itensParaApagar;
        }
    }     
}
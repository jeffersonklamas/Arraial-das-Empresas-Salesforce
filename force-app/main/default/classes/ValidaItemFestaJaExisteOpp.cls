/**
Verifica se o item a ser cadastrado já existe na Opp, se sim, exibe 
a mensagem de que o item já foi cadastrado
 */

public class ValidaItemFestaJaExisteOpp {
    private List<Item_Festa__c> newList;
    private Map<id, Item_Festa__c> oldMap;
    private Map<id, Item_Festa__c> mapItensFiltered = new Map <id, Item_Festa__c>();

    public ValidaItemFestaJaExisteOpp(List<Item_Festa__c> lstItensNew, Map<id, Item_Festa__c> mapDataOld){
        this.newList = lstItensNew;
        this.oldMap = mapDataOld;
        filter();
    }

    private void filter(){
        Map<id, Item_Festa__c> mapItensFesta = new Map<Id, Item_Festa__c>([SELECT id, item__c, Oportunidade__c, Item__r.Name FROM Item_Festa__c]);
            for(Item_Festa__c itemNaBase : mapItensFesta.Values()){
                for(Item_Festa__c itemQueIreiCadastrar : newList){
                    if(itemQueIreiCadastrar.Oportunidade__c == itemNaBase.Oportunidade__c && 
                        itemQueIreiCadastrar.item__c == itemNaBase.item__c){
                    mapItensFiltered.put(itemQueIreiCadastrar.id, itemQueIreiCadastrar);
                }
            }
        }
    }

    public void run(){
        if (!mapItensFiltered.isEmpty()){
            for(Item_Festa__c item : mapItensFiltered.values()){
                item.addError('Você já cadastrou este item.');
            }
        }
    }
}
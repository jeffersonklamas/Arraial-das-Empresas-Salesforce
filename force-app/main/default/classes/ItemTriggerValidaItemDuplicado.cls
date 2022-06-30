public with sharing class ItemTriggerValidaItemDuplicado {

    private List<Item_Festa__C> m_lstDataNew;
    private Map<Id, Item_Festa__C>  m_mapDataOld;
    private Map<Id, Item_Festa__C> m_mapObjFiltered = new Map<Id, Item_Festa__c>();

    Set<Id> oppIds = new Set<Id>();

    public ItemTriggerValidaItemDuplicado(List<Item_Festa__c> lstDataNew, Map<Id, Item_Festa__c> mapDataOld) {
        this.m_lstDataNew = lstDataNew;
        this.m_mapDataOld = mapDataOld;
        filter(); 
    }

    private void getOpps(){
        for (Item_Festa__c itemNew : m_lstDataNew){
            oppIds.add(itemNew.Oportunidade__c);
        }
    }

    private void filter(){
        getOpps();

        List<Item_Festa__c> itensInseridos = [SELECT Id, Oportunidade__c, Item__c FROM Item_Festa__c WHERE  Oportunidade__c in : oppIds];
        
        if(!itensInseridos.isEmpty()){
            Set<String> setItensInseridos = new Set<String>();
            for(Item_festa__c itemFesta : itensInseridos){
                setItensInseridos.add(itemFesta.Oportunidade__c+'-'+itemFesta.Item__c );
            }

            for(Item_Festa__c itemNew : m_lstDataNew){
                String key = itemNew.Oportunidade__c+'-'+itemNew.Item__c;
                if(setItensInseridos.contains(key)){
                    m_mapObjFiltered.put(itemNew.Id, itemNew);
                }
            }
        }
    }

    public void run(){
        if(m_mapObjFiltered.isEmpty()){
            for(Item_Festa__C itemFesta : m_mapObjFiltered.values()){
                itemFesta.addError('Item já incluído Anteriormente, Favor Verificar ou  inclua outro!');
            }
        }
    }
}
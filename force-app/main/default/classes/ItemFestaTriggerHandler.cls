/**
Verifica se o item a ser cadastrado já existe na Opp, se sim, exibe 
a mensagem de que o item já foi cadastrado
 */
 
public class ItemFestaTriggerHandler extends TriggerHandler {    

    private List<Item_Festa__c> newList;
    private List<Item_Festa__c> oldList;
    private Map<id, Item_Festa__c> newMap;
    private Map<id, Item_Festa__c> oldMap;
    
    public itemFestaTriggerHandler() {
        this.newList = (List<Item_Festa__c>) Trigger.new;
        this.oldList = (List<Item_Festa__c>) Trigger.old;
        this.newMap = (Map<id, Item_Festa__c>) Trigger.newMap;
        this.oldMap = (Map<id, Item_Festa__c>) Trigger.oldMap;
    }

    protected override void beforeInsert(){
        new ValidaItemFestaJaExisteOpp(newList, oldMap).run(); 
    }
}
/**
Se voltar para prospecção, todos os itens da festa serão excluídos.
Falta, criar o processo para excluir a Quadrilha personalizada.
 */

// Vincula com o ApagarItensFestaSeVoltaProspeccao
// E start no arquivo OpportunityTrigger.triggers em Triggers.

public class OpportunityTriggerHandler extends TriggerHandler{
    private List<Opportunity> newList;
    private List<Opportunity> oldList;
    private Map<id, Opportunity> newMap;
    private Map<id, Opportunity> oldMap;

    public OpportunityTriggerHandler() {
        this.newList = (List<Opportunity>) Trigger.new;
        this.oldList = (List<Opportunity>) Trigger.old;
        this.newMap = (Map<id, Opportunity>) Trigger.newMap;
        this.oldMap = (Map<id, Opportunity>) Trigger.oldMap;
    }

    protected override void afterUpdate(){
        new ApagarItensFestaSeVoltaProspeccao(newList, oldMap).run(); 
    }
}
/**
Se voltar para prospecção, todos os itens da festa serão excluídos.
Falta, criar o processo para excluir a Quadrilha personalizada.
 */
 
// Esse é o que start a ação na Org.
// Sequência de arquivos:
// Criar a Classe princicpal: neste caso foi a classe ApagarItensFestaSeVoltaProspeccao,
// Criar a Classe de apoio OpportunityTriggerHandler e vincula o ApagarItensFestaSeVoltaProspeccao


trigger OpportunityTrigger on Opportunity (before insert, after insert, before update, after update, before delete) {
   new OpportunityTriggerHandler().run();
}
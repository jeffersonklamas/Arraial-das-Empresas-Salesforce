/**
Verifica se o item a ser cadastrado já existe na Opp, se sim, exibe 
a mensagem de que o item já foi cadastrado
 */

trigger ItemFestaTrigger on Item_Festa__c (before insert, after insert, 
                                            before update, after update, before delete, after undelete) {
  new ItemFestaTriggerHandler().run();
}
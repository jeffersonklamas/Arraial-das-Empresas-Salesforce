trigger OpportunityTrigger on Opportunity (before update, after update) {
    	
    //1 - Validação quando preenchido forma de pagamento crédito parcelado e numero de parcelas NULL e maior que 1.
    //1.1 - Verificar se campo forma de pagamento esta setado como crésito paracelado.
    //1.2 - Se sim, Verificar se o número de parcelas é igual NULL e maior que 1
    //1.3 - Campos Forma_de_Pagamento__c, Numero_de_Parcelas__c
    //
    //2 - Criar Tarefa quando encerrar a oportunidade como Fechado/Ganho com o Titulo "Acompanhar Festa"
    //2.1 - Verificar se a oportunidade está setada como Fechado/Ganho
    //2.2 - Se sim, Criar tarefa com o Título "Acompanhar Festa"
    //2.3 - Campos: StageName, Tasks, 
    
    List<Opportunity> festasOld = (List<Opportunity>) Trigger.old;
    List<Opportunity> festasNew = (List<Opportunity>) Trigger.new; 
    Map<Id,Opportunity> festasOldMap = (Map<Id,Opportunity>) Trigger.oldMap;
    Map<Id,Opportunity> festasNewMap = (Map<Id,Opportunity>) Trigger.newMap;
    
    iF (Trigger.isInsert){
        if (Trigger.isBefore) {
            
    	
    }else{//after
        
    }
    
}
}
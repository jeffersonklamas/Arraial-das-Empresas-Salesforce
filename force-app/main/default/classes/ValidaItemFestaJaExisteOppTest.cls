@isTest(SeeAllData=false)
public with sharing class ValidaItemFestaJaExisteOppTest {
    
    @TestSetup
    static void setup(){
        // Adiciona contato como responsável pela festa
        Contact contato = new Contact(FirstName = 'Zeca',
                                        LastName = 'do Jão');
        insert contato;
        
        // Adicona Opop na Org
        Opportunity opp = new Opportunity(
            Name = 'Vai Dançar e Cantar',
            StageName = 'Prospecção',
            CloseDate = System.today().addDays(10),  // Date.newInstance(2022, 7, 7),
            Data_Inicio_da_Festa__c =  System.now().addDays(1),  // datatime.newInstance(2022, 7, 7, 18, 00, 0), 
            Data_Fim_da_Festa__c = System.now().addDays(1).addHours(4),  // datatime.newInstance(2022, 7, 7, 22, 00, 0),
            Responsavel_pela_Festa__c = contato.Id,
            Limite_Orcamento__c = 50000
        );
        insert opp;

        // Adicionando o itens no Objeto Item
        List<Item__c> itens = new List<Item__c>();
        for (Integer i = 0; i < 5 ; i++){
            Item__c itemAdicionar = new Item__c(Name = 'Barraca ' + 1);
            itens.add(itemAdicionar);
        }
        insert itens;
    }
    @isTest(SeeAllData=false)
    static void testaCadastroNoItemFesta(){ 
        Map<id, Item__c> itemMap = new Map<Id, Item__c>([SELECT Id FROM Item__c LIMIT 5]);
        Opportunity opp = [SELECT Name FROM Opportunity LIMIT 5];

        // Add registros no Item Festas
        List<Item_Festa__c> listItensParaAdicionar = new List<Item_Festa__c>();
        for (Item__c i : itemMap.values()){
            // Cadastra Itemfesta
            Item_Festa__c itemFestA = new Item_Festa__c(Item__c = i.id, Oportunidade__c = opp.id);
            listItensParaAdicionar.add(itemFestA);
        }
        insert listItensParaAdicionar;

        Item_Festa__c registroItemFesta = [SELECT Item__c, item__r.Name, Oportunidade__c FROM Item_Festa__c WHERE item__r.Name = 'Barraca 1'];
        Item_Festa__c itemFestaRepetido = new Item_Festa__c(Item__c = registroItemFesta.Item__c, Oportunidade__c = opp.id);
        Database.SaveResult resultadoTest = Database.insert(itemFestaRepetido, false);

        for (Database.Error err : resultadoTest.getErrors()){
            System.assertEquals('Você já cadastrou este item.', err.getMessage());
        }
    }
}
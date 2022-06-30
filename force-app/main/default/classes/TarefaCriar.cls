public class TarefaCriar {
	@InvocableMethod
    public static void criarTarefaLigacaoResponsavelQuadrilha(List<Opportunity> festas){
        // System.debug('TarefaCriar Inicio');

        List<Task> tarefas = new List<Task>();
        if(!festas.isEmpty()){
            // System.debug('TarefaCriar Verificando se há tarefa');
            for(Opportunity festa : festas){
                if(festa.Responsavel_pela_Quadrilha__c != null){
                    Task tarefa = new Task();
                    tarefa.WhatId = festa.Id;
                    tarefa.WhoId = festa.Responsavel_pela_Quadrilha__c;
                    tarefa.Subject = 'Ligar para Responsável da Quadrilha';
                    tarefa.Description = 'Esta mesagem é gerada automática quando a Festa é aprovada e possuir Quadrilha Personalizada. Entar em contato com o Responsável pela Quadrilha para verificar detalhes e disponibilidade para ensaios.';
                    tarefa.Status = 'Not Started';
                    tarefa.Priority = 'Normal';
                    tarefa.OwnerId = festa.OwnerId;
                    tarefas.add(tarefa); 
                }
            }
            // System.debug('TarefaCriar Criando a Tarefa');
            insert tarefas;
        }
    }
}
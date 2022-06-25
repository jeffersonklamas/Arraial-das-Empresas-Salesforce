public class TarefaQuadrilhaCriar {
    @InvocableMethod(label='Cria tarefa ligação do responsável pela Quadrilha' description='Método para criar tarefa para as oportunidades que possuem Quadrilha Personalizada para ligar aos Responsáveis')
    public static List criarTarefaLigacaoResponsavelQuadrilha(List<Opportunity> festas){
        System.debug('TarefaQuadrilhaCriar Inicio');

        List<Task> tarefas = new List<Task>();
        if(!tarefas.isEmpty()){
            System.debug('TarefaQuadrilhaCriar Verificando se há tarefa');
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
            System.debug('TarefaQuadrilhaCriar Criando a Tarefa');
           insert tarefas;
        }
    }
}
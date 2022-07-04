public with sharing class ArrayExempl {
    public static void  myResult(){
        List<String> lstCases = new List<String>();

        lstCases.add('Valor 1');
        lstCases.add('Valor 2');

        // Buscando os valores contidos na lista

        for (integer i = 0; i < lstCases.size(); i++){
            System.debug('Lista posição ' + i + ': ' +  lstCases.size[i]);
        }
    }
}
#!/bin/bash

# DATA_REF=$(date +"%m-%d-%Y" -d "now -1 day")
DATA_REF=$(date +"%m-%d-%Y")

echo -e "\nCapturando dados de: $DATA_REF\n"

NOME_ARQUIVO="cotacao_dolar.txt"

curl "https://olinda.bcb.gov.br/olinda/servico/PTAX/versao/v1/odata/"`
`"CotacaoDolarDia(dataCotacao=@dataCotacao)?@dataCotacao='$DATA_REF'"`
`"&$top=100&$skip=0&$format=json&$select=cotacaoCompra,cotacaoVenda,dataHoraCotacao" > $NOME_ARQUIVO

echo -e "\nConteudo gerado no arquivo 'cotacao_dolar.txt':\n"

cat $NOME_ARQUIVO
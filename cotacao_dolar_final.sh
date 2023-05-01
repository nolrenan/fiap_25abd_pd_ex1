#!/bin/bash

# Extração de dados da API
#DATA_REF=$(date +"%m-%d-%Y" -d "now -4 day")

DATA_REF=$(date +"%m-%d-%Y")

echo -e "\nCapturando dados de: $DATA_REF\n"

NOME_ARQUIVO="cotacao_dolar.txt"

curl "https://olinda.bcb.gov.br/olinda/servico/PTAX/versao/v1/odata/"`
`"CotacaoDolarDia(dataCotacao=@dataCotacao)?@dataCotacao='$DATA_REF'"`
`'&$top=100&$skip=0&$format=json&$select=cotacaoCompra,cotacaoVenda,dataHoraCotacao' > $NOME_ARQUIVO

echo -e "\nConteudo gerado no arquivo 'cotacao_dolar.txt':"

cat $NOME_ARQUIVO

# Salvando dados no HDFS
data_cotacao=$(date '+%Y-%m-%d')
export TZ=America/Sao_Paulo
hora_extracao=$(date '+%Hh%M')

echo '\nCriando estrutura de pastas'
criar_pasta="hadoop fs -mkdir -p /dolar_dia/${data_cotacao}/"
$criar_pasta
echo "Salvando cotação do dia: ${data_cotacao}"
comando="hadoop fs -put cotacao_dolar.txt /dolar_dia/${data_cotacao}/cotacao_dolar_${hora_extracao}.txt"
$comando
data_cotacao=$(date '+%Y-%m-%d')
export TZ=America/Sao_Paulo
hora_extracao=$(date '+%Hh%M')

echo 'Criando estrutura de pastas'
criar_pasta="hadoop fs -mkdir -p /dolar_dia/${data_cotacao}/"
$criar_pasta
echo "Salvando cotação do dia: ${data_cotacao}"
comando="hadoop fs -put cotacao_dolar.txt /dolar_dia/${data_cotacao}/cotacao_dolar_${hora_extracao}.txt"
$comando

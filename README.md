# <b>Ingestão de dados para HDFS</b>
> MBA Engenharia de Dados FIAP | Turma 25ABD <br>
Repositório para projeto do exercício 1 da matéria de <b>processamento e armazenamento distribuído de dados</b> do MBA de Engenharia de Dados.

### <b>1. Base de dados</b>
Utilizamos como fonte de dados pública para o projeto a API de cotação do dólar comercial (venda e compra) disponibilizada pelo Banco Central do Brasil.
As informações referentes à base podem ser encontradas através do seguitne link:

'''
https://dadosabertos.bcb.gov.br/dataset/dolar-americano-usd-todos-os-boletins-diarios
'''

### <b>2. Desenvolvimento</b>
Para possibiliar a execução das aplicações dentro do ambiente de bigdata fornecido, foram desenvolvidos 3 scripts em shell (.sh):
- <b>cotacao_dolar_final.sh</b>: realiza a captura dos dados e armazenamento do conteúdo no HDFS, sem realizar qualquer tipo de tratamento na resposta recebida pela API.
- <b>script_bkp_dolar_dia.sh</b>: geração de backup do dado ingerido.
- <b>script_retencao.sh</b>: gerencia a quantidade de dados que serão retidos no backup, ou seja, faz o expurgo dos dados mais antigos armazenados no backup.

O ambiente de Big Data pode ser encontrado no seguinte repositório:

'''
https://github.com/fabiogjardim/bigdata_docker
'''

### <b>3. Arquitetura de pastas do HDFS</b>
Devido a base em estudo se tratar de cotação diária de compra e venda de dólar, a distribuição do file system foi realizada em dois dois nívels: data da cotação e horário da cotação.

Exemplo:


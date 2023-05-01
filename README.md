# <b>Ingestão de dados para HDFS</b>
> MBA Engenharia de Dados FIAP | Turma 25ABD <br>
Repositório para projeto do exercício 1 da matéria de <b>processamento e armazenamento distribuído de dados</b> do MBA de Engenharia de Dados.

### <b>1. Base de dados</b>
Utilizamos como fonte de dados pública para o projeto a API de cotação do dólar comercial (venda e compra) disponibilizada pelo Banco Central do Brasil.
As informações referentes à base podem ser encontradas através do seguinte link:
- https://dadosabertos.bcb.gov.br/dataset/dolar-americano-usd-todos-os-boletins-diarios

### <b>2. Arquitetura de pastas do HDFS</b>
Devido a base em estudo se tratar de cotação diária de compra e venda de dólar, a distribuição do file system foi realizada por data da cotação e cada arquivo desta data é ingerido dentro da pasta respeitando a estrutura "cotacao_dolar_hh_mm.txt".

Exemplo:

Cotação do dólar capturada às 10h40 do dia 28/04/2023
- Caminho do arquivo: /dolar_dia/2023-04-28/cotacao_dolar_10h40.txt

A informação de horário presente no nome do arquivo ingerido foi implementada para que todas as cotações capturadas de um mesmo dia sejam armazenadas. Desta forma, o processo permite alterações de periodicidade sem a necessidade de manutenção no processo.

### <b>3. Implantação de forma manual</b>
[INSERCAO DE PRINTS]

### <b>4. Desenvolvimento semi-automatizado</b>
Para possibiliar a execução das aplicações dentro do ambiente de big data fornecido, foram desenvolvidos 3 scripts em shell (.sh):
- <b>Step 1 - cotacao_dolar_final.sh</b>: realiza a captura dos dados e armazenamento do conteúdo no HDFS, sem realizar qualquer tipo de tratamento na resposta recebida pela API.
- <b>Step 2 - script_bkp_dolar_dia.sh</b>: geração de backup do dado ingerido para a pasta dolar_dia_bkp.
- <b>Step 3 - script_retencao.sh</b>: gerencia a quantidade de dados que serão retidos no backup, ou seja, faz o expurgo dos dados mais antigos armazenados no backup. Este script tem como recebimento 1 argumento referente a pasta que será realizada a retenção. 
- Ex.: <i>bash ./script_retencao.sh <b>dolar_dia</b></i> ou <i>bash ./script_retencao.sh <b>dolar_dia_bkp</b></i> 

O ambiente de Big Data pode ser encontrado no seguinte repositório:
- https://github.com/fabiogjardim/bigdata_docker

Screenshots da execução dos scripts:

- cotacao_dolar_final.sh

[INSERIR IMAGENS]

#### script_bkp_dolar_dia.sh
- <b>Step 1</b>: Após simulação da inserção da data do dia 2023-05-01, a pasta é criada com o arquivo da cotação
![image](https://github.com/nolrenan/fiap_25abd_pd_ex1/blob/main/prints/backup/backup_1.png)
![image](https://github.com/nolrenan/fiap_25abd_pd_ex1/blob/main/prints/backup/backup_2.png)

- <b>Step 2</b>: "ls" da pasta dolar_dia_bkp antes da execução do script (inexistência da pasta do dia 2023-05-01)
![image](https://github.com/nolrenan/fiap_25abd_pd_ex1/blob/main/prints/backup/backup_3.png)

- <b>Step 3</b>: Execução do script de backup e listagem da pasta de backup após o processamento do script
![image](https://github.com/nolrenan/fiap_25abd_pd_ex1/blob/main/prints/backup/backup_4.png)

#### script_retencao.sh
- <b>Step 1</b>: Listagem dos dados dolar_dia antes da execução
![image](https://github.com/nolrenan/fiap_25abd_pd_ex1/blob/main/prints/retencao/retencao_1.png)
![image](https://github.com/nolrenan/fiap_25abd_pd_ex1/blob/main/prints/retencao/retencao_2.png)

- <b>Step 2</b>: Execução do script de retenção na dolar_dia
![image](https://github.com/nolrenan/fiap_25abd_pd_ex1/blob/main/prints/retencao/retencao_3.png)
![image](https://github.com/nolrenan/fiap_25abd_pd_ex1/blob/main/prints/retencao/retencao_4.png)
![image](https://github.com/nolrenan/fiap_25abd_pd_ex1/blob/main/prints/retencao/retencao_5.png)

- <b>Step 3</b>: Listagem da pasta dolar_dia pós execução do script, mantendo somente os últimos 30 dias mais recentes de pastas/arquivos
![image](https://github.com/nolrenan/fiap_25abd_pd_ex1/blob/main/prints/retencao/retencao_6.png)

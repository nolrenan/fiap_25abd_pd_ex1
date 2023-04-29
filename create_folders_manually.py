import os
from datetime import datetime, timedelta
import requests

# config
diff = 1
if datetime.now().weekday() == 0:
    diff = 3
elif datetime.now().weekday() == 6:
    diff = 2
else :
    diff = 1
d1 = datetime.now() - timedelta(days=diff)
end = datetime.now() - timedelta(days=60)
for i in range(90):
    # Criar Pasta
    mod_date = d1 - timedelta(days=i)
    date_folder = mod_date.strftime('%Y-%m-%d')
    os.mkdir(f'dolar_dia/{date_folder}')
    # Request
    url = "https://olinda.bcb.gov.br/olinda/servico/PTAX/versao/v1/odata/CotacaoDolarDia(dataCotacao=@dataCotacao)?@dataCotacao="+f"'{mod_date.strftime('%m-%d-%Y')}'&$top=100&$skip=0&$format=json&$select=cotacaoCompra,cotacaoVenda,dataHoraCotacao"
    r = requests.get(url, stream=True)
    # Salvar Arquivo
    nm_arq = mod_date.strftime('%Y_%m_%d')
    with open(f'dolar_dia/{date_folder}/cotacao_dolar_{nm_arq}', "wb") as f:
        f.write(r.content)
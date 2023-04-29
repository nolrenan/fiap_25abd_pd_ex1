DATA_REF=$(date +"%Y-%m-%d")
DIRECTORY="/dolar_dia/$DATA_REF"
DIRECTORY_BKP="/dolar_dia_bkp/"


echo $DIRECTORY

hadoop fs -test -d $DIRECTORY
if [ $? != 0 ]
    then
        echo "[ERROR] Diretório não encontrado!"
    else
        echo "Diretório $DIRECTORY encontrado! Realizando backup para $DIRECTORY_BKP"        
        hadoop fs -cp $DIRECTORY $DIRECTORY_BKP
fi
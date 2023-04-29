pasta=$1 #deve receber o argumento da pasta que será feita a retenção histórica ex.: dolar_dia ou dolar_dia_bkp

echo "Realizando retenção histórica dos dados de dolar_dia"
array=()
array+=("hadoop")
array+=("fs")
array+=("-ls")
array+=($pasta/$DATA_REF)

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
do
    DATA_REF=$(date +%Y-%m-%d -d "$i day ago")
    array+=("$pasta/$DATA_REF")
done

# echo ${array[@]}

for d in hadoop fs -ls $pasta/* ; do 
    #echo $d
    if [[ ! "${array[*]}" =~ "${d}" ]]
        then
            # echo $d
            echo "$d > d-30, registro será apagado"
            hadoop fs -rm -r -f /$d
        fi
done
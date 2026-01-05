#!/bin/bash

DIR="/Zanthus/Zeus/pdvJava"
DIR2="/LOG_ECF"

mkdir -p "$DIR"
mkdir -p "$DIR2"

echo "removendo Logs do PDV";
find "$DIR" -type f -name "*.ZL1" -exec rm -f {} +
rm -rf "$DIR2/*"

echo "removendo Logs DMPCliSitef";
rm "$DIR"/CliSiTef.2* &>>/dev/null

echo "removendo AUDIT na pdvJava";
rm "$DIR"/AUDIT* &>>/dev/null

# echo "Para gerar novos LOGs, Habilite nos arquivos CFG editando a linha opcoes=x para opcoes=63 na pasta pdvJava.";

echo "Ativando todos os LOGS"
sed -i -e 's/opcoes=3/opcoes=63/g' -e 's/opcoes=0/opcoes=63/g' -e 's/opcoes=127/opcoes=63/g' -e 's/ATIVO=3/ATIVO=63/g' -e 's/ATIVO=0/ATIVO=63/g' -e 's/ATIVO=127/ATIVO=63/g' "$DIR"/*.CFG

echo "Visualizando o nivel de LOGs dos arquivos"
grep -e 'opcoes' -e 'ATIVO' "$DIR"/*.CFG


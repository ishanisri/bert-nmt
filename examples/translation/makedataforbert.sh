#!/usr/bin/env bash
lng=$1
path=$2
echo "src lng $lng"
for sub  in $2/train $2/valid $2/test
do
    sed -r 's/(@@ )|(@@ ?$)//g' ${sub}.${lng} > ${sub}.bert.${lng}.tok
    mosesdecoder/scripts/tokenizer/detokenizer.perl -l $lng < ${sub}.bert.${lng}.tok > ${sub}.bert.${lng}
    rm ${sub}.bert.${lng}.tok
done

#!/bin/bash

for i in `seq -f %02g 2 8`
do
  url="https://www.metro.tokyo.lg.jp/tosei/hodohappyo/press/2020/$i/index.html"
  #echo $url
  sleep 1
  curl -s $url | xmllint --html --xpath '//a' - | tr ' ' '\n' \
  | grep "新型コロナウイルスに関連した患者の死亡" \
  | sed -e 's/<\/a><a//g' -e 's/href=//g' -e 's/\"//g' -e 's/>/, /g' | tail -r \
  > "tokyo_death_of_patient_2020$i.txt"
done
(
  for url in `cut -d, -f 1 tokyo_death_of_patient_20200{4..7}.txt`; do
    url="https://www.metro.tokyo.lg.jp$url"
    ruby tokyo_death_of_patient.rb $url
    #echo $url
  done
) > tokyo_death_of_patient_04_07.csv


#url="https://www.metro.tokyo.lg.jp/tosei/hodohappyo/press/2020/08/index.html"
#  curl -s $url | xmllint --html --xpath '//a' - | tr ' ' '\n' \
#  | grep "新型コロナウイルスに関連した患者の死亡" \
#  | sed -e 's/<\/a><a//g' -e 's/href=//g' -e 's/\"//g' -e 's/>/, /g' | tail -r \
#  > "tokyo_death_of_patient_202008.txt"

(
  for url in `cut -d, -f 1 tokyo_death_of_patient_202008.txt`; do
    #sleep 1
    url="https://www.metro.tokyo.lg.jp$url"
    ruby tokyo_death_of_patient.rb $url
  done
) > tokyo_death_of_patient_08.csv

#echo "公表日,枝番,年代,性別,居住地,発症日,診断日,死亡日,ソース" > tokyo_death_of_patient.csv
cat tokyo_death_of_patient_02_03.csv tokyo_death_of_patient_04_07.csv > tokyo_death_of_patient.csv
cat tokyo_death_of_patient_08.csv >> tokyo_death_of_patient.csv

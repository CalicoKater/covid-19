#!/bin/bash
#8/11
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/2aec45b215931802c1245dbde1f4448b3a347959/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/12
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/cf202b4f1a2ed2cf974ecf455f0a4fa47be60987/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/13
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/8c3e6db495a7b7ded26d4385023c751084502426/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/14
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/65263cd70904156aeb2da68574bca5951ca844b3/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/15
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/7e059393d14bcc63a807a58923e9ec68009d162a/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/16
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/804a986fc6b2845e02f7bd7dc17813dabe140304/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/17
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/db009d0a49a6b5a4ecae5fe3bd2de0f4841d06f0/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/18
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/a7b737de7d9f89c0761d80ab7cdd368f653d2c21/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/19
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/b36cbf5be2c72ea27fc94d961b8cee701e6fae12/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/20
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/1fbe30bd252c3a1296cac77e01acb18fb0a889ac/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

( day=2020-08-12; join -t, -a 1 -a 2 onset_2020-08-12.txt onset_2020-08-11.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-13; join -t, -a 1 -a 2 onset_2020-08-13.txt onset_2020-08-12.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-14; join -t, -a 1 -a 2 onset_2020-08-14.txt onset_2020-08-13.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-15; join -t, -a 1 -a 2 onset_2020-08-15.txt onset_2020-08-14.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-16; join -t, -a 1 -a 2 onset_2020-08-16.txt onset_2020-08-15.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-17; join -t, -a 1 -a 2 onset_2020-08-17.txt onset_2020-08-16.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-18; join -t, -a 1 -a 2 onset_2020-08-18.txt onset_2020-08-17.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-19; join -t, -a 1 -a 2 onset_2020-08-19.txt onset_2020-08-18.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-20; join -t, -a 1 -a 2 onset_2020-08-20.txt onset_2020-08-19.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
) > df.txt

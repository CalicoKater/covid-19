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

#8/21
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/031a714f78369b6a933e35ac8b3531fa8e11b5c0/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/22
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/61ba2c9645afc3573c36f5958527dfb0174a5056/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/23
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/a1e3e19eb6a04e73979aa0ef80a9d6a5eb027556/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/24
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/08cc158c933be9cc689cb9f548f672592259fbcb/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/25
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/d4928c34cf6d59bbd552f9f7322f71ae9d375e37/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/26
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/0535240261da730d11fc4f0a9100d6a73f27a231/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/27
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/edf5487ae318bd0a3853d1bfc55e33e97a9eacfb/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/28
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/24db4d9c5d153cad3b9a9e26e50574d972f9f18d/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/29
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/2115bdd07e28920441fca91b460cfcf158c6754d/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/30
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/a1c6b223e8e98a99cd5b4e440e0b231d12278b7d/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#8/31
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/535b09941ff5b82b87b0ecfd0cf05139026c3334/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#9/1
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/151e9f6c37d07de19603724b0422611d2e72d695/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#9/2
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/c99bc631cff001b4bc7d64920eef001e3af46cee/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#9/3
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/5577ec2555d7a96333f507133106fc3f9ce34034/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#9/4
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/17602c46cbd967395a14e8919918d79feff83bd5/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#9/5
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/11bc3fd0ce8d394e09d97d4145278994ebe64e67/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#9/6
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/db1ed1412259e5b077e0f04a2b7805e02a952438/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#9/7
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/aa8939c2102194ff515cccea95f4079a5f2b3c62/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#9/8
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/67ae02dad8f0aab47dbf255f38cf1935a2e6e34d/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#9/9
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/06438699bb024766a7374cc47b6c1333b956e37d/data/positive_by_developed.json"
update_at=`curl -s $url | jq -r '.date'`; date=`date  -j -f "%Y/%m/%d %H:%M" "$update_at" +"%Y-%m-%d"`
curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv' > onset_$date.txt

#9/10
url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/851824ba1e2308b19e1fa8e47d6037feb8774b7c/data/positive_by_developed.json"
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
  day=2020-08-21; join -t, -a 1 -a 2 onset_2020-08-21.txt onset_2020-08-20.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-22; join -t, -a 1 -a 2 onset_2020-08-22.txt onset_2020-08-21.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-23; join -t, -a 1 -a 2 onset_2020-08-23.txt onset_2020-08-22.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-24; join -t, -a 1 -a 2 onset_2020-08-24.txt onset_2020-08-23.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-25; join -t, -a 1 -a 2 onset_2020-08-25.txt onset_2020-08-24.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-26; join -t, -a 1 -a 2 onset_2020-08-26.txt onset_2020-08-25.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-27; join -t, -a 1 -a 2 onset_2020-08-27.txt onset_2020-08-26.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-28; join -t, -a 1 -a 2 onset_2020-08-28.txt onset_2020-08-27.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-29; join -t, -a 1 -a 2 onset_2020-08-29.txt onset_2020-08-28.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-30; join -t, -a 1 -a 2 onset_2020-08-30.txt onset_2020-08-29.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-08-31; join -t, -a 1 -a 2 onset_2020-08-31.txt onset_2020-08-30.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-09-01; join -t, -a 1 -a 2 onset_2020-09-01.txt onset_2020-08-31.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-09-02; join -t, -a 1 -a 2 onset_2020-09-02.txt onset_2020-09-01.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-09-03; join -t, -a 1 -a 2 onset_2020-09-03.txt onset_2020-09-02.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-09-04; join -t, -a 1 -a 2 onset_2020-09-04.txt onset_2020-09-03.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-09-05; join -t, -a 1 -a 2 onset_2020-09-05.txt onset_2020-09-04.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-09-06; join -t, -a 1 -a 2 onset_2020-09-06.txt onset_2020-09-05.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-09-07; join -t, -a 1 -a 2 onset_2020-09-07.txt onset_2020-09-06.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-09-08; join -t, -a 1 -a 2 onset_2020-09-08.txt onset_2020-09-07.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-09-09; join -t, -a 1 -a 2 onset_2020-09-09.txt onset_2020-09-08.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
  day=2020-09-10; join -t, -a 1 -a 2 onset_2020-09-10.txt onset_2020-09-09.txt  | awk -v p=$day -F, '$2-$3!=0{print p,$1, $2-$3}'
) > df.txt

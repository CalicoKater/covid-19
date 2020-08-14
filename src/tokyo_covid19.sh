#!/bin/bash

url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/development/data/daily_positive_detail.json"
(
  echo "報告日,陽性者数,接触歴等判明者数,接触歴等不明者数"
  curl -s $url | jq -r '.data[]|[.diagnosed_date, .count, .reported_count, .missing_count]|@csv'
) > tokyo_daily_positive_detail.csv

url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/development/data/positive_by_diagnosed.json"
(
  echo "確定日,陽性者数"
  curl -s $url | jq -r '.data[]|[.diagnosed_date, .count]|@csv'
#) > tokyo_positive_by_diagnosed.csv
) > tokyo_positive_by_confirmed.csv

url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/development/data/positive_rate.json"
(
  echo "検査結果の判明日,PCR検査陽性者数,抗原検査陽性者数,PCR検査陰性者数,抗原検査陰性者数"
  curl -s $url | jq -r '.data[]|[.diagnosed_date, .pcr_positive_count, .antigen_positive_count, .pcr_negative_count, .antigen_negative_count]|@csv'
) > tokyo_positive_rate.csv

url="https://raw.githubusercontent.com/tokyo-metropolitan-gov/covid19/development/data/positive_by_developed.json"
(
  echo "発症日,陽性者数"
  curl -s $url | jq -r '.data[]|[.developed_date, .count]|@csv'
) > tokyo_positive_by_onset.csv

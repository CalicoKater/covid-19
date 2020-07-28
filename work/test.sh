echo "報告日集計"
ruby ./work/test3.rb | cut -d, -f 1 | sort | uniq -c | awk '{print $2 ",", $1}'

echo "到着日集計"
ruby ./work/test3.rb | cut -d, -f 2 | sort | uniq -c | awk '{print $2 ",", $1}'

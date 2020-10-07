sqlite3 covid-19.sqlite3

CREATE TABLE "patients" (
	"perf_case_number"	INTEGER,
	"perf_case_number_sub"	INTEGER DEFAULT 0,
	"perf_code"	TEXT,
	"perf_name"	TEXT,
	"city_code"	TEXT,
	"city_name"	TEXT,
	"city_case_number"	INTEGER,
	"report_date"	TEXT,
	"confirm_date"	TEXT,
	"regidence"	TEXT,
	"age_class"	TEXT,
	"gender"	TEXT,
	"occupation"	TEXT,
	"onset_date"	TEXT,
	"symptoms"	TEXT,
	"asymptomatic_flg"	INTEGER,
	"re_positive_flg"	INTEGER,
	"condition"	TEXT,
	"travel_hist"	TEXT,
	"travel_hist_flg"	INTEGER,
	"contact_hist"	TEXT,
	"contact_hist_flg"	INTEGER,
	"discharge_date"	TEXT,
	"remarks_1"	TEXT,
	"remarks_2"	TEXT,
	"remarks_3"	TEXT,
	"source_1"	TEXT,
	"source_2"	TEXT,
	"source_3"	TEXT,
	PRIMARY KEY("perf_case_number","perf_code","perf_case_number_sub")
);

/* 北海道 */
drop table hokkaido_csv;
.mode csv
.import ./01_hokkaido2.csv hokkaido_csv

delete from patients where perf_code='010006';
insert into patients (perf_case_number, perf_code,report_date, onset_date, regidence, age_class,gender,occupation, symptoms, travel_hist_flg, re_positive_flg,remarks_1)
select No, "全国地方公共団体コード","公表_年月日","発症_年月日","患者_居住地","患者_年代", "患者_性別","患者_職業", "患者_症状","患者_渡航歴の有無フラグ","患者_再陽性フラグ","備考"
from hokkaido_csv;


/* 青森県 */
drop table aomori_csv;
.mode csv
.import ./02_aomori2.csv aomori_csv

delete from patients where perf_code='020001';
insert into patients (perf_case_number, perf_code, report_date, regidence, age_class, gender, confirm_date, remarks_1)
select "ＮＯ", "全国地方公共団体コード","公表_年月日","居住地","年代","性別","判明_年月日","保健所館内"
from aomori_csv;

/*岩手県*/
drop table iwate_csv;
.mode csv
.import ./03_iwate2.csv iwate_csv

delete from patients where perf_code='030007';
insert into patients (perf_case_number, perf_code, regidence, age_class, gender, confirm_date, remarks_1)
select "区分", "030007", "居住地", "年代", "性別", "判明した日", "備考" 
from iwate_csv order by cast("区分" as integer);


/* 秋田県 */
drop table akita_csv;
.mode csv
.import ./05_akita2.csv akita_csv

delete from patients where perf_code='050008';
insert into patients (perf_case_number, perf_code, regidence, age_class, gender, occupation, confirm_date, remarks_1, remarks_2)
select "県内症例", "050008", "居住地", "年齢", "性別", "職業", "陽性確認日", "備考" ,"濃厚接触者等に関する調査"
from akita_csv order by cast("県内症例" as integer);

/*山形県 */
drop table yamagata_csv;
.mode csv
.import ./06_yamagata2.csv yamagata_csv

delete from patients where perf_code='060003';
insert into patients (perf_case_number, perf_code, report_date, confirm_date, regidence, age_class, gender)
select "No", "全国地方公共団体コード", "公表_年月日", "感染確認_年月日", "患者_居住地","患者_年代", "患者_性別"
from yamagata_csv;

/* 福島県 */
drop table fukushima3_csv;
drop table fukushima4_csv;
.mode csv
.import ./07_fukushima3.csv fukushima3_csv
.import ./07_fukushima4.csv fukushima4_csv

delete from patients where perf_code='070009';
insert into patients (perf_case_number, perf_code, report_date, regidence, age_class, gender)
select "No", "全国地方公共団体コード", "公表_年月日", "患者_居住地", "患者_年代", "患者_性別"
from fukushima4_csv;

update patients 
  set (remarks_1,remarks_2) = (select fukushima3_csv."備　　考", '保健所: ' || fukushima3_csv."保健所（市町村）" from fukushima3_csv
  where patients.perf_code='070009' and patients.perf_case_number=fukushima3_csv."事例")



UPDATE TableA
      ,TableB
SET TavleA.Column1 = T2.Column1
   ,TavleA.Column2 = T2.Column2
WHERE TableA.ID = TableB.ID

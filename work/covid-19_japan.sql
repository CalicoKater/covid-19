/* 北海道 */
drop table hokkaido_csv;
.mode csv
.import ./01_hokkaido2.csv hokkaido_csv

delete from patients where perf_code='010006';
insert into patients (perf_case_number, perf_code,report_date, onset_date, regidence, age_class,gender,occupation, symptoms, travel_hist_flg, re_positive_flg,remarks_1)
select No, "全国地方公共団体コード","公表_年月日","発症_年月日","患者_居住地","患者_年代", "患者_性別","患者_職業", "患者_症状","患者_渡航歴の有無フラグ","患者_再陽性フラグ","備考"
from hokkaido_csv;

drop table  sapporo_city_case_number_csv;
.mode csv
.import ./01_sapporo_city_case_number.csv sapporo_city_case_number_csv

update patients
  set (city_code, city_case_number) = (select "011002", sapporo_city_case_number_csv."No"
  from sapporo_city_case_number_csv
  where patients.perf_case_number = sapporo_city_case_number_csv."北海道発表No")
where patients.perf_code='010006';

/* 青森県 */
drop table aomori_csv;
.mode csv
.import ./02_aomori2.csv aomori_csv

delete from patients where perf_code='020001';
insert into patients (perf_case_number, perf_code, report_date, regidence, age_class, gender, confirm_date, remarks_1)
select "ＮＯ", "全国地方公共団体コード","公表_年月日","居住地","年代","性別","判明_年月日","保健所管内"
from aomori_csv;

/*岩手県*/
drop table iwate_csv;
.mode csv
.import ./03_iwate2.csv iwate_csv

delete from patients where perf_code='030007';
insert into patients (perf_case_number, perf_code, regidence, age_class, gender, confirm_date, remarks_1)
select "区分", "030007", "居住地", "年代", "性別", "判明した日", "備考" 
from iwate_csv order by cast("区分" as integer);

/* 宮城県 */
drop table miyagi_csv;
.mode csv
.import ./04_miyagi2.csv miyagi_csv

delete from patients where perf_code = '040002';
insert into patients (perf_case_number, perf_code, regidence, age_class, gender, confirm_date)
select "No", "040002", "居住地", "年代", "性別", "確定日"
from miyagi_csv where cast("No" as integer) > 0;

drop table sendai_csv;
.mode csv
.import ./04_sendai_city_case_number.csv sendai_csv

update patients
  set (city_code, city_case_number) = (select "041009", sendai_csv.city_case_number 
  from sendai_csv
  where patients.perf_case_number = sendai_csv.perf_case_number)
where patients.perf_code='040002';

/* 秋田県 */
drop table akita_csv;
.mode csv
.import ./05_akita2.csv akita_csv

delete from patients where perf_code='050008';
insert into patients (perf_case_number, perf_code, regidence, age_class, gender, occupation, confirm_date, remarks_1, remarks_2)
select "県内症例", "050008", "居住地", "年齢", "性別", "職業", "陽性確認日", "備考" ,"濃厚接触者等に関する調査"
from akita_csv order by cast("県内症例" as integer);

update patients
  set remarks_3='発症日: 7月31日～8月6日'
  where perf_code='050008' and perf_case_number in (19,20,21,22,23,24,25,26);

/* 山形県 */
drop table yamagata_csv;
.mode csv
.import ./06_yamagata2.csv yamagata_csv

delete from patients where perf_code='060003';
insert into patients (perf_case_number, perf_code, report_date, confirm_date, regidence, age_class, gender)
select "No", "全国地方公共団体コード", "公表_年月日", "感染確認_年月日", "患者_居住地","患者_年代", "患者_性別"
from yamagata_csv;

/* 山形市 062014 */
drop table if exists yamagata_city_csv;
.mode csv
.import ./06_yamagata_city_case_number.csv yamagata_city_csv

update patients
  set (city_code, city_case_number) = ( select '062014', yamagata_city_csv.city_case_number
  from yamagata_city_csv
  where patients.perf_case_number = yamagata_city_csv.perf_case_number )
where patients.perf_code='060003';

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
  set (confirm_date,remarks_1,remarks_2) = (select fukushima3_csv."陽性判明日", fukushima3_csv."備　　考", '保健所: ' || fukushima3_csv."保健所（市町村）" from fukushima3_csv
  where patients.perf_case_number=fukushima3_csv."事例")
where patients.perf_code='070009';

/* 発症日 - 東北地方 */
drop table tohoku_onset_csv;
.mode csv
.import ./tohoku_onset_date.csv tohoku_onset_csv

update patients 
  set (onset_date) = (select tohoku_onset_csv.onset_date
  from tohoku_onset_csv
  where patients.perf_code=tohoku_onset_csv.perf_code and patients.perf_case_number = tohoku_onset_csv.perf_case_number)
where perf_code in ('020001','030007','040002','050008','060003','070009');

update patients
  set onset_date='7月31日～8月6日'
  where perf_code='050008' and perf_case_number in (19,20,21,22,23,24,25,26);

/* 茨城県 */
drop table ibaraki_csv;
.mode csv
.import ./08_ibaraki2.csv ibaraki_csv

delete from patients where perf_code='080004';
insert into patients (perf_case_number, perf_code, report_date, age_class, gender, regidence, remarks_1)
select "No", '080004', "公表日", "年齢", "性別","居住地", "区分"
from ibaraki_csv;

drop table ibaraki_onset_csv;
.mode csv
.import ./ibaraki_onset_and_confirm_date.csv ibaraki_onset_csv

/*↓これはなに？*/
update ibaraki_onset_csv
set (city_case_number,city_code) = (NULL,NULL)
where city_case_number='' and city_code='';

update patients
  set (city_case_number,city_code,onset_date,confirm_date) = (select
    ibaraki_onset_csv.city_case_number, ibaraki_onset_csv.city_code,ibaraki_onset_csv.onset_date,ibaraki_onset_csv.confirm_date
   from ibaraki_onset_csv
   where patients.perf_code=ibaraki_onset_csv.perf_code and patients.perf_case_number = ibaraki_onset_csv.perf_case_number
        and patients.report_date = ibaraki_onset_csv.report_date)
where perf_code = '080004';

/* 栃木県 */
drop table tochigi_csv;
.mode csv
.import ./09_tochigi2.csv tochigi_csv

delete from patients where perf_code='090000';
insert into patients (perf_case_number,perf_case_number_sub,perf_code,age_class,gender,regidence,confirm_date,discharge_date,remarks_1)
select "症例番号", rowid=19, '090000',"年代", "性別", "居住地", "陽性確認日", "退院･退所日","備考（No.は症例番号）"
from tochigi_csv;
update patients set re_positive_flg=1 where perf_code='090000' and perf_case_number=18 and perf_case_number_sub=1;


/* 092011 宇都宮市 */
drop table utsunomiya_city_case_number_csv;
.mode csv
.import ./09_utsunomiya_city_case_number.csv utsunomiya_city_case_number_csv
update patients
  set (city_code, city_case_number) = (select "092011", utsunomiya_city_case_number_csv."市No" 
  from utsunomiya_city_case_number_csv
  where patients.perf_case_number = utsunomiya_city_case_number_csv."栃木発表番号")
where patients.perf_code='090000';

/* 群馬県*/

DROP TABLE IF EXISTS gunma_csv;
.mode csv
.import ./10_gunma2.csv gunma_csv

delete from patients where perf_code='100005';
insert into patients (perf_case_number, perf_code, confirm_date,regidence, age_class, gender)
select "No", '100005', "判明日", "居住地", "年代", "性別"
from gunma_csv;

/* 栃木県 & 群馬県 発症日 */
drop table if exists tochigi_gunma_onset_csv;
.mode csv
.import ./tochigi_gunma_onset_date.csv tochigi_gunma_onset_csv

update patients
  set onset_date = ( select tochigi_gunma_onset_csv.onset_date
  from tochigi_gunma_onset_csv
  where patients.perf_code = tochigi_gunma_onset_csv.perf_code
    and patients.perf_case_number = tochigi_gunma_onset_csv.perf_case_number 
    and patients.perf_case_number_sub = tochigi_gunma_onset_csv.perf_case_number_sub )
where perf_code in ('090000','100005');

/* 埼玉県 */
drop table if exists saitama_csv;
.mode csv
.import ./11_saitama3.csv saitama_csv

delete from patients where perf_code='110001';
insert into patients (perf_case_number, perf_code, confirm_date, age_class, gender, regidence)
select "No", '110001', "判明日", "年代", "性別", "居住地"
from saitama_csv;

drop table if exists saitama_onset_csv;
.mode csv
.import ./11_saitama_onset_date.csv saitama_onset_csv

update patients
  set (report_date,city_code,city_case_number,onset_date) = ( select 
  saitama_onset_csv.report_date,saitama_onset_csv.city_code,saitama_onset_csv.city_case_number,saitama_onset_csv.onset_date
  from saitama_onset_csv
  where patients.perf_code=saitama_onset_csv.perf_code and patients.perf_case_number = saitama_onset_csv.perf_case_number)
where perf_code = '110001';

/* 北海道 */
drop table hokkaido_csv;
.mode csv
.import ./01_hokkaido2.csv hokkaido_csv

delete from patients where perf_code='010006';
insert into patients (perf_case_number, perf_code,report_date, onset_date, regidence, age_class,gender,occupation, symptoms, travel_hist_flg, re_positive_flg,remarks_1)
select No, "全国地方公共団体コード","公表_年月日","発症_年月日","患者_居住地","患者_年代", "患者_性別","患者_職業", "患者_症状","患者_渡航歴の有無フラグ","患者_再陽性フラグ","備考"
from hokkaido_csv;

/* 札幌市症例番号*/
drop table  sapporo_city_case_number_csv;
.mode csv
.import ./01_sapporo_city_case_number.csv sapporo_city_case_number_csv

update patients
  set (city_code, city_case_number) = (select "011002", sapporo_city_case_number_csv."No"
  from sapporo_city_case_number_csv
  where patients.perf_case_number = sapporo_city_case_number_csv."北海道発表No")
where patients.perf_code='010006';

/* 函館市症例番号, 陽性判明日 */
drop table if exists hakodate_city_csv;
.mode csv
.import ./01_hakodate_city.csv hakodate_city_csv

update patients set city_code='012025' where perf_code='010006'and perf_case_number in (select perf_case_number from hakodate_city_csv);
update patients set (city_case_number,confirm_date) = (select city_case_number,confirm_date from hakodate_city_csv
  where patients.perf_case_number = hakodate_city_csv.perf_case_number )
where city_code='012025';

/* 012041　旭川市症例番号, 陽性判明日 */
drop table if exists asahikawa_city_csv;
.mode csv
.import ./01_asahikawa_city.csv asahikawa_city_csv

update patients set city_code='012041' where perf_code='010006'and perf_case_number in (select perf_case_number from asahikawa_city_csv);
update patients set (city_case_number,confirm_date) = (select city_case_number,confirm_date from asahikawa_city_csv
  where patients.perf_case_number = asahikawa_city_csv.perf_case_number )
where city_code='012041';

/* 小樽市 確定日 */
drop table if exists otaru_city_csv;
drop table if exists otaru_city2_csv;
.mode csv
.import ./01_otaru_city.csv otaru_city_csv
.import ./01_otaru_city2.csv otaru_city2_csv

delete from otaru_city_csv
where "No" = 'No';

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
drop table if exists ibaraki_csv;
drop table if exists ibaraki_onset_csv;
.mode csv
.import ./08_ibaraki2.csv ibaraki_csv
.import ./08_ibaraki_onset_date.csv ibaraki_onset_csv

delete from patients where perf_code = ( select code from perf_and_city_code where perf_name = '茨城県' and city_name = '');

insert into patients (perf_code, perf_case_number, report_date, age_class, gender, regidence, contact_hist, contact_hist_flg, city_case_number, city_code, onset_date, confirm_date)
select ( select code from perf_and_city_code where perf_name = '茨城県' and city_name = '') as 'perf_code',
       K."No",K."公表日",K."年齢",K."性別",K."居住地", K."区分", K."区分"='濃厚接触者',
       O.city_case_number, O.city_code, O.onset_date, O.confirm_date
from ibaraki_csv K
left outer join ibaraki_onset_csv O on K."No" = O.perf_case_number and K."公表日" = O.report_date;

/*
delete from patients where perf_code='080004';
insert into patients (perf_case_number, perf_code, report_date, age_class, gender, regidence, remarks_1)
select "No", '080004', "公表日", "年齢", "性別","居住地", "区分"
from ibaraki_csv;

drop table ibaraki_onset_csv;
.mode csv
.import ./ibaraki_onset_and_confirm_date.csv ibaraki_onset_csv

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
*/

/* 栃木県 */
drop table tochigi_csv;
drop table utsunomiya_city_case_number_csv;
drop table if exists tochigi_gunma_onset_csv;
.mode csv
.import ./09_tochigi2.csv tochigi_csv
.import ./09_utsunomiya_city_case_number.csv utsunomiya_city_case_number_csv
.import ./tochigi_gunma_onset_date.csv tochigi_gunma_onset_csv

delete from patients where perf_code = (select code from perf_and_city_code where perf_name = '栃木県' and city_name = '');
insert into patients (perf_case_number, perf_case_number_sub, perf_code, city_code, city_case_number, age_class, gender, regidence, confirm_date, discharge_date, remarks_1, onset_date)
select T."症例番号", (T.rowid = 19) as repositive, (select code from perf_and_city_code where perf_name = '栃木県' and city_name = ''),U.city_code, U."市No",
       T."年代", T."性別", T."居住地", T."陽性確認日", T."退院･退所日", T."備考（No.は症例番号）",O.onset_date from tochigi_csv T
 left outer join (select * from tochigi_gunma_onset_csv
                         where perf_code=(select code from perf_and_city_code where perf_name = '栃木県' and city_name = '') ) O
       on T."症例番号" = O.perf_case_number and repositive = O.perf_case_number_sub
left outer join (select '092011' as city_code, * from utsunomiya_city_case_number_csv ) U on T."症例番号" = U."栃木発表番号";
update patients set re_positive_flg=1 where perf_code='090000' and perf_case_number=18 and perf_case_number_sub=1;

/*
delete from patients where perf_code='090000';
insert into patients (perf_case_number,perf_case_number_sub,perf_code,age_class,gender,regidence,confirm_date,discharge_date,remarks_1)
select "症例番号", rowid=19, '090000',"年代", "性別", "居住地", "陽性確認日", "退院･退所日","備考（No.は症例番号）"
from tochigi_csv;
update patients set re_positive_flg=1 where perf_code='090000' and perf_case_number=18 and perf_case_number_sub=1;
*/

/* 092011 宇都宮市 */
/*
drop table utsunomiya_city_case_number_csv;
.mode csv
.import ./09_utsunomiya_city_case_number.csv utsunomiya_city_case_number_csv
update patients
  set (city_code, city_case_number) = (select "092011", utsunomiya_city_case_number_csv."市No" 
  from utsunomiya_city_case_number_csv
  where patients.perf_case_number = utsunomiya_city_case_number_csv."栃木発表番号")
where patients.perf_code='090000';
*/

/* 群馬県*/

DROP TABLE IF EXISTS gunma_csv;
drop table if exists tochigi_gunma_onset_csv;
.mode csv
.import ./10_gunma2.csv gunma_csv
.import ./tochigi_gunma_onset_date.csv tochigi_gunma_onset_csv

delete from patients where perf_code = (select code from perf_and_city_code where perf_name = '群馬県' and city_name = '');
insert into patients (perf_case_number, perf_code, confirm_date,regidence, age_class, gender, onset_date)
select G."No",  (select code from perf_and_city_code where perf_name = '群馬県' and city_name = ''),
           G."判明日", G."居住地", G."年代", G."性別", O.onset_date from gunma_csv G
  left outer join (select * from tochigi_gunma_onset_csv
 where perf_code = (select code from perf_and_city_code where perf_name = '群馬県' and city_name = '') ) O
  on G."No" = O.perf_case_number;


/*
delete from patients where perf_code='100005';
insert into patients (perf_case_number, perf_code, confirm_date,regidence, age_class, gender)
select "No", '100005', "判明日", "居住地", "年代", "性別"
from gunma_csv;
*/
/* 栃木県 & 群馬県 発症日 */
/*
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
*/
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

update saitama_onset_csv
set (city_case_number,city_code) = (NULL,NULL)
where city_case_number='' and city_code='';

update patients
  set (report_date,city_code,city_case_number,onset_date) = ( select 
  saitama_onset_csv.report_date,saitama_onset_csv.city_code,saitama_onset_csv.city_case_number,saitama_onset_csv.onset_date
  from saitama_onset_csv
  where patients.perf_code=saitama_onset_csv.perf_code and patients.perf_case_number = saitama_onset_csv.perf_case_number)
where perf_code = '110001';

/* 千葉県 */
drop table if exists chiba_symptoms_csv;
drop table if exists chiba_asymptomatic_csv;
.mode csv
.import ./12_chiba3.csv chiba_symptoms_csv
.import ./12_chiba4.csv chiba_asymptomatic_csv

delete from patients where perf_code='120006';
insert into patients (perf_code, perf_case_number, perf_case_number_sub,
                      age_class, gender, regidence, remarks_1, onset_date, confirm_date)
select '120006', "症例番号", 0, "年代", "性別", "居住地", "区分", "発症日", "検査確定日"
from chiba_symptoms_csv;
insert into patients (perf_code, perf_case_number, perf_case_number_sub,
                       age_class, gender, regidence, remarks_1, confirm_date)
select '120006', "症例番号", 1, "年代", "性別", "居住地", "区分", "検査確定日"
from chiba_asymptomatic_csv;

/* 東京都 */
drop table if exists tokyo_csv;
.mode csv
.import ./13_tokyo.csv tokyo_csv
delete from patients where perf_code='130001';
insert into patients (perf_case_number, perf_code, report_date, regidence, age_class, gender )
select "No", "全国地方公共団体コード", "公表_年月日", "患者_居住地" , "患者_年代", "患者_性別"
from tokyo_csv;

/* 神奈川県 */
drop table if exists kanagawa_csv;
.mode csv
.import ./14_kanagawa.csv kanagawa_csv
alter table kanagawa_csv add column perf_code text;
alter table kanagawa_csv add column city_code text;
alter table kanagawa_csv add column city_case_number integer;
/*drop trigger if exists city_case_number;
create trigger city_case_number after update of city_code on kanagawa_csv
  begin
    update kanagawa_csv set city_case_number = (select count(city_code) from kanagawa_csv) 
    where rowid=OLD.rowid;
  end;
*/
update kanagawa_csv set perf_code=( select code from perf_and_city_code where perf_name='神奈川県' and city_name = '' );
update kanagawa_csv set city_code=(select code from perf_and_city_code where perf_name='神奈川県' and city_name = '川崎市' )
where "居住地" = '神奈川県川崎市';
update kanagawa_csv set city_code=(select code from perf_and_city_code where perf_name='神奈川県' and city_name = '横浜市' )
where "居住地" = '神奈川県横浜市';
update kanagawa_csv set city_code=(select code from perf_and_city_code where perf_name='神奈川県' and city_name = '相模原市' )
where "居住地" = '神奈川県相模原市';
update kanagawa_csv set city_code=(select code from perf_and_city_code where perf_name='神奈川県' and city_name = '横須賀市' )
where "居住地" = '神奈川県横須賀市';
update kanagawa_csv set city_code=(select code from perf_and_city_code where perf_name='神奈川県' and city_name = '茅ヶ崎市' )
where "居住地" in ('神奈川県茅ケ崎市保健所管内','神奈川県茅ヶ崎市保健所管内');
update kanagawa_csv set city_code=(select code from perf_and_city_code where perf_name='神奈川県' and city_name = '藤沢市' )
where "居住地" = '神奈川県藤沢市';
update kanagawa_csv set city_code=(select code from perf_and_city_code where perf_name='神奈川県' and city_name = '鎌倉市' )
where "居住地" = '神奈川県鎌倉保健福祉事務所管内';
update kanagawa_csv set city_code=(select code from perf_and_city_code where perf_name='神奈川県' and city_name = '厚木市' )
where "居住地" = '神奈川県厚木保健福祉事務所管内';
update kanagawa_csv set city_code=(select code from perf_and_city_code where perf_name='神奈川県' and city_name = '小田原市' )
where "居住地" = '神奈川県小田原保健福祉事務所管内';
update kanagawa_csv set city_code=(select code from perf_and_city_code where perf_name='神奈川県' and city_name = '平塚市' )
where "居住地" = '神奈川県平塚保健福祉事務所管内';

/* 横浜市 */
drop table if exists yokohama_csv;
drop table if exists yokohama2_csv;
drop table if exists yokohama_case_number;
.mode csv
.import ./14_yokohama_city.csv yokohama_csv
.import ./14_yokohama_city2.csv yokohama2_csv
.import ./14_kanagawa_yokohama_city_case_number.csv yokohama_case_number

delete from patients
 where perf_code = (select code from perf_and_city_code where perf_name='神奈川県' and city_name='')
   and city_code = (select code from perf_and_city_code where perf_name='神奈川県' and city_name='横浜市');

insert into patients (city_case_number, perf_case_number, perf_code, city_code, report_date, age_class, gender, condition)
select N.*,
       (select code from perf_and_city_code where perf_name='神奈川県' and city_name=''),
 	     (select code from perf_and_city_code where perf_name='神奈川県' and city_name='横浜市'),
       Y."公表日", Y."患者_年代", H."性別", Y."患者_状態"
 from yokohama_case_number N
    inner join yokohama_csv Y on  cast(N.city_case_number as integer) = cast(Y."No" as integer)
	inner join yokohama2_csv H on cast(N.city_case_number as integer) = cast(H."横浜市症例番号" as integer);

/* 川崎市 */
drop table if exists kawasaki_csv;
drop table if exists kawasaki_case_number;
.mode csv
.import ./14_kawasaki_city.csv kawasaki_csv
.import ./14_kanagawa_kawasaki_city_case_number.csv kawasaki_case_number
delete from patients
 where perf_code = (select code from perf_and_city_code where perf_name='神奈川県' and city_name='')
   and city_code = (select code from perf_and_city_code where perf_name='神奈川県' and city_name='川崎市');

insert into patients (city_case_number, perf_case_number, perf_code, city_code, report_date, age_class, gender, regidence, occupation, remarks_2)
select N.*,
       (select code from perf_and_city_code where perf_name='神奈川県' and city_name=''),
 	     (select code from perf_and_city_code where perf_name='神奈川県' and city_name='川崎市'),
       K."発表日", K."年代",K."性別", K."居住地",K."職業",K."備考"
 from kawasaki_case_number N
    inner join kawasaki_csv K on  cast(N.city_case_number as integer) = cast(K."番号" as integer);

/* 鎌倉保健福祉事務所管内 */
/*drop table if exists kamakura_cav;
.mode csv
.import ./14_kamakura2.csv kamakura_csv

delete from patients
  where perf_code = (select code from perf_and_city_code where perf_name='神奈川県' and city_name='')
   and city_code = (select code from perf_and_city_code where perf_name='神奈川県' and city_name='鎌倉市');

insert into patients (city_case_number, perf_case_number, perf_code, city_code, report_date, age_class, gender, regidence,occupation,
             symptoms,remarks_3,remarks_2)
select city_case_number, perf_case_number,
       (select code from perf_and_city_code where perf_name='神奈川県' and city_name=''),
 	     (select code from perf_and_city_code where perf_name='神奈川県' and city_name='鎌倉市'),
       "発表日", age_class, gender, "居住地", "職業", "症状",remarks, "発生事由" from kamakura_csv;
*/

/* 相模原市 */
drop table if exists sagamihara_case_number;
.mode csv
.import ./14_kanagawa_sagamihara_city_case_number.csv sagamihara_case_number

drop table if exists sagamihara_tmp;
create table sagamihara_tmp as 
select * from kanagawa_csv
where city_code=(select code from perf_and_city_code where perf_name='神奈川県' and city_name = '相模原市')
order by "発表日", rowid desc;
update sagamihara_tmp set city_case_number = rowid;
update sagamihara_tmp set city_case_number = rowid + 1
where rowid >= 362;

delete from patients
  where city_code = (select code from perf_and_city_code where perf_name='神奈川県' and city_name='相模原市');
insert into patients (perf_case_number, perf_code, city_code, city_case_number, report_date, regidence, age_class, gender)
select N.perf_case_number, S.perf_code, S.city_code,S.city_case_number, S."発表日", S."居住地", S."年代", S."性別"
  from sagamihara_tmp S inner join sagamihara_case_number N on S.city_case_number = cast(N.city_case_number as integer);

/* 茅ヶ崎市*/
drop table if exists chigasaki_case_number;
.mode csv
.import ./14_kanagawa_chigasaki_city_case_number.csv chigasaki_case_number
drop table chigasaki_tmp;
create table chigasaki_tmp as
select * from kanagawa_csv
where city_code=(select code from perf_and_city_code where perf_name='神奈川県' and city_name = '茅ヶ崎市')
order by "発表日", rowid desc;
update chigasaki_tmp set city_case_number = rowid;
update chigasaki_tmp set city_case_number = rowid + 1
where rowid >= 23;

delete from patients
  where city_code = (select code from perf_and_city_code where perf_name='神奈川県' and city_name='茅ヶ崎市');
insert into patients (perf_case_number, perf_code, city_code, city_case_number, report_date, regidence, age_class, gender)
select N.perf_case_number, C.perf_code, C.city_code,C.city_case_number, C."発表日", C."居住地", C."年代", C."性別"
  from chigasaki_tmp C inner join chigasaki_case_number N on C.city_case_number = cast(N.city_case_number as integer);


/* 横須賀市*/
/* drop table if exists yokosuka_csv; */
drop table if exists yokosuka_case_number;
.mode csv
/* .import ./14_yokosuka_city3.csv yokosuka_csv */
.import ./14_kanagawa_yokosuka_city_case_number.csv yokosuka_case_number

drop table if exists yokosuka_tmp;
create table yokosuka_tmp as
select * from kanagawa_csv
where city_code=(select code from perf_and_city_code where perf_name='神奈川県' and city_name = '横須賀市')
order by "発表日", rowid desc;
update yokosuka_tmp set city_case_number = rowid;

delete from patients
  where city_code = (select code from perf_and_city_code where perf_name='神奈川県' and city_name='横須賀市');
insert into patients (perf_case_number, perf_code, city_code, city_case_number, report_date, regidence, age_class, gender)
select N.perf_case_number, Y.perf_code, Y.city_code,Y.city_case_number, Y."発表日", Y."居住地", Y."年代", Y."性別"
  from yokosuka_tmp Y inner join yokosuka_case_number N on Y.city_case_number = cast(N.city_case_number as integer);

/* 藤沢市 */
drop table if exists fujisawa_csv;
drop table if exists fujisawa_case_number;
.mode csv
.import ./14_fujisawa_city.csv fujisawa_csv
.import ./14_kanagawa_fujisawa_city_case_number fujisawa_case_number

insert into patients (perf_code, city_code,	city_case_number, report_date,
 age_class, gender, occupation, regidence, perf_case_number, onset_date, confirm_date)
select (select code from perf_and_city_code where perf_name='神奈川県' and city_name=''),
       (select code from perf_and_city_code where perf_name='神奈川県' and city_name='藤沢市'),
    "番号","発表日","年代","性別","職業","居住地","神奈川県症例番号","発症日","確定日"
  from fujisawa_csv where "神奈川県症例番号" <> '';



/* 新潟県 */
drop table if exists niigata_csv;
drop table if exists niigata_onset_csv;
.mode csv
.import ./15_niigata2.csv niigata_csv
.import ./15_niigata_onset_date.csv niigata_onset_csv
update niigata_csv set 新潟市症例番号 = NULL
where "新潟市症例番号" =='';

delete from patients where perf_code = '150002';
insert into patients (perf_case_number, perf_code, city_case_number, confirm_date, age_class, gender, regidence, occupation, remarks_1, remarks_2, onset_date)
select N."症例番号", '150002', N."新潟市症例番号", N."判明日", N."年代", N."性別", N."居住地", N."職業", N."備考", '濃厚接触者数: ' || N."濃厚接触者数", C."発症日"
 from niigata_csv N inner join niigata_onset_csv C on N."症例番号" = C."県内症例番号"
 order by cast(N."症例番号" as integer) ;

update patients  set city_code = '151009' 
where perf_code = '150002' and city_case_number is not null;

/* 富山県 */
drop table if exists toyama_csv;
.mode csv
.import ./16_toyama.csv toyama_csv
update toyama_csv set "性別" = '女性' where "性別" = '女' ;
update toyama_csv set "性別" = '男性' where "性別" = '男' ;

delete from patients where perf_code = (select code from perf_and_city_code where perf_name = '富山県' and city_name = '');

insert into patients (perf_case_number,perf_code,confirm_date,age_class,gender, regidence,occupation,onset_date,condition,symptoms,remarks_1)
select "No", (select code from perf_and_city_code where perf_name = '富山県' and city_name = '') as perf_code,
       "検査結果判明日","年代","性別", "居住地", "職業", "発症日", "状態","症状", "備考"
  from toyama_csv order by cast("No" as integer);

/* 石川県 */
drop table if exists ishikawa_csv;
drop table if exists ishikawa_onset_csv;
.mode csv
.import ./17_ishikawa2.csv ishikawa_csv
.import ./17_ishikawa_onset_date.csv ishikawa_onset_csv

delete from patients
 where perf_code = (select code from perf_and_city_code where perf_name = '石川県' and city_name = '');
insert into patients (perf_case_number, perf_code, report_date, regidence, age_class, gender, onset_date, confirm_date)
select M."No", M."全国地方公共団体コード", M."公表_年月日", M."患者_居住地", M."患者_年代", M."患者_性別",
       C."発症日", C."確定日" from ishikawa_csv M
  inner join ishikawa_onset_csv C on M."No" = C."No";

/* 福井県 */ 
drop table if exists fukui_csv;
.mode csv
.import ./18_fukui2.csv fukui_csv

delete from patients
  where perf_code = (select code from perf_and_city_code where perf_name = '福井県' and city_name = '');
insert into patients ( perf_case_number, perf_code, report_date, onset_date, regidence, age_class, gender, occupation,
                      condition, symptoms, travel_hist_flg, discharge_date, remarks_1 )
 select "No", "全国地方公共団体コード", "公表_年月日", "発症_年月日", "患者_居住地", "患者_年代", "患者_性別","患者_職業",
  "患者_状態", "患者_症状", "患者_渡航歴の有無フラグ","患者_退院済フラグ","備考" from fukui_csv ;

/* 山梨県 */
drop table if exists yamahashi_csv;
.mode csv
.import ./19_yamanashi2.csv yamanashi_csv

delete from patients
  where perf_code = ( select code from perf_and_city_code where perf_name = '山梨県' and city_name = '');
insert into patients ( perf_case_number, perf_code, report_date, onset_date, age_class, gender, regidence)
select "№", "全国地方公共団体コード", "公表日", "発症日", "年代", "性別", "居住地（生活圏）"
  from yamanashi_csv;

/* 長野県 */
drop table if exists nagano_csv;
drop table if exists nagano_onset_csv;
.mode csv
.import ./20_nagano3.csv nagano_csv
.import ./20_nagano_onset_date.csv nagano_onset_csv
delete from patients where perf_code = (select code from perf_and_city_code where perf_name = '長野県' and city_name = '');
insert into patients (perf_case_number, perf_code, confirm_date, regidence, age_class, gender, occupation, 
            condition, symptoms, travel_hist_flg, discharge_date, remarks_1, report_date, onset_date, city_case_number )
select N."No", N."全国地方公共団体コード", N."事例確定_年月日", N."患者_居住地", N."患者_年代", N."患者_性別", N."患者_職業",
          N."患者_状態", N."患者_症状", N."患者_渡航歴の有無フラグ", N."患者_退院等済フラグ", N."備考",
       O."公表日", O."発症日", O."長野市症例番号"
 from nagano_csv N
  left outer join nagano_onset_csv O on N."No" = O."長野県症例番号";
update patients set city_code = (select code from perf_and_city_code where perf_name = '長野県' and city_name = '長野市')
 where perf_code = (select code from perf_and_city_code where perf_name = '長野県' and city_name = '')
   and city_case_number != '';
/* No.30 再陽性 */
insert into patients
select perf_case_number, 1,perf_code,city_case_number,city_code,'2020-04-28','2020-04-28',
              regidence,age_class,gender,occupation,'2020-04-26',symptoms,asymptomatic_flg,1,condition,
              travel_hist,travel_hist_flg,contact_hist,contact_hist_flg,discharge_date,remarks_1,remarks_2,remarks_3,source_1,source_2,source_3
         from patients 
        where perf_code = (select code from perf_and_city_code where perf_name = '長野県' and city_name = '')
          and perf_case_number = 30 ;
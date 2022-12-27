create table foods (food_name char(10) not null,
food_remain integer default 0, primary key(food_name));
alter table foods add column food_price integer;
alter table foods drop column food_price;
begin transaction;
insert into foods values ('apple', 10);
insert into foods values ('coconut', default);
insert into foods values ('pineapple', 2);
insert into foods values ('banana', 5);
insert into foods (food_name, food_remain) values ('grapes', 50);
commit;
select * from public.foods;
drop table foods;

select count(*) from public.shohin where shohin_bunrui = 'clothes';
select sum(distinct hanbai_tanka) from public.shohin;
select count(distinct shohin_bunrui) from public.shohin;
select max(torokubi), min(torokubi) from public.shohin;
select shohin_bunrui, count(*) from public.shohin group by shohin_bunrui;
/*select->from->where->groupby->having->orderby(desc, asc)*/

select shohin_bunrui from shohin group by shohin_bunrui having count(*) = 2;
select shohin_bunrui, avg(hanbai_tanka) from public.shohin group by shohin_bunrui;
select shohin_bunrui, avg(hanbai_tanka) from public.shohin group by shohin_bunrui having avg(hanbai_tanka) >= 2500;

select * from shohin order by hanbai_tanka desc;

select shohin_bunrui, count(*) from shohin group by shohin_bunrui order by count(*);

create table shohincopy(shohin_id char(4) not null,
shohin_mei varchar(100) not null,
shohin_bunrui varchar(32) not null,
hanbai_tanka integer ,
shiire_tanka integer ,
torokubi date ,
primary key (shohin_id));

insert into shohincopy (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
select shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi from shohin;

select * from shohin_copy;

drop table shohincopy;


create table shohinbunrui(
shohin_bunrui varchar(32) not null,
sum_hanbai_tanka integer ,
sum_shiire_tanka integer ,
primary key (shohin_bunrui));

insert into shohinbunrui (shohin_bunrui, sum_hanbai_tanka, sum_shiire_tanka)
select shohin_bunrui, sum(hanbai_tanka), sum(shiire_tanka) from shohin group by shohin_bunrui;

select * from shohinbunrui;

update shohinbunrui set torokubi = '2009-10-10' where shohin_id = '0001';


select * from shohinbunrui;
delete from shohinbunrui;--where...


drop table shohinbunrui;


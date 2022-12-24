create table foods (food_name char(10) not null,
food_remain integer, primary key(food_name));
alter table food add column (food_price integer);
alter table food drop column (food_price integer);
begin transaction;
insert into foods ('apple', 10);
insert into foods ('coconut', 20);
insert into foods ('pineapple', 2);
insert into foods ('banana', 5);
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


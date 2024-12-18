CREATE TABLE raw_layer.events (
ID int,
event varchar(255),
YEAR INt,
GOLD varchar(255),
SILVER varchar(255),
BRONZE varchar(255)
);

set SQL_SAFE_UPDATES = 0 ;
delete from raw_layer.events;

INSERT INTO raw_layer.events VALUES (1,'100m',2016, 'Amthhew Mcgarray','donald','barbara');
INSERT INTO raw_layer.events VALUES (2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith');
INSERT INTO raw_layer.events VALUES (3,'500m',2016, 'Charles','Nichole','Susana');
INSERT INTO raw_layer.events VALUES (4,'100m',2016, 'Ronald','maria','paula');
INSERT INTO raw_layer.events VALUES (5,'200m',2016, 'Alfred','carol','Steven');
INSERT INTO raw_layer.events VALUES (6,'500m',2016, 'Nichole','Alfred','Brandon');
INSERT INTO raw_layer.events VALUES (7,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO raw_layer.events VALUES (8,'200m',2016, 'Thomas','Dawn','catherine');
INSERT INTO raw_layer.events VALUES (9,'500m',2016, 'Thomas','Dennis','paula');
INSERT INTO raw_layer.events VALUES (10,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO raw_layer.events VALUES (11,'200m',2016, 'jessica','Donald','Stefeney');
INSERT INTO raw_layer.events VALUES (12,'500m',2016,'Thomas','Steven','Catherine');

commit

select * from raw_layer.events;
#Approach-1
with temp as (
select GOLD AS PLAYER  , count(*) as total_gold from raw_layer.events 
group by GOLD
)
select * from temp 
  WHERE PLAYER NOT IN (select distinct silver from raw_layer.events union all select distinct bronze from raw_layer.events);

 #Approach-2
 select e.Gold, count(e.Gold) NoOfTimesWonGold from raw_layer.events e
left join raw_layer.events s on e.Gold = s.Silver
left join raw_layer.events b on e.Gold = b.bronze
where s.Silver is null
and b.bronze is null
group by e.Gold

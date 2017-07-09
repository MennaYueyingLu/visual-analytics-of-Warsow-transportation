CREATE TABLE move_timetable(id varchar(50), 
	Name varchar(50), 
	Trajectory_Id varchar(50), 
	line varchar(50),
	direction varchar(50),
	route varchar(50),
	brigade int,
	tripmode varchar(50), 
	Start_ID varchar(50), 
	End_ID varchar(50),
	Start_time varchar(50), 
	End_time varchar(50), 
	Segment_N int, 
	Duration_seconds int,
	Start_X double, 
	Start_Y double, 
	End_X double, 
	End_Y double, 
	Length_m float, 
	Speed_km_h float,
	Direction_degrees float, 
	Direction_text varchar(12)
	);

-- import csv data 20160901_move_timetable.csv into table move_timetable by HeidiSQL toll.
-- 64 Speed_km_h data are missing

	CREATE TABLE move_timetable_tram(id varchar(50), 
	Name varchar(50), 
	Trajectory_Id varchar(50), 
	line varchar(50),
	direction varchar(50),
	route varchar(50),
	brigade int,
	tripmode varchar(50), 
	Start_ID varchar(50), 
	End_ID varchar(50),
	Start_time varchar(50), 
	End_time varchar(50), 
	Segment_N int, 
	Duration_seconds int,
	Start_X double, 
	Start_Y double, 
	End_X double, 
	End_Y double, 
	Length_m float, 
	Speed_km_h float,
	Direction_degrees float, 
	Direction_text varchar(12)
	);

insert into move_timetable_tram
select *
from move_timetable
where tripmode="tram";
-- 147352 records has been inserted into move_timetable_tram

-- SELECT *
-- FROM
--     move_timetable_tram
-- INTO OUTFILE 'C:/Users/Administrator/Desktop/W-buses+trams/move_timetable_tram.csv' 
-- FIELDS ENCLOSED BY ' ' 
-- TERMINATED BY ',' 
-- ESCAPED BY ' '
-- LINES TERMINATED BY '\r\n';

select * from (select 'id', 'Name','Trajectory_Id', 'line','direction','route','brigade','tripmode','Start_ID','End_ID','Start_time','End_time','Segment_N','Duration_seconds','Start_X', 'Start_Y', 
	'End_X', 'End_Y', 'Length_m', 'Speed_km_h','Direction_degrees', 'Direction_text'   
union select id, Name,Trajectory_Id, line,direction,route,brigade,tripmode,Start_ID, End_ID,Start_time, End_time, Segment_N, Duration_seconds,Start_X, Start_Y, End_X, End_Y, Length_m, Speed_km_h,Direction_degrees, Direction_text
from move_timetable_tram) m
INTO OUTFILE 'C:/Users/Administrator/Desktop/W-buses+trams/move_timetable_tram.csv' 
FIELDS ENCLOSED BY ' ' 
TERMINATED BY ',' 
ESCAPED BY ' '
LINES TERMINATED BY '\r\n';




CREATE database 20160901_move;

-- it was strange that, seems objects' name can not be 'line' and 'lines'in the same table
CREATE TABLE move(id varchar(50), 
	Name varchar(50), 
	Trajectory_Id varchar(50),
	Entiy_Id varchar(50), 
	brigade varchar(50),
	line varchar(50),
	Lines_a varchar(50),
	Vehicle_identifier varchar(50),
	LowFloor varchar(50),
	TramOrBus varchar(50),
	Segment_N int,
	Start_time varchar(50), 
	End_time varchar(50), 
	Start_ID varchar(50), 
	End_ID varchar(50),
	Start_X double, 
	Start_Y double, 
	End_X double, 
	End_Y double, 
	Duration_seconds int,
	Length_m float, 
	Speed_km_h float,
	Direction_degrees float, 
	Direction_text varchar(12)
	);	

-- import csv data 20160901_move_timetable.csv into table move_timetable by HeidiSQL toll.
-- 4 Speed_km_h data are missing
CREATE TABLE move_tram(id varchar(50), 
	Name varchar(50), 
	Trajectory_Id varchar(50),
	Entiy_Id varchar(50), 
	brigade varchar(50),
	line varchar(50),
	Lines_a varchar(50),
	Vehicle_identifier varchar(50),
	LowFloor varchar(50),
	TramOrBus varchar(50),
	Segment_N int,
	Start_time varchar(50), 
	End_time varchar(50), 
	Start_ID varchar(50), 
	End_ID varchar(50),
	Start_X double, 
	Start_Y double, 
	End_X double, 
	End_Y double, 
	Duration_seconds int,
	Length_m float, 
	Speed_km_h float,
	Direction_degrees float, 
	Direction_text varchar(12)
	);	

insert into move_tram
select *
from move
where TramOrBus="tram";

select * from (select 'id', 'Name','Trajectory_Id', 'Entiy_Id','brigade','line','Lines_a','Vehicle_identifier','LowFloor','TramOrBus','Segment_N','Start_time','End_time','Start_ID','End_ID','Start_X', 'Start_Y', 
	'End_X', 'End_Y', 'Duration_seconds','Length_m', 'Speed_km_h','Direction_degrees', 'Direction_text'   
union select id, Name,Trajectory_Id, Entiy_Id,brigade,line,Lines_a,Vehicle_identifier,LowFloor,TramOrBus,Segment_N,Start_time, End_time,Start_ID, End_ID,Start_X, Start_Y, End_X, End_Y, Duration_seconds,Length_m, Speed_km_h,Direction_degrees, Direction_text
from move_tram) m
INTO OUTFILE 'C:/Users/Administrator/Desktop/W-buses+trams/move_tram.csv' 
FIELDS ENCLOSED BY ' ' 
TERMINATED BY ',' 
ESCAPED BY ' '
LINES TERMINATED BY '\r\n';
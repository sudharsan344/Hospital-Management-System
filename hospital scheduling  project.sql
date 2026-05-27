create  database hospital
use hospital
create table patients(
patient_id int primary key,
patient_name varchar(20),
age int ,
gender varchar (20),
phone_num varchar (20),
address varchar (30)
)
insert into patients
values(001,"kiddo",42,"male",625510058,"chennnai"),(002,"malik",22,"male",4543545445,"velachery"),(003,"githika",32,"female",5454554548545,"tvmalai"),(004,"susan",26,"male",535564548545,"tambaram"),(005,"toffie",55,"female",864645445,"velachery");
select*from patients




create table doctor (
doctor_id int primary key auto_increment,
doctor_name varchar(20),
specialization varchar(30),
phn_no varchar(20),
drpt_id int
)

insert into doctor
values(101,"ram","heart specialist",302014042,7128),
(102,"mani","kindeny specialist",46546584856,7129),
(103,"kavi","leg specialist",54854538,71210),
(104,"sandy","head specialist",96784534554,71211);
select*from doctor


create table dprt (
dp_id int primary key auto_increment ,
dp_name varchar(20),
location varchar (50)
)


insert into dprt
values(301,"ICU","block A"),
(302,"cardiology","block B"),
(303,"neurology","block C"),
(304,"emegerncy ward","block ZZZ");
select*from dprt




create table appointments(
appint_id int primary key auto_increment,
client_id int,
doct_id int,
foreign key (client_id) references patients(patient_id),
foreign key (doct_id) references doctor(doctor_id),
appointments_date date ,
 appoinment_time time 
)
 insert into appointments
 values(401,001,101,'2026-1-19','11:20:00'),
 (402,002,102,'2025-6-19','9:55:00'),
 (403,003,103,'2025-3-4','2:34:00'),
 (404,004,104,'2026-6-14','9:22:00');

select*from appointments

create table staff(
staff_id int primary key auto_increment,
staff_name varchar (20),
role_no int,
dpppt_id int,
phone_num varchar (20),
foreign key (dpppt_id) references dprt(dp_id)
)
insert into staff
values(501,"susan",712811,301,86864786),
(502,"rahul",712812,302,3021454698),
(503,"geetha",712813,303,54545154548),
(504,"harini",712814,304,8788787845);

select*from staff


create table rooms(
room_id int primary key auto_increment,
room_number int,
room_type varchar(20),
room_status varchar(30)
)
insert into rooms(room_number,room_type,room_status)
values (555,"general","available"),
(556,"ICU","occupied"),
(557,"emergency","available"),
(558,"private","available"),
(559,"general","available");
select*from rooms

create table admission(
admis_id int primary key auto_increment,
p_person_id int,
s_room_id int,
admisssion_date date,
discharge_date date,
foreign key(p_person_id) references patients(patient_id),
foreign key (s_room_id) references rooms(room_id)
)

alter table admission
rename column admisssion_date to admission_date;
insert into admission(p_person_id,s_room_id,admission_date,discharge_date)
values(001,1,'2025-11-14','2025-12-01'),(002,2,'2026-01-03','2026-01-22'),(003,3,'2025-06-15','2025-07-02'),(004,4,'2026-02-07','2026-02-20');
select*from admission


create table salary (
salary_id int primary key auto_increment,
staff_id int,
net_salary decimal(6,2),
payment_date date
)


alter table salary
modify column net_salary decimal(8,2);

insert into salary(staff_id,net_salary,payment_date)
values(901,55000,'2025-11-14'),(902,280000,'2025-06-18'),(903,90000,'2025-03-20'),(904,840000,'2025-09-19');

update salary
set net_salary=350000
where salary_id=2
select*from salary

select*from room
where room_status="avaliable"

select*from doctor
where specialization="kindeny specialist"

select*from appointments
where appint_id in (401,404)

select doct_id,client_id,appointments_date, appoinmnet_time from appointments

select a.doctor_id,a.doctor_name,a.specialization,a.drpt_id,b.dp_id,b.dp_name,b.location
from doctor as a
inner join dprt as b on a.doctor_id=b.dp_id

 select*from salary
 
 select salary_id
 from salary
 where net_salary >50000;
 
select count(patient_id),patient_name from patients
group by patient_name having count(patient_id) >2



select count(appint_id) from appointments;


select* from rooms
where room_status="available";
select*from rooms

select*from appointments
where appointments_date>'2026-06-14';


select appointments_date, count(*) as total_appointments
from appointments
group by appointments_date;



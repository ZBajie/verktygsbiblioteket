drop database verktygsbibliotek;
create database verktygsbibliotek;
show databases;
use verktygsbibliotek;

create table uthyrare (
id int primary key auto_increment,
namn varchar(40),
adress varchar(40),
mobil varchar(20)
);
describe uthyrare;

create table verktyg (
id int primary key auto_increment,
namn varchar(40),
marke varchar(40),
pris int,
beskrivning varchar(400),
uthyrare_id int
);
describe verktyg;

create table bokning (
id int primary key auto_increment,
utdatum date,
indatum date,
verktyg_id int,
hyrare_id int
);
describe bokning;

create table hyrare (
id int primary key auto_increment,
namn varchar(40),
mobil varchar(20)
);

describe hyrare;
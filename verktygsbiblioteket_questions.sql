use verktygsbibliotek;

-- Verktyg som varje uthyrare har.
select  uthyrare.namn, verktyg.namn from uthyrare 
inner join verktyg on uthyrare.id = verktyg.uthyrare_id 
order by uthyrare.namn;

-- Alla bokade verktyg
select hyrare.namn as Hyrare, bokning.utdatum, bokning.indatum,
 to_days(bokning.indatum) - to_days(bokning.utdatum) as Hyrtid,
verktyg.namn, verktyg.pris, 
(to_days(bokning.indatum) - to_days(bokning.utdatum)) * verktyg.pris as Totalkostnad,
uthyrare.namn as uthyrare 
from hyrare 
inner join bokning on hyrare.id = bokning.hyrare_id 
inner join verktyg on verktyg.id = bokning.verktyg_id 
inner join uthyrare on uthyrare.id = verktyg.uthyrare_id 
order by hyrare.namn;

-- Alla bokade verktyg uthyrda av Leif
select hyrare.namn as Hyrare, bokning.utdatum, bokning.indatum,
 to_days(bokning.indatum) - to_days(bokning.utdatum) as Hyrtid,
verktyg.namn, verktyg.pris, 
(to_days(bokning.indatum) - to_days(bokning.utdatum)) * verktyg.pris as Totalkostnad,
uthyrare.namn as uthyrare 
from hyrare 
inner join bokning on hyrare.id = bokning.hyrare_id 
inner join verktyg on verktyg.id = bokning.verktyg_id 
inner join uthyrare on uthyrare.id = verktyg.uthyrare_id 
where uthyrare.namn = 'Leif'
order by hyrare.namn;

-- Alla bokade verktyg hyrda av John
select hyrare.namn as Hyrare, bokning.utdatum, bokning.indatum,
 to_days(bokning.indatum) - to_days(bokning.utdatum) as Hyrtid,
verktyg.namn, verktyg.pris, 
(to_days(bokning.indatum) - to_days(bokning.utdatum)) * verktyg.pris as Totalkostnad,
uthyrare.namn as uthyrare 
from hyrare 
inner join bokning on hyrare.id = bokning.hyrare_id 
inner join verktyg on verktyg.id = bokning.verktyg_id 
inner join uthyrare on uthyrare.id = verktyg.uthyrare_id 
where hyrare.namn = 'John'
order by hyrare.namn;

-- Verktygssorter som finns.
select distinct verktyg.namn as 'Verktyg' from verktyg;

-- Verktyg som inte är bokade
select verktyg.* from verktyg 
left join bokning on verktyg.id = bokning.verktyg_id
where bokning.verktyg_id is null;

-- Verktyg som inte är bokade ett vist datum
select verktyg.* from verktyg
left join bokning on verktyg.id = bokning.verktyg_id
where '2024-08-12' not between bokning.utdatum and bokning.indatum
or bokning.utdatum != '2024-08-12'
or bokning.indatum != '2024-08-12';

-- Intjänade pengar av Anders.
select sum((to_days(bokning.indatum) - to_days(bokning.utdatum)) * verktyg.pris) as total 
from verktyg 
inner join bokning on verktyg.id = bokning.verktyg_id 
inner join uthyrare on uthyrare.id = verktyg.uthyrare_id 
where uthyrare.namn = 'Anders';

-- Total hyreskostnad för Anna.
select sum((to_days(bokning.indatum) - to_days(bokning.utdatum)) * verktyg.pris) as total 
from verktyg 
inner join bokning on verktyg.id = bokning.verktyg_id 
inner join hyrare on hyrare.id = verktyg.uthyrare_id 
where hyrare.namn = 'Anna';
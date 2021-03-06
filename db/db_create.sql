drop database if exists konyvtar;

create database konyvtar
	DEFAULT CHARACTER SET utf8
	DEFAULT COLLATE utf8_general_ci;
    
use konyvtar;

create table konyv(
	id int primary key auto_increment,
	isbn nvarchar(13),
    cim nvarchar(255) not null,
	szerzo nvarchar(55),
    kiado nvarchar(55),
    megjelenesev int
);

insert into konyv (isbn, cim, szerzo, kiado, megjelenesev) values ('1234567890', 'Informatika 2 jegyzet, 1. példány', 'Vajk István, Asztalos Márk, Mészáros Tamás', 'BME/VIK', 2017);
insert into konyv (isbn, cim, szerzo, kiado, megjelenesev) values ('1234567890', 'Informatika 2 jegyzet, 2. példány', 'Vajk István, Asztalos Márk, Mészáros Tamás', 'BME/VIK', 2017);
insert into konyv (isbn, cim, szerzo, kiado, megjelenesev) values ('1234567890', 'Informatika 2 jegyzet, 3. példány', 'Vajk István, Asztalos Márk, Mészáros Tamás', 'BME/VIK', 2017);
insert into konyv (isbn, cim, szerzo, kiado, megjelenesev) values ('1234567890', 'Informatika 2 jegyzet, 4. példány', 'Vajk István, Asztalos Márk, Mészáros Tamás', 'BME/VIK', 2017);

insert into konyv (isbn, cim, szerzo, kiado, megjelenesev) values ('1449392776', 'Programming PHP: Creating Dynamic Web Pages, 1. példány', 'Kevin Tatroe, Peter MacIntyre, Rasmus Lerdorf', 'O\'Reilly', 2013);
insert into konyv (isbn, cim, szerzo, kiado, megjelenesev) values ('1449392776', 'Programming PHP: Creating Dynamic Web Pages, 2. példány', 'Kevin Tatroe, Peter MacIntyre, Rasmus Lerdorf', 'O\'Reilly', 2013);
insert into konyv (isbn, cim, szerzo, kiado, megjelenesev	) values ('1449392776', 'Programming PHP: Creating Dynamic Web Pages, 3. példány', 'Kevin Tatroe, Peter MacIntyre, Rasmus Lerdorf', 'O\'Reilly', 2013);


create table tag(
	id int  primary key auto_increment,
    nev nvarchar(55) not null,
    email nvarchar(45),
    telefon nvarchar(45)
);

insert into tag (nev, email, telefon) values ('Kis Pál', 'kis.pal@konyvtar.hu', '12345678');
insert into tag (nev, email, telefon) values ('Nagy Béla', 'nagy.bela@konyvtar.hu', '22345678');
insert into tag (nev, email, telefon) values ('Mészáros Tamás', 'meszaros.tamas@konyvtar.hu', '32345478');

create table kolcsonzes(
	id int primary key auto_increment,
	tagid int not null,
    konyvid int not null,
    kivitel date not null,
    vissza date,
    
    foreign key (konyvid) references konyv(id),
    foreign key (tagid) references tag(id)
);

insert into kolcsonzes (tagid, konyvid, kivitel, vissza) values (1, 1, subdate(curdate(), 50), subdate(curdate(), 10)); 
insert into kolcsonzes (tagid, konyvid, kivitel, vissza) values (1, 2, subdate(curdate(), 150), subdate(curdate(), 30)); 
insert into kolcsonzes (tagid, konyvid, kivitel, vissza) values (3, 3, subdate(curdate(), 1), null); 
insert into kolcsonzes (tagid, konyvid, kivitel, vissza) values (3, 5, subdate(curdate(), 2), null); 
insert into kolcsonzes (tagid, konyvid, kivitel, vissza) values (3, 6, subdate(curdate(), 3), subdate(curdate(), 1)); 


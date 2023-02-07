create database practicas_rentadas;
use practicas_rentadas;

create table tempresa (
idempresa INT(11),
razonsocial varchar(45),
cuil varchar (15),
calle varchar (45),
idloc int (11));

alter table tempresa add constraint constraint_idloc foreign key (idloc) references tloc(idloc);

create table trubro (
idrubro int (11),
descrubro varchar (45));

create table tpracticapublicacion (
idpractica int (11),
idempresa int (11),
falta date,
vacantes int (11),
mail varchar(45),
idrubro int (11),
fvencimiento date);

alter table tpracticapublicacion add constraint constraint_idrubro foreign key (idrubro) references trubro(idrubro);
alter table tpracticapublicacion add constraint constraint_idempresa foreign key (idempresa) references tempresa(idempresa);

create table tpracticaalumnos (
idpracticaalumn int (11),
tipodu int (11),
nrodu varchar (15),
fcomienzo date,
ffin date,
observaciones varchar (45));

create table tloc (
idloc int (11),
descloc varchar (45));
select * from tpracticaalumnos;
select * from tpracticapublicacion;

select * from tpracticaalumnos;
alter table tpracticaalumnos change tpracticapublialumn idpracticapublialumn int(11);
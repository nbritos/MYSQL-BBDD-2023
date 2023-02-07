/*volver a chequear solucion error 1452 sin quitar fkcheck*/

use practicas_rentadas;
SET foreign_key_checks=0; /* "soluciona" error 1452 */

insert into tempresa values (1,'Sistemas Analiticos','48857912356','Azcuenaga', 1);
insert into tempresa values (2,'Bernardo Lew','6955888741','Yrigoyen 695', 3);
insert into tempresa values (3,'Abbott','30-50084630-1','Ing. Enrique Butty 240', 1);
insert into tempresa values (4,'Biodiagnostico','11173457','Chaco 60', 2);
insert into tempresa values (5,'Luis Marsan','206697410','Malvinas 19', 4);

select * from tempresa;

/*----------------*/

insert into tloc values (1,'CABA');
insert into tloc values (2,'Buenos Aires');
insert into tloc values (3,'Bahia Blanca');
insert into tloc (idloc,descloc) 
values 	(4,'Santa Fe'),
		(5,'La Pampa');
        
select * from tloc;

/*----------------*/
insert into tpracticaalumnos (idpracticaalumn,idpracticapublialumn,tipodu,nrodu,fcomienzo,ffin,observaciones)
values (default,1,1,'44578692','2023-01-26','2023-05-20','Comienza tercer semana'),
(default,2,2,'92165487','2023-02-15','2023-07-31','Movilidad reducida'),
(default,1,2,'20465831','2023-02-01','2023-04-15',null),
(default,2,2,'92156489','2023-02-02','2023-04-15',null),
(default,2,1,'44521263','2023-02-02','2023-04-15','Lenguaje de señas'),
(default,2,1,'34096078','2023-02-02','2023-04-15','Becado'),
(default,2,1,'22547821','2023-02-02','2023-05-31','Front-end'),
(default,3,1,'33201524','2023-02-02','2023-05-31','Back-end'),
(default,2,1,'31265896','2023-02-02','2023-05-31','Base de datos')
;

select * from tpracticaalumnos;


/*Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
(`practicas_rentadas`.`tpracticaalumnos`, CONSTRAINT `constraint_idpractica` FOREIGN KEY (`idpracticaalumn`) 
REFERENCES `tpracticapublicacion` (`idpractica`))
*/
/*----------------*/

insert into tpracticapublicacion values (1,3,2023-01-24,9,'pasantias@abbott.com.ar',1,31-05-2023);
insert into tpracticapublicacion values (2,2,'2023-03-01',2,'pasantias@blew.com.ar',3,'31-07-2023');
insert into tpracticapublicacion values (3,1,'2023-02-01',5,'pasantias@sistemasanaliticos.com.ar',2,30-06-2023);
/*update tpracticapublicacion set falta ='2023-01-24', fvencimiento = '2023-05-31' where idpractica = 1;
update tpracticapublicacion set fvencimiento = '2023-07-31' where idpractica = 2;
update tpracticapublicacion set fvencimiento = '2023-06-30' where idpractica = 3;*/

select * from tpracticapublicacion;

/*----------------*/

insert into trubro values (1, 'Diagnostico');
insert into trubro values (2, 'Biología Molecular');
insert into trubro values (3, 'Investigación');
insert into trubro values (4, 'Cirugía experimental');
select * from trubro;
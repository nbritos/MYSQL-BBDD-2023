use practicas_rentadas;
select * from tempresa;
select * from tloc;
select * from tpracticaalumnos;
select * from tpracticapublicacion;
select * from trubro;

/* a. Cuantas vacantes fueron solicitadas en los diferentes rubros? CORREGIR / 
3/2/23 pareciera estar bien*/

/*por lo que se ve en el diagrama, faltaría una fk en la tabla tpracticaalumnos que me indique a que idpractica está anotado ese alumno:
alter table tpracticaalumnos add column tpracticapublialumn int(11) after idpracticaalumn; */

/*NO*/
select * from tpracticaalumnos join tpracticapublicacion on tpracticaalumnos.idpracticapublialumn = tpracticapublicacion.idpractica;

/*SI*/
select trubro.descrubro, count((tpracticaalumnos.idpracticapublialumn)) from tpracticaalumnos join tpracticapublicacion on 
tpracticapublicacion.idpractica = tpracticaalumnos.idpracticapublialumn join trubro on tpracticapublicacion.idrubro = trubro.idrubro 
group by trubro.descrubro; 

/*NO*/
select count(tpracticapublicacion.vacantes) total_vacantes_solicitadas, tpracticapublicacion.idrubro from tpracticaalumnos  
join tpracticapublicacion  
on tpracticaalumnos.idpracticaalumn=tpractica.tpracticapublicacion
group by tpracticapublicacion.idrubro;


/* b. Qué cantidad de publicaciones llegaron a encontrar todas las vacantes solicitadas? COMPLETAR*/


/* c. Cual es la/s empresa/s que más vacantes solicito?* HECHO/

/*NO VA*/
select tempresa.razonsocial, tpracticapublicacion.vacantes as mas_vacantes_soli from tpracticapublicacion join tempresa
on tpracticapublicacion.idempresa=tempresa.idempresa where tpracticapublicacion.vacantes = max(tpracticapublicacion.vacantes);

/*NO VA*/ select a.razonsocial from tempresa as a join 
(select max(tpracticapublicacion.vacantes) from tpracticapublicacion) as b on a.idempresa=b.idempresa;

/*SI SEÑOR*/
select tempresa.razonsocial, tpracticapublicacion.vacantes as mas_vacantes_soli from tpracticapublicacion join tempresa
on tempresa.idempresa = (select tpracticapublicacion.idempresa where 
tpracticapublicacion.vacantes = (select max(vacantes) from tpracticapublicacion));

/* d. Cual es la/s empresa/s que no realizo publicaciones? HECHO*/

select tempresa.razonsocial from tempresa where tempresa.idempresa not in (select idempresa from tpracticapublicacion);

/* e. En el sistema de prácticas rentadas para el año que viene, se está pensando analizar la práctica de los alumnos con información
más detallada. La empresa nos brindará información a partir de los 3 meses de las actividades de los alumnos, 
llegando a concluir con el "Fin de Período de Prueba",FPP, indicando si renueva, finaliza o se solicita un cambio de alumno. 
Para registrar este requerimiento, ¿qué cambios realizaría en el modelo? COMPLETAR*/
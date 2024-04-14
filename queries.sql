/*1

select kodikos_ekthematos,imerominia_kataskevis
from ekthema;

/*2

select *
from sxolio
where poli="kozani";

/*3

select *
from sxolio
where poli="kozani" AND LEFT(katigoria,4) = "high";

/*4

select plithos_ekthematon
from sxolio s,episkeptete ep,ekthesi ek
where s.titlos=ep.titlos AND ep.arithmos_ekthesis = ek.arithmos_ekthesis AND poli LIKE "%new%";


/*5

select poli
from sxolio s,episkeptete ep
where s.titlos = ep.titlos
GROUP BY poli
Having count(ep.titlos)>1

/*6
select arithmos_kratisis,prokatavoli
from kratisi k,sxolio s
where k.titlos = s.titlos AND s.poli="kozani" 
order by prokatavoli ASC

/*7
select DISTINCT s.titlos
from sxolio s , episkeptete ep, ekthesi ek
where s.titlos = ep.titlos AND ep.arithmos_ekthesis = ek.arithmos_ekthesis AND (ek.katigoria="logotexnia" OR ek.katigoria="zografiki") AND s.titlos not in(
	select s1.titlos
	from sxolio s1 , episkeptete ep1, ekthesi ek1
	where s1.titlos = ep1.titlos AND ep1.arithmos_ekthesis = ek1.arithmos_ekthesis AND ek1.katigoria = "gliptiki");

/*8
select s.poli
from sxolio s,ekthesi ek, episkeptete ep
where s.titlos = ep.titlos AND ep.arithmos_ekthesis = ek.arithmos_ekthesis AND s.katigoria="dimotiko" AND ek.katigoria="logotexnia" AND s.titlos in (
	select s1.titlos
	from sxolio s1 , episkeptete ep1, ekthesi ek1
	where s1.titlos = ep1.titlos AND ep1.arithmos_ekthesis = ek1.arithmos_ekthesis AND ek1.katigoria = "zografiki");

/*9

select DISTINCT ek.plithos_ekthematon
from sxolio s , episkeptete ep, ekthesi ek
where s.titlos=ep.titlos AND ep.arithmos_ekthesis = ek.arithmos_ekthesis AND s.titlos IN (
	select s2.titlos
	from ekthesi ek2, erotimatologio er2 ,sxolio s2
	where ek2.arithmos_ekthesis = er2.arithmos_ekthesis AND er2.titlos=s2.titlos AND er2.vathmos>=5);

*/









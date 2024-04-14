drop database if exists mouseio;
create database mouseio;
use mouseio;


create table ekthesi(
    arithmos_ekthesis int(10) auto_increment primary key,
    imerominia_enarxis varchar(10) not null,
    imerominia_lixis varchar(10) not null,
    plithos_atomon int(10),
	plithos_ekthematon int(10),
    katigoria varchar(10) not null,
    check (katigoria='logotexnia' or katigoria='zografiki' or katigoria='gliptiki' or katigoria='theatro'),
    check (plithos_atomon<=200)
);

create table ekthema(
    kodikos_ekthematos int(10) auto_increment primary key,
    imerominia_kataskevis varchar(10) not null,
    arithmos_ekthesis int(10),
    foreign key (arithmos_ekthesis) references ekthesi(arithmos_ekthesis),
    perigrafi text
);

create table sxolio(
	titlos varchar(80) primary key,
    poli varchar(30),
    katigoria varchar(20) not null,
    check (katigoria='gymnasio' or katigoria='high school' or katigoria='dimotiko')
);

create table xenagisi(
	auxon_arithmos int(10) auto_increment primary key,
    ora_enarxis varchar(10) not null,
    ora_lixis varchar(10) not null,
    imerominia varchar(10) not null,
    arithmos_ekthesis int(10),
    foreign key (arithmos_ekthesis) references ekthesi(arithmos_ekthesis)
);

create table kratisi(
    prokatavoli float(10) not null,
    arithmos_kratisis int(10) auto_increment primary key,
    titlos varchar(80),
    auxon_arithmos int(10),
    foreign key (auxon_arithmos) references xenagisi(auxon_arithmos),
    foreign key (titlos) references sxolio(titlos)
);

create table episkeptete(
    plithos_mathiton int(10),
    titlos varchar(80),
    arithmos_ekthesis int(10),
    foreign key (titlos) references sxolio(titlos),
    foreign key (arithmos_ekthesis) references ekthesi(arithmos_ekthesis)
);

create table erotimatologio(
    arithmos_erotimatologiou int(10) auto_increment primary key,
    agapimeno_ekthemata int(10),
    apantiseis text,
    sxolia text,
    vathmos int(10) not null,
    titlos varchar(80),
    arithmos_ekthesis int(10),
    foreign key (titlos) references sxolio(titlos),
    foreign key (arithmos_ekthesis) references ekthesi(arithmos_ekthesis),
    check (vathmos>=0 and vathmos<=10)
);


INSERT INTO ekthesi(imerominia_enarxis,imerominia_lixis,plithos_atomon,plithos_ekthematon,katigoria) VALUES ("23/4/2018","25/6/2018",150,30,"theatro");
INSERT INTO ekthesi(imerominia_enarxis,imerominia_lixis,plithos_atomon,plithos_ekthematon,katigoria) VALUES ("2/2/2018","3/3/2018",140,45,"gliptiki");
INSERT INTO ekthesi(imerominia_enarxis,imerominia_lixis,plithos_atomon,plithos_ekthematon,katigoria) VALUES ("3/4/2018","25/6/2018",155,12,"zografiki");
INSERT INTO ekthesi(imerominia_enarxis,imerominia_lixis,plithos_atomon,plithos_ekthematon,katigoria) VALUES ("5/7/2018","25/8/2018",90,50,"logotexnia");

INSERT INTO ekthema(imerominia_kataskevis,perigrafi,arithmos_ekthesis) VALUES ("700 bc","amforeas",1);
INSERT INTO ekthema(imerominia_kataskevis,perigrafi,arithmos_ekthesis) VALUES ("12/9/1967","kouros",2);

INSERT INTO sxolio(poli,katigoria,titlos) VALUES ("kozani","high school","6o high school kozanis");
INSERT INTO sxolio(poli,katigoria,titlos) VALUES ("kozani","dimotiko","3o dimotiko kozanis");
INSERT INTO sxolio(poli,katigoria,titlos) VALUES ("Thessaloniki","gymnasio","2 gymnasio thessalonikis");
INSERT INTO sxolio(poli,katigoria,titlos) VALUES ("Thessaloniki","gymnasio","3 gymnasio thessalonikis");
INSERT INTO sxolio(poli,katigoria,titlos) VALUES ("new york","gymnasio","3 gymnasio new york");

INSERT INTO xenagisi(ora_enarxis,ora_lixis,imerominia,arithmos_ekthesis) VALUES ("18:00","20:00","30/2/2017",1);
INSERT INTO xenagisi(ora_enarxis,ora_lixis,imerominia,arithmos_ekthesis) VALUES ("14:00","21:30","29/1/2014",2);

INSERT INTO episkeptete(plithos_mathiton,titlos,arithmos_ekthesis) VALUES (12,"6o high school kozanis",2);
INSERT INTO episkeptete(plithos_mathiton,titlos,arithmos_ekthesis) VALUES (20,"3o dimotiko kozanis",3);
INSERT INTO episkeptete(plithos_mathiton,titlos,arithmos_ekthesis) VALUES (22,"2 gymnasio thessalonikis",1);
INSERT INTO episkeptete(plithos_mathiton,titlos,arithmos_ekthesis) VALUES (20,"3o dimotiko kozanis",3);
INSERT INTO episkeptete(plithos_mathiton,titlos,arithmos_ekthesis) VALUES (22,"3 gymnasio thessalonikis",1);
INSERT INTO episkeptete(plithos_mathiton,titlos,arithmos_ekthesis) VALUES (22,"3 gymnasio thessalonikis",2);
INSERT INTO episkeptete(plithos_mathiton,titlos,arithmos_ekthesis) VALUES (22,"3 gymnasio thessalonikis",3);
INSERT INTO episkeptete(plithos_mathiton,titlos,arithmos_ekthesis) VALUES (22,"3 gymnasio new york",3);
INSERT INTO episkeptete(plithos_mathiton,titlos,arithmos_ekthesis) VALUES (20,"3o dimotiko kozanis",4);



INSERT INTO kratisi(prokatavoli,titlos,auxon_arithmos) VALUES (1000,"2 gymnasio thessalonikis",1);
INSERT INTO kratisi(prokatavoli,titlos,auxon_arithmos) VALUES (1300,"6o high school kozanis",1);
INSERT INTO kratisi(prokatavoli,titlos,auxon_arithmos) VALUES (1500,"3o dimotiko kozanis",2);

INSERT INTO erotimatologio(agapimeno_ekthemata,apantiseis,sxolia,vathmos,titlos,arithmos_ekthesis) VALUES (1,"DAASDASDA","ASDHASDASAD",7,"2 gymnasio thessalonikis",1);
INSERT INTO erotimatologio(agapimeno_ekthemata,apantiseis,sxolia,vathmos,titlos,arithmos_ekthesis) VALUES (1,"gyrgrfrbhref","kvsvisd7wewr",9,"6o high school kozanis",2);
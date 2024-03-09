create database centerFormatin;
use centerFormatin;
create table etudiant (
	num_CNIEtu varchar(10) primary key,
    nom_Etu varchar(45),
    prenomEtu varchar(45),
    dateNaissance date,
    adressEtu varchar(45),
    villeEtu varchar(45),
    niveauEtu varchar(45)
);
create table sessionn(
	codeSess int primary key,
	nomSess varchar(45),
	dateDebut date,
	dateFin varchar(45)
);
create table inscription(
codeSess int,
foreign key (codeSess) references sessionn(codeSess),
num_CNIEtu varchar(10),
foreign key (num_CNIEtu) references etudiant(num_CNIEtu),
typeCours varchar(45)
);

create table formation(
	codeForm int primary key,
    titleForm varchar(45),
	dureeForm double,
    prixForm double,
    sesson_codeSess int,
    foreign key (sesson_codeSess) references sessionn(codeSess)
);
create table specialitre(
	codeSpec int primary key,
    nomSpec varchar(45),
    descSpec varchar(45)
);

create table catalogue(
	codeSpec int,
    foreign key (codeSpec) references specialitre(codeSpec),
    codeForm int,
    foreign key (codeForm) references formation(codeForm)
    
);
alter table inscription
modify typeCours varchar(45) not null;
alter table sessionn
add check (dateFin>dateDebut);
alter table specialitre
add acitive varchar(45);



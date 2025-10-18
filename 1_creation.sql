create table animal (
  id_ani int not null,
  espece varchar (50) not null ,
  nom varchar (50) not null , 
  race varchar(50) not  null ,
  sexe varchar(1) not  null ,
  etatsante text  ,
  datenaissance date  ,
  datearrivee date  , 
  statut varchar(50) not  null ,
  primary key ( id_ani , race ) ) ; 
  
create table  cage (
   num_cage int not null ,
   capacite int not null ,
   primary key ( num_cage)); 
   
   create table veterinaire( 
   id_vet int not null ,
   nom_vet varchar(30),
   prenom_vet varchar (30),
   tel_vet int not null , 
   primary  key ( id_vet, tel_vet )) ; 
   
create table soins ( 
 id_soin int not null,
 type_soin varchar (50) , 
 primary key ( id_soin));
 
 create table adoption ( 
  id_ad int not null ,
  nom_ad varchar (50) ,
  prenom_ad varchar (50), 
  date_adopt date ,
  tel_ad int not null , 
  primary key ( id_ad, tel_ad ));

 
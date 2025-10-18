alter table animal 
	add num_cage int not null ;
    
alter table animal 
	add constraint fk_animal_cage foreign key (num_cage) references cage (num_cage); 
    
ALTER TABLE animal 
	add id_ad int not null,
    add tel_ad int not null,
    add constraint fk_animal_adoption foreign key (id_ad, tel_ad) references adoption (id_ad, tel_ad);
    
CREATE TABLE ADMINISTRER (
  id_ani INT NOT NULL,
  id_soin int not null,
  id_vet int not null,
  tel_vet int not null , 
  dateSoin date ,
  primary key (id_ani, id_vet,tel_vet, id_soin),
  foreign key  (id_ani) references animal(id_ani)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
foreign key (id_soin) references soins(id_soin)
	on delete cascade
    on update cascade,

foreign key  (id_vet,tel_vet) references  veterinaire(id_vet,tel_vet)
    on delete cascade
    on update cascade
);





 

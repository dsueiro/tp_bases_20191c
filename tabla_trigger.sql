create table alertas ( 
	id int(10) unsigned not null auto_increment,
	titulo varchar(100), 
	cuerpo text, 
	enviado boolean default false, 
	email varchar(100),
	primary key (id)
);


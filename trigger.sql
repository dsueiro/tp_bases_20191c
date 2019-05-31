DELIMITER //

CREATE TRIGGER notificar_bajo_inventario 
AFTER UPDATE
   ON Reside FOR EACH ROW

BEGIN
	DECLARE elemento varchar(100);
	DECLARE nombre_area varchar(100);
	DECLARE limite int(10) unsigned;
	DECLARE email varchar(100);

	set limite := 10;
	set email := 'alerta_inventario@example.com';

	IF new.inventario < limite then
		select denominacionVulgar into elemento from ElementoNatural
			where denominacionCientifica = new.denominacionCientifica;

		select nombre into nombre_area from Area 
			where idParque = new.idParque and codigo = new.codigoArea;

		insert into alertas (titulo, cuerpo, email) values
		(
			'Elemento Natural en peligro',
			concat('El elemento ', 
			elemento,
			' tiene menos de ',
			limite,
			' ejemplares en ',
			nombre_area),
			email
		);
	END IF;

END; //

DELIMITER ;


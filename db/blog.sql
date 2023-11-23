DROP DATABASE IF EXISTS blog;
CREATE DATABASE blog;
USE blog;

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
    id INT AUTO_INCREMENT NOT NULL,
    titulo TEXT NOT NULL,
    autor VARCHAR(40) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_publicacion DATE NOT NULL,
    active BOOLEAN,
    PRIMARY KEY (id)
);

DROP PROCEDURE IF EXISTS crear_post;
DELIMITER //

	CREATE PROCEDURE crear_post(
    IN titulo_value TEXT,
    IN autor_value VARCHAR(40),
    IN descripcion_value TEXT,
    IN fecha_publicacion_value DATE
)
BEGIN
    INSERT INTO posts (
        titulo,
        autor,
        descripcion,
        fecha_publicacion,
        active
	)
	
    VALUES (
	titulo_value,
	autor_value,
    descripcion_value,
    fecha_publicacion_value,
	true
	);
    
    SELECT id, titulo, autor, descripcion, DATE_FORMAT(fecha_publicacion, '%d-%m-%Y') as fecha_publicacion FROM posts WHERE active = true;
END //
DELIMITER ;

CALL crear_post('El arte de la fotografía', 'Luis Méndez', 'La fotografía es una forma de arte que permite capturar momentos y emociones. Con una cámara en mano, puedes explorar el mundo a través de un lente y compartir tu visión con los demás. En este post, compartiré algunos consejos y técnicas para mejorar tus habilidades fotográficas.', '2023-11-27');
CALL crear_post('Viaje a las estrellas: astronomía para principiantes', 'Sofía Martínez', 'La astronomía es una ciencia fascinante que nos permite explorar el universo sin salir de casa. Con un telescopio y un poco de paciencia, puedes descubrir constelaciones, planetas e incluso galaxias lejanas. En este post, te guiaré a través de los primeros pasos en tu viaje astronómico.', '2023-11-28');
CALL crear_post('Reseña del libro "Cien años de soledad"', 'Jorge Hernández', 'Cien años de soledad es una obra maestra de la literatura latinoamericana. Escrita por Gabriel García Márquez, esta novela narra la historia de la familia Buendía a lo largo de siete generaciones en el ficticio pueblo de Macondo. Con su estilo de realismo mágico, Márquez nos sumerge en un mundo donde lo extraordinario se vuelve cotidiano.', '2023-11-29');
CALL crear_post('Ejercicios de yoga para principiantes', 'Isabel Torres', 'El yoga es una práctica milenaria que combina posturas físicas, técnicas de respiración y meditación. No solo mejora la flexibilidad y la fuerza, sino que también ayuda a reducir el estrés y a cultivar la atención plena. En este post, te enseñaré algunas posturas básicas de yoga que puedes hacer en casa.', '2023-11-30');
CALL crear_post('La historia de la música rock', 'David Ramírez', 'El rock es un género musical que ha evolucionado a lo largo de las décadas, desde sus raíces en el blues y el country hasta las diversas subculturas que existen hoy en día. En este post, exploraremos la historia del rock, desde los pioneros de los años 50 hasta las bandas contemporáneas.', '2023-12-01');
CALL crear_post('Viaje a la playa', 'Juan Pérez', 'Hoy visité la playa más hermosa de Sinaloa. El sol brillaba en el cielo azul y la arena estaba caliente bajo mis pies. Pasé el día nadando en el mar y construyendo castillos de arena. Fue un día perfecto.', '2023-11-22');
CALL crear_post('Receta de tacos al pastor', 'María Rodríguez', 'Los tacos al pastor son un platillo tradicional mexicano que se ha vuelto popular en todo el mundo. Hoy, te compartiré mi receta secreta. Primero, necesitas carne de cerdo marinada en una mezcla de chiles, achiote y especias. Luego, se asa en un trompo y se sirve en tortillas de maíz con piña, cilantro y cebolla.', '2023-11-23');
CALL crear_post('Reseña de la película Dune', 'Carlos López', 'La película Dune es una adaptación impresionante de la novela de ciencia ficción de Frank Herbert. La dirección de Denis Villeneuve es magistral y la actuación de Timothée Chalamet como Paul Atreides es notable. La trama es compleja y fascinante, y los efectos visuales son impresionantes. Definitivamente, es una película que no te puedes perder.', '2023-11-24');
CALL crear_post('Cómo cultivar tomates', 'Ana Gómez', 'Cultivar tomates en casa puede ser una actividad muy gratificante. No solo tendrás tomates frescos para tus ensaladas y salsas, sino que también podrás disfrutar del proceso de ver crecer tus propias plantas. Para empezar, necesitas semillas de tomate, tierra fértil y un lugar con buena luz solar. Con un poco de cuidado y paciencia, pronto tendrás una cosecha abundante.', '2023-11-25');
CALL crear_post('El impacto del cambio climático', 'Pedro Sánchez', 'El cambio climático es uno de los mayores desafíos de nuestro tiempo. Los gases de efecto invernadero emitidos por la actividad humana están causando un calentamiento global que tiene consecuencias devastadoras para nuestro planeta. Las temperaturas están aumentando, los glaciares se están derritiendo y los eventos climáticos extremos son cada vez más frecuentes. Es crucial que tomemos medidas para reducir nuestras emisiones y adaptarnos a este nuevo clima.', '2023-11-26');

DROP PROCEDURE IF EXISTS eliminar_post;
DELIMITER //

	CREATE PROCEDURE eliminar_post(
    IN id_value INT
)
BEGIN
	
	UPDATE posts SET active = false where id = id_value;
    SELECT * FROM posts WHERE active = true;
END //
    
DELIMITER ;
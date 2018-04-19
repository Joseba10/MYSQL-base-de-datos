/*A fecha de hoy,cuantos trabajan,donde y cuando empezo*/

/*SELECT 
		u.nombre,e.nombre,fecha_inicio
		
FROM

	usuario_empresa as ue,
	usuario as u,
	empresa as e


WHERE 
		u.id= ue.id_usuario
		and e.id=ue.id_empresa
	 	and fecha_fin IS NULL;*/
		
		
/*Lista de desempleados y nombre de emp*/

/*SELECT * FROM usuario where id NOT IN(
SELECT 
	id_usuario
		
FROM


	usuario_empresa



WHERE 
	
	 	 fecha_fin IS NULL);*/

/*SELECT u.id, u.nombre, e.nombre , fecha_fin
  FROM usuario as u, usuario_empresa as ue, empresa as e 
WHERE ue.id_empresa=e.id and ue.id_usuario =u.id and
u.id not in (
SELECT  ue.id_usuario FROM usuario_empresa AS ue
WHERE  fecha_fin IS NULL)
and fecha_fin =
(select Max(fecha_fin) from usuario_empresa as uee where uee.id_usuario =u.id)*/


/*Listado de contrato>365 dias*/

/*
SELECT
	u.nombre AS nombre_usuario,
	e.nombre AS nombre_empresa,
	IF (ue.fecha_fin IS NULL, DATEDIFF(NOW(), ue.fecha_inicio), DATEDIFF(ue.fecha_fin, ue.fecha_inicio)) AS dias_contrato
	
FROM
	usuario AS u,
	empresa AS e,
	usuario_empresa AS ue
WHERE
	u.id = ue.id_usuario AND
	e.id = ue.id_empresa AND
	IF (ue.fecha_fin IS NULL, DATEDIFF(NOW(), ue.fecha_inicio), DATEDIFF(ue.fecha_fin, ue.fecha_inicio)) > 365;
	
*/

/*Numero de dias que los trabajadores han estado trabajando*/
/*
SELECT
	u.nombre AS nombre_usuario,
	e.nombre AS nombre_empresa,
	ue.fecha_inicio,
	DATEDIFF(NOW(), ue.fecha_inicio) AS dias_trabajando
FROM
	usuario AS u,
	empresa AS e,
	usuario_empresa AS ue
WHERE
	u.id = ue.id_usuario AND
	e.id = ue.id_empresa AND
	ue.fecha_fin IS NULL;
*/

/*Numero de dias que los trabajadores han estado en paro*/

/*
SELECT 
	u.nombre AS nombre_usuario,
	e.nombre AS nombre_empresa,
	ue.fecha_fin AS fecha_desempleo,
	DATEDIFF(NOW(), ue.fecha_fin) AS dias_desempleado

FROM 		
	usuario AS u,
	usuario_empresa AS ue,
	empresa AS e	

WHERE 
	u.id = ue.id_usuario AND
	e.id = ue.id_empresa AND
	u.id NOT IN (
		SELECT ue.id_usuario FROM usuario_empresa AS ue WHERE ue.fecha_fin IS NULL
		) AND
	fecha_fin = (
		SELECT MAX(fecha_fin)
		FROM usuario_empresa as uee
		WHERE uee.id_usuario = u.id
		);
*/

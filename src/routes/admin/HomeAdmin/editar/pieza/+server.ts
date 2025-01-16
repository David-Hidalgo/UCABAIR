//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';
import type { RequestHandler } from './$types';

export const PUT: RequestHandler = async ({ request }) => {
	const rq = await request.json();
	console.log(rq);
	const { pieza, codigo_viejo } = rq;
	const respuesta =
		await dbPostgre`CALL editar_pieza(${pieza.nombre_tp}, ${pieza.descripcion_tp},${pieza.fk_tipo_pieza},${pieza.precio_unidad_tp}, ${codigo_viejo})`;

	return json({ respuesta }, { status: 201 });
};

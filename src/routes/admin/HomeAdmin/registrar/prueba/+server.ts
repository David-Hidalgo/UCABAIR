//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';
import type { RequestHandler } from './$types';

export const POST: RequestHandler = async ({ request }) => {
	const { nombre_tp, descripcion_tp, duracion_estimada_tp } = await request.json();

	const respuesta =
		await dbPostgre`CALL insertar_tipo_prueba(${nombre_tp}, ${descripcion_tp}, ${duracion_estimada_tp})`;

	return json({ respuesta }, { status: 201 });
};

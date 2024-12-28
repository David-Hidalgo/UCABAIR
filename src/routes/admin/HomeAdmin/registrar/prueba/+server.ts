//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import {dbPostgre } from '$lib/server/db';

export async function POST({ request }) {
	const { codigo_tp,nombre_tp,descripcion_tp,duracion_tp} = await request.json();
	
	const respuesta = await dbPostgre`CALL insertar_tipo_prueba(${codigo_tp}, ${nombre_tp}, ${descripcion_tp}, ${duracion_tp})`;

	return json({ respuesta }, { status: 201 });
}

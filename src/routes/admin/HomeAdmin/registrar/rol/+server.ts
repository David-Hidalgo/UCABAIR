//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import {dbPostgre } from '$lib/server/db';

export async function POST({ request }) {
	const { codigo_rol,nombre_rol,descripcion_rol} = await request.json();
	
	const respuesta = await dbPostgre`CALL insertar_rol(${codigo_rol}, ${nombre_rol}, ${descripcion_rol})`;

	return json({ respuesta }, { status: 201 });
}

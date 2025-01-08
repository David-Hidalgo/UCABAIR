//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';
//import type { RequestHandler } from './$types';

export async function DELETE({ request }) {
	const codigo_rol = await request.json();

	const respuesta = await dbPostgre`CALL eliminar_rol(${codigo_rol})`;

	return json({ respuesta }, { status: 201 });
}

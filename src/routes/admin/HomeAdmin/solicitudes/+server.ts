//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';
//import type { RequestHandler } from './$types';

export async function PUT({ request }) {
	const fk_compra = await request.json();

	const respuesta = await dbPostgre`CALL cambiar_estatus_compra(${fk_compra})`;

	return json({ respuesta }, { status: 201 });
}

import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';
import type { RequestHandler } from './$types';

export const POST: RequestHandler = async ({ request }) => {
	const { nombre_car } = await request.json();

	const [respuesta] = await dbPostgre`CALL insertar_caracteristica(${nombre_car},1)`;

	return json({ respuesta }, { status: 201 });
};

//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import {dbPostgre } from '$lib/server/db';
//import type { RequestHandler } from './$types';


export async function DELETE({ request }) {
	const codigo_com = await request.json();
	
    
	const respuesta = await dbPostgre`CALL eliminar_cliente(${codigo_com})`;

	return json({ respuesta }, { status: 201 });
}
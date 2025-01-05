//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import {dbPostgre } from '$lib/server/db';

export async function POST({ request }) {
	const { codigo_tmp,nombre_tmp,descripcion_tmp,unidad_medida_tmp} = await request.json();
	
	const respuesta = await dbPostgre`CALL insertar_tipo_materia_prima(${codigo_tmp}, ${nombre_tmp},
						${descripcion_tmp},${unidad_medida_tmp})`;

	return json({ respuesta }, { status: 201 });
}

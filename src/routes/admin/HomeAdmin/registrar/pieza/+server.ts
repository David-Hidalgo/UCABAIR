//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import {dbPostgre } from '$lib/server/db';

export async function POST({ request }) {
	const { codigo_tp,nombre_tp,descripcion_tp,precio_unidad_tp,fk_tipo_pieza} = await request.json();
	
	if (fk_tipo_pieza === null) {
		const respuesta = await dbPostgre`CALL insertar_tipo_pieza(${codigo_tp}, ${nombre_tp},
											${descripcion_tp}, NULL, ${precio_unidad_tp})`;
	
	return json({ respuesta }, { status: 201 });

	} else {
	const respuesta = await dbPostgre`CALL insertar_tipo_pieza(${codigo_tp}, ${nombre_tp},
									 ${descripcion_tp}, ${fk_tipo_pieza}, ${precio_unidad_tp})`;
	return json({ respuesta }, { status: 201 });
	}
}
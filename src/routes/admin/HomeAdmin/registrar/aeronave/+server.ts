//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import {dbPostgre } from '$lib/server/db';

export async function POST({ request }) {
	const { codigo_ma,nombre_ma,descripcion_ma,precio_unidad_ma,fk_modelo_avion} = await request.json();
	
	if (fk_modelo_avion == 0) {
	const respuesta = await dbPostgre`CALL insertar_aeronave(${codigo_ma}, ${nombre_ma}, 
									${descripcion_ma}, ${precio_unidad_ma}, NULL)`;

	return json({ respuesta }, { status: 201 });
	}
	else {
	const respuesta = await dbPostgre`CALL insertar_aeronave(${codigo_ma}, ${nombre_ma}, 
									${descripcion_ma}, ${precio_unidad_ma}, ${fk_modelo_avion})`;
	return json({ respuesta }, { status: 201 });
	}

}

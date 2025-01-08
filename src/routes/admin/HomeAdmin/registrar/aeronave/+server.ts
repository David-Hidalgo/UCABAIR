//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';
import type { RequestHandler } from './$types';

export const POST: RequestHandler = async ({request}) => {
	const {nombre_ma, descripcion_ma, precio_unidad_ma, fk_modelo_avion} =
		await request.json();

	if (fk_modelo_avion == 0) {
		const [respuesta] = await dbPostgre`CALL insertar_aeronave(${nombre_ma}, 
									${descripcion_ma}, ${precio_unidad_ma}, NULL, 1)`;
									console.log(respuesta);
		return json({ respuesta }, { status: 201 });
	} else {
		const [respuesta] = await dbPostgre`CALL insertar_aeronave(${nombre_ma}, 
									${descripcion_ma}, ${precio_unidad_ma}, ${fk_modelo_avion}, 1)`;
		console.log(respuesta);
		return json({ respuesta }, { status: 201 });
	}
}

//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';
import type { RequestHandler } from './$types';

export const POST: RequestHandler = async ({ request }) => {
	const { nombre_ma, descripcion_ma, precio_unidad_ma, fk_modelo_avion } = await request.json();

	if (fk_modelo_avion == 0) {
		const [respuesta] = await dbPostgre`CALL insertar_aeronave(${nombre_ma}, 
									${descripcion_ma}, ${precio_unidad_ma}, NULL, 1)`;

		return json({ respuesta }, { status: 201 });
	} else {
		const [respuesta] = await dbPostgre`CALL insertar_aeronave(${nombre_ma}, 
									${descripcion_ma}, ${precio_unidad_ma}, ${fk_modelo_avion}, 1)`;

		return json({ respuesta }, { status: 201 });
	}
};
export const PUT: RequestHandler = async ({ request }) => {
	const { aeronave, pie } = await request.json();

	const [respuesta] =
		await dbPostgre`INSERT INTO configuracion_avion (cantidad_pieza_ca, fk_tipo_pieza, fk_modelo_avion, fk_sede) VALUES
        (1, ${pie.codigo_tp}, ${aeronave.codigo_ma}, 1);`;
	console.log(respuesta);
	return json({ respuesta }, { status: 201 });
};

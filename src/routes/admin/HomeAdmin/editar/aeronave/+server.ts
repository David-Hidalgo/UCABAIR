import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';
import type { RequestHandler } from './$types';

export const PUT: RequestHandler = async ({ request }) => {
	const { aeronave, codigo_viejo } = await request.json();

	console.log(aeronave);
	let respuesta = null;
	if (aeronave.fk_modelo_avion) {
		respuesta =
			await dbPostgre`CALL editar_aeronave(${aeronave.codigo_ma}, ${aeronave.nombre_ma}, ${aeronave.descripcion_ma},
        ${aeronave.precio_unidad_ma},${aeronave.fk_modelo_avion},${codigo_viejo})`;
	} else {
		respuesta =
			await dbPostgre`CALL editar_aeronave(${aeronave.codigo_ma}, ${aeronave.nombre_ma}, ${aeronave.descripcion_ma},
            ${aeronave.precio_unidad_ma},NULL,${codigo_viejo})`;
	}

	return json({ respuesta }, { status: 201 });
};

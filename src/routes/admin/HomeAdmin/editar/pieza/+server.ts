//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';

export async function PUT({ request }) {
	const { tipo_pieza,codigo_viejo } = await request.json();
	
	const respuesta =
		await dbPostgre`CALL editar_tipo_pieza(${tipo_pieza.codigo_tp}, ${tipo_pieza.nombre_tp}, ${tipo_pieza.descripcion_tp},${tipo_pieza.fk_tipo_pieza},${tipo_pieza.precio_unidad_tp}, ${codigo_viejo})`;

	return json({ respuesta }, { status: 201 });
}

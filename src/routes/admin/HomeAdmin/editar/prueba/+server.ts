//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';

export async function PUT({ request }) {
	const { tipo_prueba,codigo_viejo } = await request.json();
	// const userid = cookies.get('userid');
	
	const respuesta =
		await dbPostgre`CALL editar_tipo_prueba(${tipo_prueba.codigo_tp}, ${tipo_prueba.nombre_tp}, ${tipo_prueba.descripcion_tp},${tipo_prueba.duracion_estimada_tp}, ${codigo_viejo})`;

	return json({ respuesta }, { status: 201 });
}

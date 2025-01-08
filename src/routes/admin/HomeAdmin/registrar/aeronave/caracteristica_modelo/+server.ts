import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';

export async function POST({ request }) {
	const { valor_cm, unidad_medida_cm, fk_caracteristica, fk_modelo_avion } = await request.json();

	const respuesta = await dbPostgre`CALL insertar_caracteristica_modelo(${valor_cm},
                                     ${unidad_medida_cm},${fk_caracteristica},${fk_modelo_avion})`;

	return json({ respuesta }, { status: 201 });
}

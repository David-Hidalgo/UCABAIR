import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';
import type { RequestHandler } from './$types';

export const PUT: RequestHandler = async ({ request }) => {
	const {
		direccion,
		monto_acreditado,
		fecha_inicio_operacion,
		tipo,
		nacionalidad,
		fk_lugar,
		fk_usuario,
		tipo_persona,
		rif,
		denominacion_persona,
		razon_social,
		pagina_web,
		viejo_codigo
	} = await request.json();
	console.log(
		direccion,
		monto_acreditado,
		fecha_inicio_operacion,
		tipo,
		nacionalidad,
		fk_lugar,
		fk_usuario,
		tipo_persona,
		rif,
		denominacion_persona,
		razon_social,
		pagina_web,
		viejo_codigo
	);

	const [respuesta] =
		await dbPostgre`CALL editar_persona(${direccion}, ${monto_acreditado}, ${fecha_inicio_operacion},
                        ${tipo},${nacionalidad},${fk_lugar},${fk_usuario},${tipo_persona},${rif},${denominacion_persona}
                        ,${razon_social},${pagina_web},NULL,NULL,NULL,
                        NULL,NULL,${viejo_codigo})`;

	return json({ respuesta }, { status: 201 });
};

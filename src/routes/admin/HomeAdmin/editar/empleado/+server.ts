import { json, type RequestHandler } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';
import type { Empleado } from '$lib/server/db/schema';

export const PUT: RequestHandler = async ({ request }) => {
	const { empleado, codigo_viejo } = await request.json();
	console.log(empleado, codigo_viejo);

	const respuesta =
		await dbPostgre`CALL editar_empleado(${empleado.codigo_empleado_per}, ${empleado.primer_nombre_per}, ${empleado.segundo_nombre_per},
                        ${empleado.primer_apellido_per},${empleado.segundo_apellido_per},${empleado.direccion_per},${empleado.fecha_inicio_servicio_per},
                        ${empleado.fk_lugar},${empleado.sueldo_per},${empleado.fk_usuario},${empleado.cedula_per},${codigo_viejo})`;

	return json({ respuesta }, { status: 201 });
};

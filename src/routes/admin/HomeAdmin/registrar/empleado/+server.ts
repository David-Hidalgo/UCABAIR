import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';

export async function POST({ request }) {
	const {
		codigo_empleado_per,
		cedula_per,
		primer_nombre_per,
		segundo_nombre_per,
		primer_apellido_per,
		segundo_apellido_per,
		direccion_per,
		fecha_inicio_servicio_per,
		sueldo_per,
		fk_usuario,
		fk_lugar
	} = await request.json();

	const respuesta = await dbPostgre`CALL insertar_empleado(${primer_nombre_per},
                            ${segundo_nombre_per},${primer_apellido_per},${segundo_apellido_per},
                            ${direccion_per},${fecha_inicio_servicio_per}, ${fk_lugar},
                            ${sueldo_per},${fk_usuario},${cedula_per})`;

	return json({ respuesta }, { status: 201 });
}

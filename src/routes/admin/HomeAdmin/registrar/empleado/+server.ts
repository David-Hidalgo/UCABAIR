import { json } from '@sveltejs/kit';
import {dbPostgre } from '$lib/server/db';

export async function POST({ request }) {
    const {codigo,primer_nombre,segundo_nombre,primer_apellido,
    segundo_apellido,direccion,fecha_inicio_servicio,fk_lugar,sueldo,fk_usuario,cedula} = await request.json();
    
    const respuesta =
			await dbPostgre`CALL insertar_empleado(${codigo}, ${primer_nombre}, ${segundo_nombre},${primer_apellido},
            ${segundo_apellido},${direccion},${fecha_inicio_servicio},${fk_lugar},${sueldo},${fk_usuario},${cedula})`;

    return json({ respuesta }, { status: 201 });
}
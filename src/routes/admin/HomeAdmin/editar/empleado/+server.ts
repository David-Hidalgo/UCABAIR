import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';

export async function PUT({ request }) {
    const { codigo,
    primer_nombre,
    segundo_nombre,
    primer_apellido,
    segundo_apellido,
    direccion,
    fecha_inicio_servicio,
    fk_lugar,
    sueldo,
    fk_usuario,
    cedula,
    viejo_codigo} = await request.json();

    const respuesta =
        await dbPostgre`CALL editar_empleado(${codigo}, ${primer_nombre}, ${segundo_nombre},
                        ${primer_apellido},${segundo_apellido},${direccion},${fecha_inicio_servicio},
                        ${fk_lugar},${sueldo},${fk_usuario},${cedula},${viejo_codigo})`;
                        
                        

    return json({ respuesta }, { status: 201 });
}

import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';

export async function PUT({ request }) {
    const {  direccion  ,
    monto_acreditado  ,
    fecha_inicio_operacion ,
    tipo  ,
    nacionalidad ,
    fk_lugar   ,
    fk_usuario ,
    tipo_persona ,
    rif,
    denominacion_persona ,
    razon_social ,
    pagina_web ,
    cedula,
    primer_nombre,
    segundo_nombre,
    primer_apellido,
    segundo_apellido,
    viejo_codigo } = await request.json();

    const respuesta =
			await dbPostgre`CALL editar_persona(${direccion}, ${monto_acreditado}, ${fecha_inicio_operacion},
                        ${tipo},${nacionalidad},${fk_lugar},${fk_usuario},${tipo_persona},${rif},${denominacion_persona}
                        ,${razon_social},${pagina_web},${cedula},${primer_nombre},${segundo_nombre},
                        ${primer_apellido},${segundo_apellido},${viejo_codigo})`;
                        
    return json({ respuesta }, { status: 201 });
}
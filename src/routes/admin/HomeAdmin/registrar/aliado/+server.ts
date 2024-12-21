import { json } from '@sveltejs/kit';
import {dbPostgre } from '$lib/server/db';

export async function POST({ request }) {
    const {
			codigo,direccion,monto_acreditado,fecha_inicio_operacion,nacionalidad,fk_lugar,fk_usuario,
			rif,denominacion_persona,razon_social,pagina_web
			
		} = await request.json();
    
    const respuesta =
            await dbPostgre`CALL insertar_persona(${codigo}, ${direccion}, ${monto_acreditado},${fecha_inicio_operacion},
            ${nacionalidad},${direccion},${fk_lugar},${fk_usuario},${rif},${denominacion_persona},${razon_social},${pagina_web})`;

    return json({ respuesta }, { status: 201 });
}
import { json } from '@sveltejs/kit';
import {dbPostgre } from '$lib/server/db';

export async function POST({ request }) {

    const { codigo_ce, direccion_correo_ce, fk_persona, fk_empleado} = await request.json();

    const respuesta = await dbPostgre`CALL insertar_correo(${codigo_ce}, ${direccion_correo_ce},
                                     ${fk_persona}, NULL)`;
                                      
    return json({ respuesta }, { status: 201 });
}

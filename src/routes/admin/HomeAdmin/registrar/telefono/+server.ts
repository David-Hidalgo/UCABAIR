import { json } from '@sveltejs/kit';
import {dbPostgre } from '$lib/server/db';

export async function POST({ request }) {

    const { codigo_tel, numero_telefono_tel, codigo_area_tel, fk_persona, fk_empleado } = await request.json();

    if (fk_empleado === 0){
    const respuesta = await dbPostgre`CALL insertar_telefono(${codigo_tel}, 
                                    ${numero_telefono_tel}, ${codigo_area_tel},
                                      ${fk_persona}, NULL)`;
    return json({ respuesta }, { status: 201 });
    }else {
    const respuesta = await dbPostgre`CALL insertar_telefono(${codigo_tel}, 
                                    ${numero_telefono_tel}, ${codigo_area_tel},
                                      NULL, ${fk_empleado})`;
    return json({ respuesta }, { status: 201 });
    }
    
}

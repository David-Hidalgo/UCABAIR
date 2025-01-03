import { json } from '@sveltejs/kit';
import {dbPostgre } from '$lib/server/db';

export async function POST({ request }) {

    const { codigo_car,nombre_car } = await request.json();

 
    const respuesta = await dbPostgre`CALL insertar_caracteristica(${codigo_car},${nombre_car})`; 
                                  
    return json({ respuesta }, { status: 201 });
    
    
}

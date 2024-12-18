import { json } from '@sveltejs/kit';
import {dbPostgre } from '$lib/server/db';

export async function DELETE({ request }) {
    const codigo_empleado = await request.json();
    
    
    const respuesta = await dbPostgre`CALL eliminar_empleado(${codigo_empleado})`;

    return json({ respuesta }, { status: 201 });
}
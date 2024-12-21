import { json } from '@sveltejs/kit';
import {dbPostgre } from '$lib/server/db';

export async function DELETE({ request }) {
    const codigo_com = await request.json();
    
    
    const respuesta = await dbPostgre`CALL eliminar_persona(${codigo_com})`;
    return json({ respuesta }, { status: 201 });
}
import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';

export async function PUT({ request }) {
    const { materia_prima, codigo_viejo  } = await request.json();

    const respuesta =
        await dbPostgre`CALL editar_tipo_materia_prima(${materia_prima.codigo_tmp},${materia_prima.nombre_tmp}, ${materia_prima.descripcion_tmp}, ${materia_prima.unidad_medida_tmp}, ${codigo_viejo})`;

    return json({ respuesta }, { status: 201 });
}

import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';

export async function PUT({ request }) {
    const { codigo_ma,nombre_ma,descripcion_ma,precio_unidad_ma,fk_modelo_avion,codigo_viejo } = await request.json();

    const respuesta =
        await dbPostgre`CALL editar_aeronave(${codigo_ma}, ${nombre_ma}, ${descripcion_ma},
                        ${precio_unidad_ma},${fk_modelo_avion},${codigo_viejo})`;
                         //hay que ver como pasar las caracteristicas
                        

    return json({ respuesta }, { status: 201 });
}

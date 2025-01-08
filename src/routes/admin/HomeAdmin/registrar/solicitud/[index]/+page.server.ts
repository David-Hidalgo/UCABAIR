import { error } from '@sveltejs/kit';
import type {PageServerLoad } from './$types';
import { dbPostgre } from "$lib/server/db/index";
import type {Compra, Lote_materia_prima, Tipo_materia_prima} from '$lib/server/db/schema';
export const load: PageServerLoad=async({ params}) =>{
	const index = params.index;

	if (!index) error(404);
    const n=Number.parseInt(index)

    if (Number.isInteger(n)) {
        
        const datos_ = await dbPostgre<Lote_materia_prima[]>`select * from compra where fk_configuracion_pieza=${n}`;
        const datos_solicitud = await dbPostgre<Tipo_materia_prima[]>`select * from lote_materia_prima where codigo_tmp=${n}`; 

        return {materia_prima, datos_solicitud};
    }
    error(400)
}

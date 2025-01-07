import { error } from '@sveltejs/kit';
import type {PageServerLoad } from './$types';
import { dbPostgre } from "$lib/server/db/index";
import type {Modelo_avion, Caracteristica_modelo, Tipo_pieza, Configuracion_avion} from '$lib/server/db/schema';
export const load: PageServerLoad=async({ params}) =>{
	const index = params.index;

	if (!index) error(404);
    const n=Number.parseInt(index)

    if (Number.isInteger(n)) {
        const [modelos_avion] =await dbPostgre<Modelo_avion[]>`select * from modelo_avion`;
        const [resultado] =await dbPostgre<Modelo_avion[]>`select * from modelo_avion where codigo_ma=${n}`
        const [caracteristicas_asignadas] =await dbPostgre<Caracteristica_modelo[]>`select * from caracteristica_modelo where fk_modelo_avion=${n}`
        const piezas =await dbPostgre<Tipo_pieza[]>`select * from configuracion_avion ca where ca.fk_modelo_avion=${n}`
        
        return {resultado,caracteristicas_asignadas,modelos_avion, piezas};
    }
    error(400)
}

import { error } from '@sveltejs/kit';
import type {PageServerLoad } from './$types';
import { dbPostgre } from "$lib/server/db/index";
import type {Tipo_pieza} from '$lib/server/db/schema';


export const load: PageServerLoad=async({ params}) =>{const index = params.index;
	if (!index) error(404);
    const n=Number.parseInt(index)
    console.log(n)

    if (Number.isInteger(n)) {
        
        const [resultado] =await dbPostgre<Tipo_pieza[]>`select * from tipo_pieza where codigo_tp=${n}`
        console
        const piezas_fk =await dbPostgre<Tipo_pieza[]>`select * from tipo_pieza`
        return {resultado, piezas_fk};
    }
    error(400)
}

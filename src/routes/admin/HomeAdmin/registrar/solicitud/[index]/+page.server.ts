import { error } from '@sveltejs/kit';
import type {PageServerLoad } from './$types';
import { dbPostgre } from "$lib/server/db/index";
import type {Tipo_materia_prima} from '$lib/server/db/schema';
export const load: PageServerLoad=async({ params}) =>{
	const index = params.index;

	if (!index) error(404);
    const n=Number.parseInt(index)

    if (Number.isInteger(n)) {
        
        const [resultado] =await dbPostgre<Tipo_materia_prima[]>`select * from tipo_materia_prima where codigo_tmp=${n}`;
        return {resultado};
    }
    error(400)
}

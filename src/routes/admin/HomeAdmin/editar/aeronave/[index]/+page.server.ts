import { error } from '@sveltejs/kit';
import type {PageServerLoad } from './$types';
import { dbPostgre } from "$lib/server/db/index";
import type {Rol, Privilegio} from '$lib/server/db/schema';
export const load: PageServerLoad=async({ params}) =>{
	const index = params.index;

	if (!index) error(404);
    const n=Number.parseInt(index)

    if (Number.isInteger(n)) {
        
        const [resultado] =await dbPostgre<Rol[]>`select * from rol where codigo_rol=${n}`
        const permisos =await dbPostgre<Privilegio[]>`select * from privilegio`
        return {
            resultado,
            permisos
        };
    }
    error(400)
}

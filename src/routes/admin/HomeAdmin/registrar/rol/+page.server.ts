import { error } from '@sveltejs/kit';
import type { PageServerLoad } from "./$types";
import { dbPostgre } from "$lib/server/db/index";
import type { Privilegio } from '$lib/server/db/schema';

export const load: PageServerLoad=async() =>{
    const permisos =await dbPostgre<Privilegio[]>`select * from privilegio`
    return {
        permisos
        };

    error(400)
}

import { error } from '@sveltejs/kit';
import type { PageServerLoad } from "./$types";
import { dbPostgre } from "$lib/server/db/index";
import type { Modelo_avion } from '$lib/server/db/schema';

export const load: PageServerLoad=async() =>{
    const modelos_avion =await dbPostgre<Modelo_avion[]>`select * from modelo_avion`;
    return {modelos_avion};

    error(400)
}

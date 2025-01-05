import { error } from '@sveltejs/kit';
import type { PageServerLoad } from "./$types";
import { dbPostgre } from "$lib/server/db/index";
import type { Modelo_avion,Tipo_pieza, Tipo_prueba } from '$lib/server/db/schema';

export const load: PageServerLoad=async() =>{
    const modelos_avion =await dbPostgre<Modelo_avion[]>`select * from modelo_avion`;
    const piezas =await dbPostgre<Tipo_pieza[]>`select * from tipo_pieza`;
    const pruebas =await dbPostgre<Tipo_prueba[]>`select * from tipo_prueba`;
    return {modelos_avion, piezas, pruebas};

    error(400)
}

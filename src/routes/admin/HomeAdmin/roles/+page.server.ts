import {dbPostgre } from '$lib/server/db';
import type { PageServerLoad } from './$types';

export interface Rol {
	codigo_rol: number;
	nombre_rol: string;
	descripcion_rol: string;
	}

export const load: PageServerLoad = async ({ params }) => {

	const roltable = 	await dbPostgre<Rol[]>`
    SELECT * FROM rol;
`
    // console.log(roltable);
    return {roltable};
};


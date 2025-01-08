import { error } from '@sveltejs/kit';
import type { PageServerLoad } from './$types';
import { dbPostgre } from '$lib/server/db/index';

export interface Tipo_pieza {
	codigo_tp: number | undefined;
	nombre_tp: string;
	descripcion_tp: string;
	fk_tipo_pieza: number | undefined;
	precio_unidad_tp: number;
}

export const load: PageServerLoad = async ({ params }) => {
	const piezas_fk = await dbPostgre<Tipo_pieza[]>`select * from tipo_pieza`;
	console.log(piezas_fk);
	return { piezas_fk };
	error(400);
};

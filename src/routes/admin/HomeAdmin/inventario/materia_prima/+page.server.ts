import {dbPostgre } from '$lib/server/db';
import type { Actions,PageServerLoad } from './$types';

export interface Tipo_materia_prima {
	codigo_tmp: number | undefined;
	nombre_tmp: string;
	descripcion_tmp: string;
	unidad_medida_tmp: string;
}

export interface Sede {
	codigo_sed: number | undefined;
	nombre_sed: string;
	direccion_sed: string;
	fk_lugar: number | undefined;
	central_sed: boolean;
}

export const actions: Actions = {
			delete: async (event) => {
			const formData = await event.request.formData();
			console.log(formData);
			
			const codigo_tmp  = formData.get('codigo');

			if (!codigo_tmp) {
				return { status: 400, body: { message: 'Invalid data' } };
			}
			const palabra : string = codigo_tmp.toString();
			console.log(palabra);
			
			await dbPostgre`CALL eliminar_modelo_avion(${palabra});`;

			return {
				status: 302,
				headers: {
					location: '/admin/HomeAdmin/inventario/materia_prima'
				}
			};
			}
		}


export const load: PageServerLoad = async ({ params }) => {

	const tmp_table = 	await dbPostgre<Tipo_materia_prima[]>`SELECT * FROM tipo_materia_prima;`;
	const sedes_table = 	await dbPostgre<Sede[]>`SELECT * FROM sede;`;
	
	return {tmp_table,sedes_table};
	
};


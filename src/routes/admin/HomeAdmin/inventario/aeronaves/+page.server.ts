import {dbPostgre } from '$lib/server/db';
import type { Actions,PageServerLoad } from './$types';

export interface Modelo_avion {
	codigo_ma: number | undefined;
	nombre_ma: string;
	descripcion_ma: string;
	precio_unidad_ma: number | undefined;
	fk_modelo_avion: number | undefined;
	}

export const actions: Actions = {
			delete: async (event) => {
			const formData = await event.request.formData();
			console.log(formData);
			
			const codigo_ma  = formData.get('codigo');

			if (!codigo_ma) {
				return { status: 400, body: { message: 'Invalid data' } };
			}
			const palabra : string = codigo_ma.toString();
			console.log(palabra);
			
			await dbPostgre`CALL eliminar_modelo_avion(${palabra});`;

			return {
				status: 302,
				headers: {
					location: '/admin/HomeAdmin/inventario/aeronaves'
				}
			};
			}
		}


export const load: PageServerLoad = async ({ params }) => {

	const ma_table = 	await dbPostgre<Modelo_avion[]>`
    SELECT * FROM modelo_avion;`;
    return {ma_table};
	
};


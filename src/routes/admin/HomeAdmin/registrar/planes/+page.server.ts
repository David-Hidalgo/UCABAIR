import { fail} from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db/index';
import type { PageServerLoad, Actions } from './$types';

export const load: PageServerLoad = async (event) => {
	const sedes=await dbPostgre`select * from sede;`;
	const piezas=await dbPostgre`select * from tipo_pieza;`;
	const profesiones=await dbPostgre`select * from profesion;`;
	const TiposPruebas=await dbPostgre`select * from tipo_prueba`;
	const plan_embalaje=await dbPostgre`select * from embalaje_plan`;
	const plan_transporte=await dbPostgre`select * from plan_transporte`;

	return {
		user: event.locals.user
	};
};

export const actions = {
	PlanAvion: async ({request}) => {
		const p = await request.formData();
		return p
	}
} satisfies Actions;

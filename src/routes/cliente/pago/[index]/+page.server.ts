import { error } from '@sveltejs/kit';
import type { PageServerLoad } from './$types';
import { dbPostgre } from '$lib/server/db/index';
import type {
	Usuario,Modelo_avion,Persona,Telefono,Correo_electronico,Moneda
} from '$lib/server/db/schema';

export const load: PageServerLoad = async (event) => {
	const mon_table = await dbPostgre<Moneda[]>`select * from moneda`;
	const tel_table = await dbPostgre<Telefono[]>`select * from telefono`;
	const email_table = await dbPostgre<Correo_electronico[]>`select * from correo_electronico`;
	const index = event.params.index;
	//const persona = await dbPostgre`select * from persona where fk_usuario=${el codigo del usuario que esta comprando}`;
	if (!index) error(404);
	const n = Number.parseInt(index);
	const local = event.locals.user;
	if (!local) {
		throw error(401, 'User not authenticated');
	}
	const [persona] = await dbPostgre<Persona[]>`select * from persona where fk_usuario=${local.id}`;
	if (Number.isInteger(n)) {
		const [avion] = await dbPostgre<Modelo_avion[]>`select * from modelo_avion ma where codigo_ma=${n}`;
		return { avion ,persona,tel_table,email_table,mon_table};
	}
	

	error(400);
};

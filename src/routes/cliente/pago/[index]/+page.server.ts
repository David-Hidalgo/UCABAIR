import { error } from '@sveltejs/kit';
import type { PageServerLoad } from './$types';
import { dbPostgre } from '$lib/server/db/index';
import type {
	Usuario,
	Modelo_avion,
	Tipo_pieza,
	Configuracion_avion,
	Tipo_prueba,
	Configuracion_prueba_avion,
	Profesion,
	Estimacion_profesion_empleado,
	Configuracion_def,
	Caracteristica,
	Caracteristica_modelo
} from '$lib/server/db/schema';

export const load: PageServerLoad = async (event) => {
	const index = event.params.index;
	//const persona = await dbPostgre`select * from persona where fk_usuario=${el codigo del usuario que esta comprando}`;
	if (!index) error(404);
	const n = Number.parseInt(index);
	const local = event.locals.user;
	if (!local) {
		throw error(401, 'User not authenticated');
	}
	const [persona] = await dbPostgre<Usuario[]>`select * from usuario where codigo_usu=${local.id}`;
	if (Number.isInteger(n)) {
		const [avion] = await dbPostgre<
			Modelo_avion[]
		>`select * from modelo_avion ma where codigo_ma=${n}`;
		return { avion ,persona};
	}

	error(400);
};

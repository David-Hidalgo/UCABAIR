import { error } from '@sveltejs/kit';
import type { PageServerLoad } from './$types';
import { dbPostgre } from '$lib/server/db/index';
import type {
	Modelo_avion,
	Tipo_pieza,
	Configuracion_avion,
	Tipo_prueba,
	Configuracion_prueba_avion,
	Profesion,
	Estimacion_profesion_empleado,
	Configuracion_def, Caracteristica, Caracteristica_modelo
} from '$lib/server/db/schema';

export const load: PageServerLoad = async ({ params }) => {
	const index = params.index;
	//const persona = await dbPostgre`select * from persona where fk_usuario=${el codigo del usuario que esta comprando}`;
if (!index) error(404);
	const n = Number.parseInt(index);

	if (Number.isInteger(n)) {
		const [avion] = await dbPostgre<Modelo_avion[]>`select * from modelo_avion ma where codigo_ma=${n}`;
		return {avion};
	}

	error(400);
};

import { error } from '@sveltejs/kit';
import type { PageServerLoad } from './$types';
import { dbPostgre } from '$lib/server/db/index';
import type {
	Empleado,
	Telefono,
	Correo_electronico,
	Empleado_profesion
} from '$lib/server/db/schema';
export const load: PageServerLoad = async ({ params }) => {
	const index = params.index;

	if (!index) error(404);
	const n = Number.parseInt(index);

	if (Number.isInteger(n)) {
		const [resultado] = await dbPostgre<
			Empleado[]
		>`select * from empleado where codigo_empleado_per=${n}`;
		const telefonos = await dbPostgre<Telefono[]>`select * from telefono where fk_empleado=${n}`;
		const correos = await dbPostgre<
			Correo_electronico[]
		>`select * from correo_electronico where fk_empleado=${n}`;
		const [fk_usuario] = await dbPostgre<Number[]>`select e.fk_usuario from empleado e, usuario u 
                                                    where e.fk_usuario=u.codigo_usu and codigo_empleado_per=${n}  `;
		return { resultado, telefonos, correos, fk_usuario };
	}
	error(400);
};

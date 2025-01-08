import { dbPostgre } from '$lib/server/db';
import type { Actions, PageServerLoad } from './$types';

export interface Rol {
	codigo_rol: number;
	nombre_rol: string;
	descripcion_rol: string;
}

export const actions: Actions = {
	delete: async (event) => {
		const formData = await event.request.formData();
		console.log(formData);

		const codigo_rol = formData.get('codigo');

		if (!codigo_rol) {
			return { status: 400, body: { message: 'Invalid data' } };
		}
		const palabra: string = codigo_rol.toString();
		console.log(palabra);

		await dbPostgre`CALL eliminar_rol(${palabra});`;

		return {
			status: 302,
			headers: {
				location: '/admin/HomeAdmin/roles'
			}
		};
	}
};

export const load: PageServerLoad = async ({ params }) => {
	const roltable = await dbPostgre<Solicitudes[]>`
    SELECT * FROM solicitudes;
`;
	// console.log(roltable);
	return { roltable };
};

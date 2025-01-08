import { dbPostgre } from '$lib/server/db';
import type { Actions, PageServerLoad } from './$types';

export interface Estatus {
    codigo_est: number | undefined,
    nombre_est: string
};

export interface Historial_estatus_compra {
    fk_compra :	number |undefined,
    fk_estatus : number | undefined,
    fecha_hec :Date
};

export interface Lote_materia_prima {
	codigo_lmp: number | undefined;
	fk_configuracion_pieza: number | undefined;
	fk_configuracion_pieza2: number | undefined;
	fk_compra: number | undefined;
	fk_almacen: number | undefined;
	fk_almacen2: number | undefined;
	cantidad_lmp: number | undefined;
}

export interface Compra {
	codigo_compra_com: number | undefined;
	numero_factura_com: number | undefined;
	fecha_hora_com: Date;
	monto_total_com: number;
	impuesto_total_com: number;
}

export interface Tipo_materia_prima{
	codigo_tmp: number | undefined;
	nombre_tmp: string;
	descripcion_tmp: string;
	unidad_medida_tmp: string;
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

		await dbPostgre`CALL eliminar_solicitud(${palabra});`;

		return {
			status: 302,
			headers: {
				location: '/admin/HomeAdmin/solicitudes'
			}
		};
	}
};

export const load: PageServerLoad = async ({ params }) => {
	const comtable = await dbPostgre<Compra[]>`SELECT * FROM Compra;`;
	const lmp = await dbPostgre<Lote_materia_prima[]>`SELECT * FROM lote_materia_prima;`;
	const tmp = await dbPostgre<Tipo_materia_prima[]>`SELECT * FROM tipo_materia_prima;`;
	const est_table	= await dbPostgre<Estatus[]>`SELECT * FROM estatus;`;
	const hec_table = await dbPostgre<Historial_estatus_compra[]>`SELECT * FROM historial_estatus_compra;`;
	return {comtable, lmp, tmp, est_table, hec_table};
};

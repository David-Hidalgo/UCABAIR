import { dbPostgre } from '$lib/server/db';
import type { Actions, PageServerLoad } from './$types';

export interface Modelo_avion {
	codigo_ma: number | undefined;
	nombre_ma: string;
	descripcion_ma: string;
	precio_unidad_ma: number | undefined;
	fk_modelo_avion: number | undefined;
}

export interface Caracteristica {
	codigo_car: number | undefined;
	nombre_car: string;
}

export interface Caracteristica_modelo {
	valor_cm: number | undefined;
	unidad_medida_cm: string;
	fk_caracteristica: number | undefined;
	fk_modelo_avion: number | undefined;
}

export interface Tipo_pieza {
	codigo_tp: number | undefined;
	nombre_tp: string;
	descripcion_tp: string;
	fk_tipo_pieza: number | undefined;
	precio_unidad_tp: number;
}

export interface Configuracion_avion {
	cantidad_pieza_ca: number;
	fk_tipo_pieza: number;
	fk_modelo_avion: number;
	fk_sede: number;
}

export interface Tipo_prueba {
	codigo_tp: number | undefined;
	nombre_tp: string;
	descripcion_tp: string;
	duracion_estimada_tp: string;
}

export interface Configuracion_prueba_avion {
	fk_tipo_prueba: number;
	fk_modelo_avion: number;
	fk_sede: number;
}
export const actions: Actions = {
	delete: async (event) => {
		const formData = await event.request.formData();
		console.log(formData);

		const codigo_ma = formData.get('codigo');

		if (!codigo_ma) {
			return { status: 400, body: { message: 'Invalid data' } };
		}
		const palabra: string = codigo_ma.toString();
		console.log(palabra);

		await dbPostgre`CALL eliminar_modelo_avion(${palabra});`;

		return {
			status: 302,
			headers: {
				location: '/admin/HomeAdmin/inventario/aeronaves'
			}
		};
	}
};

export const load: PageServerLoad = async ({ params }) => {
	const ma_table = await dbPostgre<Modelo_avion[]>`SELECT * FROM modelo_avion;`;
	const car_table = await dbPostgre<Caracteristica[]>`SELECT * FROM caracteristica;`;
	const cm_table = await dbPostgre<Caracteristica_modelo[]>`SELECT * FROM caracteristica_modelo;`;
	const p_table = await dbPostgre<Tipo_pieza[]>`SELECT * FROM tipo_pieza;`;
	const ca_table = await dbPostgre<Configuracion_avion[]>`SELECT * FROM configuracion_avion;`;
	const tp_table = await dbPostgre<Tipo_prueba[]>`SELECT * FROM tipo_prueba;`;
	const cpa_table = await dbPostgre<
		Configuracion_prueba_avion[]
	>`SELECT * FROM configuracion_prueba_avion;`;

	return { ma_table, car_table, cm_table, p_table, ca_table, tp_table, cpa_table };
};

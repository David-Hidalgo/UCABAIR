import { fail } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db/index';
import type { PageServerLoad, Actions } from './$types';

export const load: PageServerLoad = async ({ cookies, url }) => {
	const sedes = await dbPostgre`select * from sede;`;
	const piezas = await dbPostgre`select * from tipo_pieza;`;
	const profesiones = await dbPostgre`select * from profesion;`;
	const TiposPruebas = await dbPostgre`select * from tipo_prueba`;
	const plan_embalaje = await dbPostgre`select * from embalaje_plan`;
	const plan_transporte = await dbPostgre`select * from plan_transporte`;
	const cod_ma = url.searchParams.get('cod_ma');

	return {
		sedes: sedes,
		piezas: piezas,
		profesiones: profesiones,
		tiposPruebas: TiposPruebas,
		plan_embalaje: plan_embalaje,
		plan_transporte: plan_transporte,
		user: cookies.get('user'),
		cod_ma: cod_ma ? Number.parseInt(cod_ma) : -1
	};
};

export const actions: Actions = {
	ConfiguracionAvion: async ({ request }) => {
		const p = await request.formData();
		const fk_pieza = p.getAll('fk_pieza');
		const cod_ma = Number(p.get('cod_ma') ?? 0);
		const listaPiezas = fk_pieza.map((pieza) => Number.parseInt(pieza?.toString() ?? '0'));
		const sede = Number(p.get('fk_sede') ?? 0);
		// Procesar datos de ConfiguracionAvion
		try {
			await dbPostgre`delete from configuracion_avion where fk_modelo_avion = ${cod_ma}`;
			await dbPostgre`call insertar_configuracion_avion( 2,${listaPiezas},${cod_ma}, ${sede})`;
		} catch (error) {
			console.error(error);
			fail(400, { error,incorrect: true });
		}
	},

	PlanEmbalaje: async ({ request }) => {
		const p = await request.formData();
		const cod_ma = Number(p.get('cod_ma') ?? 0);
		const fk_plan_embalaje = Number(p.get('fk_plan_embalaje') ?? 0);
		const fk_profesional_embalaje = p.getAll('fk_profesional_embalaje');
		const sede = Number(p.get('fk_sede') ?? 0);
		// Procesar datos de PlanEmbalaje
		try {
			await dbPostgre`delete from embalaje_configuracion_avion where fk_modelo_avion = ${cod_ma}`;
			await dbPostgre`call insertar_configuracion_embalaje(${cod_ma}, ${sede},${fk_plan_embalaje}, ${(fk_profesional_embalaje
				.map((profesional) => Number(profesional)))},1)`;
		} catch (error) {
			console.error(error);
			fail(400, {incorrect: true });
		}
	},

	PlanTransporte: async ({ request }) => {
		const p = await request.formData();
		const cod_ma = Number(p.get('cod_ma') ?? 0);
		const fk_plan_transporte = Number(p.get('fk_plan_transporte') ?? 0);
		const fk_profesional_transporte = p.getAll('fk_profesional_transporte');
		const sede = Number(p.get('fk_sede') ?? 0);
		// Procesar datos de PlanTransporte
		try {
			await dbPostgre`delete from transporte_configuracion_avion where fk_modelo_avion = ${cod_ma}`;
			await dbPostgre`call insertar_configuracion_transporte(${cod_ma}, ${sede},${fk_plan_transporte}, ${fk_profesional_transporte
				.map((profesional) => Number(profesional))},1)`;
			} catch (error) {
			console.error(error);
			fail(400, { error, incorrect: true });
		}
	},

	PlanPrueba: async ({ request }) => {
		const p = await request.formData();
		const cod_ma = Number(p.get('cod_ma') ?? 0);
		const fk_tipo_prueba = Number(p.get('fk_plan_prueba') ?? 0);
		const fk_profesional_prueba = p.getAll('fk_profesional_prueba');
		const sede = Number(p.get('fk_sede') ?? 0);
		// Procesar datos de PlanPrueba
		try {
			await dbPostgre`delete from configuracion_prueba_avion where fk_modelo_avion = ${cod_ma}`;
			await dbPostgre`call insertar_configuracion_prueba(${cod_ma}, ${sede},${fk_tipo_prueba}, ${fk_profesional_prueba
			.map((profesional) => Number(profesional))},1)`;
		} catch (error) {
			console.error(error);
			fail(400, { error,incorrect: true });
		}
	}
} satisfies Actions;

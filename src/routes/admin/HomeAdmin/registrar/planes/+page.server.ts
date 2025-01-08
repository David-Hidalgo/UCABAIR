import { fail, type ServerLoadEvent} from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db/index';
import type { PageServerLoad, Actions, RouteParams } from './$types';

// eslint-disable-next-line @typescript-eslint/no-empty-object-type
export const load: PageServerLoad = async ({cookies, url}) => {
	const sedes=await dbPostgre`select * from sede;`;
	const piezas=await dbPostgre`select * from tipo_pieza;`;
	const profesiones=await dbPostgre`select * from profesion;`;
	const TiposPruebas=await dbPostgre`select * from tipo_prueba`;
	const plan_embalaje=await dbPostgre`select * from embalaje_plan`;
	const plan_transporte=await dbPostgre`select * from plan_transporte`;
	const cod_ma= url.searchParams.get('cod_ma');

	return {
		sedes:sedes,
		piezas:piezas,
		profesiones:profesiones,
		tiposPruebas:TiposPruebas,
		plan_embalaje:plan_embalaje,
		plan_transporte:plan_transporte,
		user: cookies.get('user'),
		cod_ma:cod_ma? Number.parseInt(cod_ma): -1 
	};
};

export const actions = {
	PlanAvion: async ({request}) => {
		const p = await request.formData();
		console.log(p);
		const fk_pieza = p.getAll('fk_pieza');
		// const cod_ma = p.get('cod_ma');
		// const cod_sede = p.get('fk_sede');
		// const fk_plan_embalaje = p.get('fk_plan_embalaje');
		// const cod_transporte  = p.get('fk_plan_transporte');
		// const cod_tipo_prueba = p.get('fk_plan_prueba');

		const cod_ma = Number(p.get('cod_ma') ?? 0);
		const cod_sede = Number(p.get('fk_sede') ?? 0);
		const fk_plan_embalaje = Number(p.get('fk_plan_embalaje') ?? 0);
		const cod_transporte = Number(p.get('fk_plan_transporte') ?? 0);
		const cod_tipo_prueba = Number(p.get('fk_plan_prueba') ?? 0);

		const fk_profesional_prueba = p.getAll('fk_profesional_prueba');
		const fk_profesional_embalaje = p.getAll('fk_profesional_embalaje');
		const fk_profesional_transporte = p.getAll('fk_profesional_transporte');

		const listaPiezas = fk_pieza.map((pieza) => Number.parseInt(pieza?.toString() ?? '0'));
		const listaProfesionalPrueba = fk_profesional_prueba.map((profesional) => Number.parseInt(profesional?.toString() ?? 0));
		const listaProfesionalEmbalaje = fk_profesional_embalaje.map((profesional) => Number.parseInt(profesional?.toString() ?? 0));
		const listaProfesionalTransporte = fk_profesional_transporte.map((profesional) => Number.parseInt(profesional?.toString() ?? 0));

		console.log(cod_ma);
		console.log(cod_sede);
		console.log(fk_plan_embalaje);
		console.log(cod_transporte);
		console.log(cod_tipo_prueba);
		
		console.log(listaPiezas);
		console.log(listaProfesionalPrueba);
		console.log(listaProfesionalEmbalaje);
		console.log(listaProfesionalTransporte);
		
		const respuesta = await dbPostgre`call insertar_configuracion_completa(
		 2,${listaPiezas},${cod_ma},${cod_sede},${fk_plan_embalaje},1,${listaProfesionalEmbalaje},${listaProfesionalPrueba},${listaProfesionalTransporte})`;

		if (!p){
			return fail(400, {p, incorrect: true})
		}
		return -1
	}
} satisfies Actions;

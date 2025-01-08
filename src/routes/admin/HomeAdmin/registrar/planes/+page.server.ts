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
		cod_ma:cod_ma
	};
};

export const actions = {
	PlanAvion: async ({request}) => {
		const p = await request.formData();
		console.log(p);
		const fk_pieza = p.getAll('fk_pieza');
		const cod_ma = p.get('cod_ma');
		const cod_sede = p.getAll('fk_sede');
		const fk_plan_embalaje = p.get('fk_plan_embalaje');
		const cod_transporte  = p.get('fk_plan_transporte');
		const cod_tipo_prueba = p.get('fk_plan_prueba');
		const fk_profesional_prueba = p.getAll('fk_profesional_prueba');
		const fk_profesional_embalaje = p.getAll('fk_profesional_embalaje');
		const fk_profesional_transporte = p.getAll('fk_profesional_transporte');
		console.log(fk_pieza);
		console.log(cod_ma);
		console.log(cod_sede);
		console.log(fk_plan_embalaje);
		console.log(cod_transporte);
		console.log(cod_tipo_prueba);
		console.log(fk_profesional_prueba);
		console.log(fk_profesional_transporte);
		
		const respuesta =await dbPostgre`call insertar_configuracion_completa(
		null,${fk_pieza},${cod_ma},${cod_sede},${fk_plan_embalaje},${cod_transporte},${cod_tipo_prueba},null,${fk_profesional_embalaje}`
		if (!p){
			return fail(400, {p, incorrect: true})
		}
		return respuesta
	}
} satisfies Actions;

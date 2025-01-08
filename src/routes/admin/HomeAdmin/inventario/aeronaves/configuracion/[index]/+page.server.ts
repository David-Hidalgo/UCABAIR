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
	Configuracion_def
} from '$lib/server/db/schema';

export const load: PageServerLoad = async ({ params }) => {
	const index = params.index;
	const ma_table = await dbPostgre<Modelo_avion[]>`SELECT * FROM modelo_avion;`;
	const p_table = await dbPostgre<Tipo_pieza[]>`SELECT * FROM tipo_pieza;`;
	const ca_table = await dbPostgre<Configuracion_avion[]>`SELECT * FROM configuracion_avion;`;
	const tp_table = await dbPostgre<Tipo_prueba[]>`SELECT * FROM tipo_prueba;`;
	const cpa_table = await dbPostgre<
		Configuracion_prueba_avion[]
	>`SELECT * FROM configuracion_prueba_avion;`;
	const epe_table = await dbPostgre<
		Estimacion_profesion_empleado[]
	>`SELECT * FROM estimacion_profesion_empleado;`;
	if (!index) error(404);
	const n = Number.parseInt(index);

	if (Number.isInteger(n)) {
		const resultado = await dbPostgre<
			Configuracion_def[]
		>`select * from modelo_avion ma,configuracion_avion ca,tipo_pieza tip,plan_ensamblaje pe, configuracion_ensamblaje_pieza cep,
		configuracion_prueba_avion cpa, embalaje_configuracion_avion eca, transporte_configuracion_avion tca,
		tipo_prueba tp, estimacion_profesion_empleado epe, profesion pro,
		embalaje_plan ep,plan_transporte pt 
		where
		cpa.fk_modelo_avion=ma.codigo_ma and
		tp.codigo_tp=cpa.fk_tipo_prueba and 
		tp.codigo_tp=epe.fk_tipo_prueba and
		pro.codigo_pro=epe.fk_profesion and
		pt.codigo_pt=epe.fk_plan_transporte and
		ep.codigo_ep=epe.fk_embalaje_plan and
		pt.codigo_pt=tca.fk_plan_transporte and
		ep.codigo_ep=eca.fk_embalaje_plan and
		ma.codigo_ma=ca.fk_modelo_avion and
		ca.fk_tipo_pieza=tip.codigo_tp and
		pe.codigo_pe=cep.fk_plan_ensamblaje and
		tip.codigo_tp=cep.fk_tipo_pieza and
		codigo_ma=${n}`;

		const profesion_table = await dbPostgre
		`SELECT * FROM profesion pro inner join estimacion_profesion_empleado epp on epp.fk_profesion=pro.codigo_pro
														 where epp.fk_tipo_prueba in (select fk_tipo_prueba from configuracion_prueba_avion where fk_modelo_avion=${n})
														 or epp.fk_embalaje_plan in (select fk_embalaje_plan from embalaje_configuracion_avion where fk_modelo_avion=${n})
														 or epp.fk_plan_ensamblaje in (select fk_plan_ensamblaje from configuracion_ensamblaje_pieza where fk_tipo_pieza in (select fk_tipo_pieza 
														 																													 from configuracion_avion where fk_modelo_avion=${n}))
														 or epp.fk_plan_transporte in (select fk_plan_transporte from transporte_configuracion_avion where fk_modelo_avion=${n});`;
		return {
			resultado,
			ma_table,
			p_table,
			ca_table,
			tp_table,
			cpa_table,
			profesion_table,
			epe_table
		};
	}
	error(400);
};

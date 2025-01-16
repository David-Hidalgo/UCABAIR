import { dbPostgre } from '$lib/server/db/index';
import type { PageServerLoad } from './$types';

export const load: PageServerLoad = async ({ params }) => {
	const detalles_piezas = await dbPostgre`select *
											from lote_materia_prima lmp inner join configuracion_pieza cp
											on lmp.fk_configuracion_pieza=cp.fk_tipo_pieza and lmp.fk_configuracion_pieza2=cp.fk_tipo_materia_prima
											inner join tipo_materia_prima tmp on tmp.codigo_tmp=cp.fk_tipo_materia_prima
											inner join tipo_pieza tp on tp.codigo_tp=cp.fk_tipo_pieza
											inner join ensamblaje ens on ens.fk_lote_materia_prima=lmp.codigo_lmp
											inner join pieza pi on pi.fk_ensamblaje=ens.codigo_ens
											where pi.codigo_pie=${params.index};`;
	console.log(detalles_piezas);

	return { detalles_piezas };
};

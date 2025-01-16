import { error } from '@sveltejs/kit';
import type { PageServerLoad } from './$types';
import { dbPostgre } from '$lib/server/db/index';
import type {
	Compra,
	Lote_materia_prima,
	Tipo_materia_prima,
	Proveedor2
} from '$lib/server/db/schema';
export const load: PageServerLoad = async ({ params }) => {
	const index = params.index;

	if (!index) error(404);
	const n = Number.parseInt(index);

	if (Number.isInteger(n)) {
		const datos_solicitud = await dbPostgre<
			Lote_materia_prima[]
		>`select * from lote_materia_prima where fk_configuracion_pieza=${n}`;
		const materia_prima = await dbPostgre<
			Tipo_materia_prima[]
		>`select * from tipo_materia_prima where codigo_tmp=${n}`;
		const proveedor = await dbPostgre<
			Proveedor2[]
		>`select DISTINCT pro.codigo_com as codigo_com, pro.denominacion_persona_jur as denominacion_comercial ,pro.razon_social_jur as razon_social,
                                                    pro.rif_jur as RIF, pro.direccion_com ,tmp.nombre_tmp as nombre_producto
                                                    from persona pro left join detalle_compra dc on pro.codigo_com=dc.fk_persona
                                                    left join compra co on dc.fk_compra=co.codigo_compra_com 
                                                    left join lote_materia_prima lmp on co.codigo_compra_com=lmp.fk_compra
                                                    left join tipo_materia_prima tmp on lmp.fk_configuracion_pieza=tmp.codigo_tmp 
                                                    where pro.tipo_com='proveedor'
                                                    and tmp.codigo_tmp=${n}`;
		return { materia_prima, datos_solicitud, proveedor };
	}
	error(400);
};

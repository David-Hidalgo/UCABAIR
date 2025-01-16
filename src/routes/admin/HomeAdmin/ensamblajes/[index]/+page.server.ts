import { dbPostgre } from '$lib/server/db/index';
import type { PageServerLoad } from './$types';

export const load: PageServerLoad = async ({ params }) => {
	
    const ensamblajes_piezas = await dbPostgre`select *
											from pieza pi inner join configuracion_avion ca on pi.fk_configuracion_avion=ca.fk_modelo_avion and pi.fk_configuracion_avion2=ca.fk_tipo_pieza
											inner join sede s on s.codigo_sed=ca.fk_sede
											inner join tipo_pieza tp on tp.codigo_tp=ca.fk_tipo_pieza
											inner join ensamblaje ens on ens.codigo_ens=pi.fk_ensamblaje
											inner join avion avi on avi.codigo_avi=pi.fk_avion
											where avi.codigo_avi=${params.index};`

    return { ensamblajes_piezas };
};

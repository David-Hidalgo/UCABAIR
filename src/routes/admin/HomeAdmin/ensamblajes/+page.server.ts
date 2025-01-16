import { dbPostgre } from '$lib/server/db/index';
import type { Ensamblaje_avion } from '$lib/server/db/schema';
import type { PageServerLoad } from './$types';



export const load: PageServerLoad = async () => {
    const ensamblajes = await dbPostgre<Ensamblaje_avion[]>`SELECT av.codigo_avi as codigo_avi, ens.codigo_ens as codigo_ens ,ven.fecha_hora_ven as fecha_inicio_ens, ens.fecha_fin_ens as fecha_fin_ens, 
                                        ma.nombre_ma as nombre_ma, e.nombre_est as nombre_est, case when per.tipo_persona_com = 'juridico' then per.denominacion_persona_jur 
                                        else per.primer_nombre_nat || ' ' || coalesce(segundo_nombre_nat, '') end as nombre_o_denominacion,
                                        case when per.tipo_persona_com = 'juridico' then per.razon_social_jur 
                                        else per.primer_apellido_nat || ' ' || coalesce(segundo_apellido_nat, '') end as apellido_o_razon_social
                                        FROM estatus e 
                                        inner join  estatus_historial_ensamblaje ehe on e.codigo_est = ehe.fk_estatus 
                                        inner Join ensamblaje ens on ehe.fk_ensamblaje = ens.codigo_ens 
                                        inner Join Avion av on av.fk_ensamblaje = ens.codigo_ens 
                                        inner join modelo_avion ma on  ma.codigo_ma = av.fk_modelo_avion
                                        inner join venta ven on av.fk_venta = ven.codigo_venta_ven
                                        inner join Detalle_venta dv on ven.codigo_venta_ven = dv.fk_venta
                                        inner join persona per on per.codigo_com =dv.fk_persona`;

    return { ensamblajes };
};

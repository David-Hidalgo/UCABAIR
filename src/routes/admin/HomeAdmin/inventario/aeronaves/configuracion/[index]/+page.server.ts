import { error } from '@sveltejs/kit';
import type {PageServerLoad } from './$types';
import { dbPostgre } from "$lib/server/db/index";

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

export interface Estimacion_profesion_empleado {
	codigo_epp: number | undefined;
	fk_tipo_prueba: number | undefined;
	fk_embalaje_plan: number | undefined;
	fk_plan_transporte: number | undefined;
	fk_plan_ensamblaje: number | undefined;
	cantidad_empleado_epp: number | undefined;
	fk_profesion: number | undefined;
}

export interface Profesion{
    codigo_pro:number | undefined;
    nombre_pro: string;

}

export interface Configuracion_def {
	codigo_ma: number ;
	nombre_ma: string;
	descripcion_ma: string;
	precio_unidad_ma: number | undefined;
	fk_modelo_avion: number | undefined;
	cantidad_pieza_ca: number | undefined;
	fk_tipo_pieza: number | undefined;
	fk_sede: number | undefined;
	codigo_tp: number | undefined;
	nombre_tp: string;
	descripcion_tp: string;
	precio_unidad_tp: number | undefined;
	codigo_pe: number | undefined;
	descripcion_pe: string;
	duracion_estimada_pe: string;
	fk_plan_ensamblaje: number | undefined;
	fk_tipo_prueba: number | undefined;
	fk_embalaje_plan: number | undefined;
	fk_plan_transporte: number | undefined;
	duracion_estimada_tp: string;
	codigo_epp: number | undefined;
	cantidad_empleado_epp: number | undefined;
	fk_profesion: number | undefined;
	codigo_pro: number | undefined;
	nombre_pro: string;
	codigo_ep: number | undefined;
	duracion_estimada_ep: string;
	codigo_pt: number | undefined;
	duracion_estimada_pt: string;
	descripcion_pt: string;
}

export const load: PageServerLoad=async({ params}) =>{
	const index = params.index;
    const [ma_table] = 	await dbPostgre<Modelo_avion[]>`SELECT * FROM modelo_avion;`;
    console.log(ma_table);
        const p_table =await dbPostgre<Tipo_pieza[]>`SELECT * FROM tipo_pieza;`;
        const ca_table =await dbPostgre<Configuracion_avion[]>`SELECT * FROM configuracion_avion;`;
        const tp_table =await dbPostgre<Tipo_prueba[]>`SELECT * FROM tipo_prueba;`;
        const cpa_table =await dbPostgre<Configuracion_prueba_avion[]>`SELECT * FROM configuracion_prueba_avion;`;
		const profesion_table= await dbPostgre<Profesion[]>`SELECT * FROM profesion;`;
        const epe_table = await  dbPostgre<Estimacion_profesion_empleado[]>`SELECT * FROM profesion;`;
	if (!index) error(404);
    const n=Number.parseInt(index)

        if (Number.isInteger(n)) {
        const resultado = await dbPostgre<Configuracion_def[]>`select * from modelo_avion ma,configuracion_avion ca,tipo_pieza tip,plan_ensamblaje pe, configuracion_ensamblaje_pieza cep, configuracion_prueba_avion cpa, embalaje_configuracion_avion eca, transporte_configuracion_avion tca,
                                                                tipo_prueba tp, estimacion_profesion_empleado epe, profesion pro,
                                                                embalaje_plan ep,plan_transporte pt where
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

    return {resultado,ma_table, p_table, ca_table, tp_table, cpa_table, profesion_table, epe_table};
       
    }
    error(400)
}



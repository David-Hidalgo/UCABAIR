export interface Rol {
	codigo_rol: number | undefined;
	nombre_rol: string;
	descripcion_rol: string;
}

export interface Privilegio {
	codigo_pri: number;
	nombre_pri: string;
}

export interface Empleado {
	codigo_empleado_per: number | undefined;
	cedula_per: string;
	primer_nombre_per: string;
	segundo_nombre_per: string;
	primer_apellido_per: string;
	segundo_apellido_per: string;
	direccion_per: string;
	fecha_inicio_servicio_per: Date | undefined;
	empleado_profesion: Empleado_profesion[];
	sueldo_per: number | undefined;
	telefono_per: Telefono[];
	correo_per: Correo_electronico[];
	//labor_per: string;
	fk_lugar: number | undefined;
	fk_usuario: number | undefined;
}

export interface Proveedor {
	codigo_com: number | undefined;
	direccion_com: string;
	monto_acreditado_com: number | undefined;
	fecha_inicio_operaciones_com: Date | undefined;
	tipo_com: string;
	nacionalidad_com: string;
	fk_lugar: number | undefined;
	fk_usuario: number | undefined;
	tipo_persona_com: string;
	rif_jur: string;
	denominacion_persona_jur: string;
	razon_social_jur: string;
	pagina_web_jur: string;
	cedula_nat: string;
	primer_nombre_nat: string;
	segundo_nombre_nat: string;
	primer_apellido_nat: string;
	segundo_apellido_nat: string;
	telefonos: Telefono[];
	correos_electronicos: Correo_electronico[];
}

export interface Tipo_prueba {
	codigo_tp: number | undefined;
	nombre_tp: string;
	descripcion_tp: string;
	duracion_estimada_tp: string;
}

export interface Modo_pago {
	codigo_mp: number | undefined;
	tipo_mp: string;
	numero_tarjeta_tar: number | undefined;
	banco_tar: string;
	cvv_tar: number | undefined;
	mes_vencimiento_tar: Date | undefined;
	ano_vencimiento_tar: Date | undefined;
	nombre_tar: string;
	fecha_emision_tar: Date | undefined;
	numero_transferencia_tran: number | undefined;
	fecha_emision_tran: Date | undefined;
	numero_cuenta_tran: number | undefined;
	numero_cheque_che: number | undefined;
	banco_che: string;
	fecha_emision_che: Date;
	beneficiario_che: string;
	denominacion_efe: string;
}

export interface Modelo_avion {
	codigo_ma: number | undefined;
	nombre_ma: string;
	descripcion_ma: string;
	precio_unidad_ma: number | undefined;
	fk_modelo_avion: number | undefined;
}

export interface Tipo_materia_prima {
	codigo_tmp: number | undefined;
	nombre_tmp: string;
	descripcion_tmp: string;
	unidad_medida_tmp: string;
}

export interface Sede {
	codigo_sed: number | undefined;
	nombre_sed: string;
	direccion_sed: string;
	fk_lugar: number | undefined;
	central_sed: boolean;
}

export interface Persona {
	codigo_com: number | undefined;
	direccion_com: string;
	monto_acreditado_com: number | undefined;
	fecha_inicio_operacion_com: Date | undefined;
	tipo_com: string;
	nacionalidad_com: string;
	fk_lugar: number | undefined;
	fk_usuario: number | undefined;
	tipo_persona_com: string;
	rif_jur: string;
	denominacion_persona_jur: string;
	razon_social_jur: string;
	pagina_web_jur: string;
	cedula_nat: string;
	primer_nombre_nat: string;
	segundo_nombre_nat: string;
	primer_apellido_nat: string;
	segundo_apellido_nat: string;
	telefonos: Telefono[];
	correos_electronicos: Correo_electronico[];
}
export interface Telefono {
	codigo_tel: number | undefined;
	numero_telefono_tel: string;
	codigo_area_tel: string;
	fk_persona: number | undefined;
	fk_empleado: number | undefined;
}

export interface Correo_electronico {
	codigo_ce: number | undefined;
	direccion_correo_ce: string;
	fk_persona: number | undefined;
	fk_empleado: number | undefined;
}

export interface Usuario {
	codigo_usu: number | undefined;
	nombre_usu: string;
	contrasena_usu: string;
	fk_rol: number | undefined;
}

export interface Empleado_profesion {
	titulacion_ep: string;
	experiencia_profesional_ep: string;
	fk_profesion: number | undefined;
	fk_empleado: number | undefined;
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

export interface Plan_ensamblaje {
	codigo_pe: number | undefined;
	descripcion_pe: string;
	duracion_estimada_pe: string;
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

export interface Compra {
	codigo_compra_com: number | undefined;
	numero_factura_com: number | undefined;
	fecha_hora_com: Date;
	monto_total_com: number;
	impuesto_total_com: number;
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

export interface Profesion {
	codigo_pro: number | undefined;
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
export interface Lote_materia_prima {
	codigo_lmp: number | undefined;
	fk_configuracion_pieza: number | undefined;
	fk_configuracion_pieza2: number | undefined;
	fk_compra: number | undefined;
	fk_almacen: number | undefined;
	fk_almacen2: number | undefined;
	cantidad_lmp: number | undefined;
}
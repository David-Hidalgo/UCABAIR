
export interface Rol {
	codigo_rol: number | undefined;
	nombre_rol: string;
	descripcion_rol: string;
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
	//experiencia_profesional_per: string;
	//titulacion_per: string;
	sueldo_per: number | undefined;
	//telefono_per: number| undefined;
	//correo_per: string;
	//labor_per: string;
	fk_lugar: number | undefined;
	fk_usuario: number | undefined;
}

export interface Proveedor {
	codigo_com: number | undefined;
	rif_jur: string;
	denominacion_persona_jur: string;
	razon_social_jur: string;
	pagina_web_jur: string;
	//telefono_com: number[];
	//correo_com: string[];
	direccion_com: string;
	monto_acreditado_com: number | undefined;
	fecha_inicio_operaciones_com: Date | undefined;
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
	codigo_ce: number;
	direccion_correo_ce: string;
	fk_persona: number | undefined;
	fk_empleado: number | undefined;
}
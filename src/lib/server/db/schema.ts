
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
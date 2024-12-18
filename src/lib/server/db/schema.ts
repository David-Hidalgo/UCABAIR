
export 	interface Rol {
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
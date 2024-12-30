CREATE TABLE almacen (
    codigo_alm INTEGER NOT NULL,
    tamaño_alm VARCHAR(255) NOT NULL,
    fk_sede    INTEGER NOT NULL
);
CREATE TABLE asistencia (
    codigo_asi     	INTEGER NOT NULL,
    fecha_asi           DATE NOT NULL,
    hora_entrada_asi    TIMESTAMP,
    hora_salida_asi     TIMESTAMP,
    fk_empleado         INTEGER NOT NULL
);
CREATE TABLE avion (
    codigo_avi       INTEGER NOT NULL,
    color_avi        VARCHAR(255) NOT NULL,
    fk_modelo_avion  INTEGER NOT NULL,
    fk_venta         INTEGER NOT NULL,
    fk_almacen       INTEGER NOT NULL,
    fk_almacen2      INTEGER NOT NULL,
    fk_ensamblaje    INTEGER NOT NULL,
    nombre_avi	     VARCHAR(255) NOT NULL,
    matricula_avi    VARCHAR(255) NOT NULL
);
CREATE TABLE beneficiario (
    codigo_ben             INTEGER NOT NULL,
    primer_nombre_ben      VARCHAR(255) NOT NULL,
    segundo_nombre_ben     VARCHAR(255) NOT NULL,
    primer_apellido_ben    VARCHAR(255) NOT NULL,
    segundo_apellido_ben   VARCHAR(255) NOT NULL,
    descripcion_ben        TEXT NOT NULL,
    fk_empleado            INTEGER NOT NULL
);
CREATE TABLE caracteristica (
    codigo_car INTEGER NOT NULL,
    nombre_car VARCHAR(255) NOT NULL
);
CREATE TABLE caracteristica_modelo (
    valor_cm           INTEGER,
    unidad_medida_cm   VARCHAR(255),
    fk_caracteristica  INTEGER NOT NULL,
    fk_modelo_avion    INTEGER NOT NULL
);
CREATE TABLE caracteristica_pieza (
    valor_cp         	 INTEGER,
    unidad_medida_cp 	 VARCHAR(255),
    fk_tipo_pieza        INTEGER NOT NULL,
    fk_caracteristica    INTEGER NOT NULL
);
CREATE TABLE persona (
    codigo_com                 INTEGER NOT NULL,
    direccion_com              VARCHAR(516) NOT NULL,
    monto_acreditado_com       REAL NOT NULL,
    fecha_inicio_operacion_com DATE NOT NULL,
    tipo_com                   VARCHAR(255) NOT NULL,
    nacionalidad_com           VARCHAR(255) NOT NULL,
    fk_lugar                   INTEGER NOT NULL,
    fk_usuario         	       INTEGER NOT NULL,
    tipo_persona_com 	       VARCHAR(255) NOT NULL,
    rif_jur                    VARCHAR(255),
    denominacion_persona_jur VARCHAR(255),
    razon_social_jur           VARCHAR(255),
    pagina_web_jur             VARCHAR(255),
    cedula_nat                 VARCHAR(100),
    primer_nombre_nat          VARCHAR(255),
    segundo_nombre_nat         VARCHAR(255),
    primer_apellido_nat        VARCHAR(255),
    segundo_apellido_nat       VARCHAR(255)
);
CREATE TABLE compra (
    codigo_compra_com  INTEGER NOT NULL,
    numero_factura_com INTEGER NOT NULL,
    fecha_hora_com     DATE NOT NULL,
    monto_total_com    REAL NOT NULL,
    impuesto_total_com REAL NOT NULL
);
CREATE TABLE configuracion_avion (
    cantidad_pieza_ca     INTEGER NOT NULL,
    fk_tipo_pieza         INTEGER NOT NULL,
    fk_modelo_avion       INTEGER NOT NULL,
    fk_sede       	  INTEGER NOT NULL
);
CREATE TABLE configuracion_pieza (
    cantidad_materia_prima_cp 	  INTEGER NOT NULL,
    fk_tipo_materia_prima         INTEGER NOT NULL,
    fk_tipo_pieza                 INTEGER NOT NULL,
    fk_sede                       INTEGER NOT NULL
);
CREATE TABLE correo_electronico (
    codigo_ce           INTEGER NOT NULL,
    direccion_correo_ce VARCHAR(255) NOT NULL,
    fk_persona        INTEGER,
    fk_empleado 	INTEGER
);
CREATE TABLE detalle_compra (
    cantidad_dc        INTEGER NOT NULL,
    precio_unitario_dc REAL NOT NULL,
    fk_compra  	       INTEGER NOT NULL,
    codigo_dc          INTEGER NOT NULL,
    fk_persona	       INTEGER NOT NULL
);
CREATE TABLE detalle_venta (
    cantidad_dv        INTEGER NOT NULL,
    precio_unitario_dv REAL NOT NULL,
    fk_venta   	       INTEGER NOT NULL,
    codigo_dv          INTEGER NOT NULL,
    fk_persona	       INTEGER NOT NULL
);
CREATE TABLE embalaje (
    codigo_emb            INTEGER NOT NULL,
    fecha_hora_inicio_emb DATE NOT NULL,
    fecha_hora_fin_emb    DATE,
    fk_embalaje_plan      INTEGER NOT NULL,
    fk_pieza              INTEGER,
    fk_equipo_empleado    INTEGER NOT NULL,
    fk_equipo_empleado2   INTEGER NOT NULL,
    fk_lote_materia_prima INTEGER
);
CREATE TABLE embalaje_configuracion_avion (
    fk_embalaje_plan                     INTEGER NOT NULL,
    fk_modelo_avion			 INTEGER NOT NULL,
    fk_sede				 INTEGER NOT NULL
);
CREATE TABLE embalaje_configuracion_pieza (
    fk_embalaje_plan                     INTEGER NOT NULL,
    fk_tipo_pieza			 INTEGER NOT NULL,
    fk_sede				 INTEGER NOT NULL
);
CREATE TABLE embalaje_configuracion_materia (
    fk_embalaje_plan                     INTEGER NOT NULL,
    fk_tipo_materia_prima		 INTEGER NOT NULL,
    fk_sede				 INTEGER NOT NULL
);
CREATE TABLE embalaje_plan (
    codigo_ep            INTEGER NOT NULL,
    duracion_estimada_ep VARCHAR(255) NOT NULL
);
CREATE TABLE empleado_profesion (
    titulacion_ep                VARCHAR(255) NOT NULL,
    experiencia_profesional_ep   VARCHAR(255) NOT NULL,
    fk_profesion                 INTEGER NOT NULL,
    fk_empleado        		 INTEGER NOT NULL
);
CREATE TABLE ensamblaje (
    codigo_ens          	 INTEGER NOT NULL,
    fecha_inicio_ens    	 DATE NOT NULL,
    fecha_fin_ens                DATE,
    fk_plan_ensamblaje           INTEGER NOT NULL,
    fk_pieza                     INTEGER,
    fk_lote_materia_prima        INTEGER,
    fk_equipo_empleado           INTEGER NOT NULL,
    fk_equipo_empleado2          INTEGER NOT NULL
);
CREATE TABLE configuracion_ensamblaje_pieza (
    fk_plan_ensamblaje               	  INTEGER NOT NULL,
    fk_tipo_pieza                         INTEGER NOT NULL,
    fk_sede				  INTEGER NOT NULL
);
CREATE TABLE configuracion_ensamblaje_materia (
    fk_plan_ensamblaje               	 INTEGER NOT NULL,
    fk_tipo_materia_prima                INTEGER NOT NULL,
    fk_sede				 INTEGER NOT NULL
);
CREATE TABLE equipo (
    codigo_equ      	INTEGER NOT NULL,
    descripcion_equ 	VARCHAR NOT NULL,
    fk_labor     	INTEGER NOT NULL,
    fk_zona       	INTEGER NOT NULL,
    fk_zona2      	INTEGER NOT NULL
);
CREATE TABLE equipo_empleado (
    lider_equipo_ep     BOOLEAN NOT NULL,
    fk_equipo           INTEGER NOT NULL,
    fk_empleado		INTEGER NOT NULL
);
CREATE TABLE estatus (
    codigo_est INTEGER NOT NULL,
    nombre_est VARCHAR(255) NOT NULL
);
CREATE TABLE estatus_historial_ensamblaje (
    fecha_ehe             DATE NOT NULL,
    fk_estatus    	  INTEGER NOT NULL,
    fk_ensamblaje 	  INTEGER NOT NULL
);
CREATE TABLE estimacion_profesion_empleado (
    codigo_epp            	 INTEGER NOT NULL,
    fk_tipo_prueba               INTEGER,
    fk_embalaje_plan             INTEGER,
    fk_plan_transporte           INTEGER,
    fk_plan_ensamblaje           INTEGER,
    cantidad_empleado_epp 	 INTEGER NOT NULL,
    fk_profesion            	 INTEGER NOT NULL
);
CREATE TABLE historial_estatus_compra (
    fk_compra 		INTEGER NOT NULL,
    fk_estatus          INTEGER NOT NULL,
    fecha_hec           DATE NOT NULL
);
CREATE TABLE historial_estatus_embalaje (
    fecha_hee           DATE NOT NULL,
    fk_estatus  	INTEGER NOT NULL,
    fk_embalaje 	INTEGER NOT NULL
);
CREATE TABLE historial_estatus_prueba (
    fk_estatus 		INTEGER NOT NULL,
    fk_prueba  		INTEGER NOT NULL,
    fecha_hep           DATE NOT NULL
);
CREATE TABLE historial_estatus_solicitud_transferencia (
    fecha_hest                          DATE NOT NULL, 
    fk_solicitud_transferencia 		INTEGER NOT NULL,
    fk_estatus                		INTEGER NOT NULL
);
CREATE TABLE historial_estatus_transporte (
    fecha_het             DATE NOT NULL,
    fk_estatus    	  INTEGER NOT NULL,
    fk_transporte	  INTEGER NOT NULL
);
CREATE TABLE historial_estatus_venta (
    fecha_hev              DATE NOT NULL,
    fk_venta		   INTEGER NOT NULL,
    fk_estatus     	   INTEGER NOT NULL
);
CREATE TABLE horario (
    fk_turno             INTEGER NOT NULL,
    fk_empleado		 INTEGER NOT NULL
);
CREATE TABLE labor (
    codigo_lab            INTEGER NOT NULL,
    nombre_lab            VARCHAR(255) NOT NULL,
    nivel_importancia_lab VARCHAR(255) NOT NULL
);
CREATE TABLE lote_materia_prima (
    codigo_lmp        		INTEGER NOT NULL,
    fk_configuracion_pieza      INTEGER NOT NULL,
    fk_configuracion_pieza2     INTEGER NOT NULL,
    fk_compra 			INTEGER NOT NULL,
    fk_almacen        		INTEGER NOT NULL,
    fk_almacen2        		INTEGER NOT NULL,
    cantidad_lmp      		INTEGER NOT NULL
);
CREATE TABLE lugar (
    codigo_lug  SERIAL NOT NULL,
    nombre_lug  VARCHAR(255) NOT NULL,
    tipo_lug    VARCHAR(255) NOT NULL,
    fk_lugar    INTEGER
);

CREATE TABLE modelo_avion (
    codigo_ma        INTEGER NOT NULL,
    nombre_ma        VARCHAR(255) NOT NULL,
    descripcion_ma   VARCHAR(255) NOT NULL,
    precio_unidad_ma REAL NOT NULL,
    fk_modelo_avion  INTEGER
);
CREATE TABLE modo_pago (
    codigo_mp INTEGER NOT NULL,
    tipo_mp VARCHAR(100) NOT NULL,
    numero_tarjeta_tar    INTEGER,
    banco_tar             VARCHAR(255),
    cvv_tar               NUMERIC(3),
    fecha_vencimiento_tar DATE,
    nombre_tar            VARCHAR(100),
    fecha_emision_tar     DATE,
    numero_transferencia_tran INTEGER,
    fecha_emision_tran        DATE,
    numero_cuenta_tran        INTEGER,
    numero_cheque_che INTEGER,
    banco_che         VARCHAR(255),
    fecha_emision_che DATE,
    beneficiario_che  VARCHAR(255),
    denominacion_efe VARCHAR(255)
);
CREATE TABLE moneda (
    codigo_mon      INTEGER NOT NULL,
    nombre_mon      VARCHAR(255) NOT NULL,
    tasa_cambio_mon REAL NOT NULL,
    fecha_inicio_mon DATE NOT NULL,
    fecha_fin_mon    DATE
);
CREATE TABLE pago_compra (
    codigo_pago_pc    	 INTEGER NOT NULL,
    fecha_pago_pc     	 DATE NOT NULL,
    fk_modo_pago         INTEGER NOT NULL,
    fk_compra		 INTEGER NOT NULL
);
CREATE TABLE pago_moneda ( 
    fk_pago_venta INTEGER,
    fk_moneda INTEGER, 
    fk_pago_compra INTEGER,
    cantidad_dinero_pm REAL NOT NULL,
    codigo_pm INTEGER NOT NULL
);
CREATE TABLE pago_empleado (
    codigo_pp               INTEGER NOT NULL,
    fecha_pago_pp           DATE NOT NULL,
    monto_pago_sueldo_pp    REAL NOT NULL,
    monto_pago_extra_pp     REAL,
    fk_empleado  	    INTEGER NOT NULL,
    fk_modo_pago            INTEGER NOT NULL
);
CREATE TABLE pago_venta (
    codigo_pago_pv   	INTEGER NOT NULL,
    fecha_pago_pv    	DATE NOT NULL,
    fk_venta 		INTEGER NOT NULL,
    fk_modo_pago        INTEGER NOT NULL
);
CREATE TABLE empleado (
    codigo_empleado_per       INTEGER NOT NULL,
    primer_nombre_per         VARCHAR(255) NOT NULL,
    segundo_nombre_per        VARCHAR(255),
    primer_apellido_per       VARCHAR(255) NOT NULL,
    segundo_apellido_per      VARCHAR(255),
    direccion_per             VARCHAR(516) NOT NULL,
    fecha_inicio_servicio_per DATE NOT NULL,
    fk_lugar                  INTEGER NOT NULL,
    sueldo_per                REAL NOT NULL,
    fk_usuario                INTEGER NOT NULL,
    cedula_per                VARCHAR(255) NOT NULL
);
CREATE TABLE pieza (
    codigo_pie   	      INTEGER NOT NULL,
    fk_pieza 		      INTEGER,
    fk_configuracion_avion    INTEGER NOT NULL,
    fk_configuracion_avion2   INTEGER NOT NULL,
    fk_almacen   	      INTEGER NOT NULL,
    fk_almacen2   	      INTEGER NOT NULL,
    fk_avion   		      INTEGER,
    fk_ensamblaje 	      INTEGER
);
CREATE TABLE plan_ensamblaje (
    codigo_pe            INTEGER NOT NULL,
    descripcion_pe       VARCHAR(255) NOT NULL,
    duracion_estimada_pe VARCHAR(255) NOT NULL
);
CREATE TABLE plan_transporte (
    codigo_pt            INTEGER NOT NULL,
    duracion_estimada_pt VARCHAR(255) NOT NULL,
    descripcion_pt       VARCHAR(255) NOT NULL
);
CREATE TABLE privilegio (
    codigo_pri INTEGER NOT NULL,
    nombre_pri VARCHAR(255) NOT NULL
);
CREATE TABLE rol_privilegio(
    fk_rol 	  INTEGER NOT NULL,
    fk_privilegio INTEGER NOT NULL
);
CREATE TABLE profesion (
    codigo_pro INTEGER NOT NULL,
    nombre_pro VARCHAR(255) NOT NULL
);
CREATE TABLE prueba (
    codigo_pru              INTEGER NOT NULL,
    fecha_inicio_pru        DATE NOT NULL,
    fecha_fin_pru           DATE,
    fk_tipo_prueba          INTEGER NOT NULL,
    fk_equipo_empleado      INTEGER NOT NULL,
    fk_equipo_empleado2     INTEGER NOT NULL,
    fk_zona          	    INTEGER NOT NULL,
    fk_zona2          	    INTEGER NOT NULL,
    fk_lote_materia_prima   INTEGER,
    fk_pieza          	    INTEGER,
    fk_avion                INTEGER
);
CREATE TABLE configuracion_prueba_avion (
    fk_tipo_prueba               	  INTEGER NOT NULL,
    fk_modelo_avion                       INTEGER NOT NULL,
    fk_sede				  INTEGER NOT NULL
);
CREATE TABLE configuracion_prueba_pieza (
    fk_tipo_prueba               	INTEGER NOT NULL,
    fk_tipo_pieza                       INTEGER NOT NULL,
    fk_sede				INTEGER NOT NULL
);
CREATE TABLE configuracion_prueba_materia (
    fk_tipo_prueba               	  INTEGER NOT NULL,
    fk_tipo_materia_prima                 INTEGER NOT NULL,
    fk_sede				  INTEGER NOT NULL
);
CREATE TABLE red_social (
    codigo_rs           INTEGER NOT NULL,
    direccion_rs        VARCHAR(255) NOT NULL,
    dominio_rs          VARCHAR(255) NOT NULL,
    fk_empleado         INTEGER NOT NULL
);
CREATE TABLE rol (
    codigo_rol INTEGER NOT NULL,
    nombre_rol VARCHAR(255) NOT NULL,
    descripcion_rol VARCHAR(255) NOT NULL
);
CREATE TABLE sede (
    codigo_sed    INTEGER NOT NULL,
    nombre_sed    VARCHAR(40) NOT NULL,
    direccion_sed VARCHAR(255) NOT NULL,
    fk_lugar      INTEGER NOT NULL,
    central_sed   BOOLEAN NOT NULL
);
CREATE TABLE solicitud_transferencia (
    codigo_st                INTEGER NOT NULL,
    fecha_envio_estimada_st  DATE NOT NULL,
    fecha_recibo_estimada_st DATE NOT NULL,
    fk_sede                  INTEGER NOT NULL,
    fk_sede2		     INTEGER NOT NULL
);
CREATE TABLE telefono (
    codigo_tel            INTEGER NOT NULL,
    numero_telefono_tel   VARCHAR NOT NULL,
    codigo_area_tel       VARCHAR(30) NOT NULL,
    fk_persona          INTEGER,
    fk_empleado 	  INTEGER
);
CREATE TABLE tipo_materia_prima (
    codigo_tmp        INTEGER NOT NULL,
    nombre_tmp        VARCHAR(255) NOT NULL,
    descripcion_tmp   VARCHAR(255) NOT NULL,
    unidad_medida_tmp VARCHAR(255) NOT NULL
);
CREATE TABLE tipo_pieza (
    codigo_tp           INTEGER NOT NULL,
    nombre_tp           VARCHAR(255) NOT NULL,
    descripcion_tp      VARCHAR(255) NOT NULL,
    fk_tipo_pieza       INTEGER,
    precio_unidad_tp    REAL NOT NULL
);
CREATE TABLE tipo_prueba (
    codigo_tp            INTEGER NOT NULL,
    nombre_tp            VARCHAR(255) NOT NULL,
    descripcion_tp       VARCHAR(512) NOT NULL,
    duracion_estimada_tp VARCHAR(255) NOT NULL
);
CREATE TABLE transferencia_pieza_material (
    cantidad_tpm      		INTEGER NOT NULL,
    unidad_medida_tpm 		VARCHAR(100) NOT NULL,
    fk_solicitud_transferencia  INTEGER NOT NULL,
    fk_lote_materia_prima       INTEGER,
    fk_pieza               	INTEGER,
    codigo_tpm			INTEGER NOT NULL,
    fecha_envio_tpm		DATE NOT NULL,
    fecha_recibo_tpm		DATE
);
CREATE TABLE transporte (
    codigo_tra            	INTEGER NOT NULL,
    fecha_hora_inicio_tra	DATE NOT NULL,
    fecha_hora_fin_tra    	DATE,
    fk_plan_transporte          INTEGER NOT NULL,
    fk_transferencia_pieza_material    INTEGER,
    fk_equipo_empleado          INTEGER NOT NULL,
    fk_equipo_empleado2   	INTEGER NOT NULL,
    fk_detalle_compra           INTEGER,
    fk_detalle_compra2          INTEGER,
    fk_detalle_compra3 		INTEGER
);
CREATE TABLE transporte_configuracion_avion (
    fk_plan_transporte                  INTEGER NOT NULL,
    fk_modelo_avion			INTEGER NOT NULL,
    fk_sede			 	INTEGER NOT NULL
);
CREATE TABLE transporte_configuracion_pieza (
    fk_plan_transporte                  INTEGER NOT NULL,
    fk_tipo_pieza			INTEGER NOT NULL,
    fk_sede			 	INTEGER NOT NULL
);
CREATE TABLE transporte_configuracion_materia (
    fk_plan_transporte                  INTEGER NOT NULL,
    fk_tipo_materia_prima			INTEGER NOT NULL,
    fk_sede			 	INTEGER NOT NULL
);
CREATE TABLE turno (
    codigo_tur       INTEGER NOT NULL,
    dia_tur          VARCHAR NOT NULL,
    hora_entrada_tur TIMESTAMP NOT NULL,
    hora_salida_tur  TIMESTAMP NOT NULL
);
CREATE TABLE usuario (
    codigo_usu SERIAL NOT NULL,
    nombre_usu VARCHAR(255) NOT NULL,
    contraseña_usu VARCHAR(255) NOT NULL,
    fk_rol INTEGER NOT NULL DEFAULT 2
);
CREATE TABLE venta (
    codigo_venta_ven   INTEGER NOT NULL,
    numero_factura_ven INTEGER NOT NULL,
    fecha_hora_ven     DATE NOT NULL,
    monto_total_ven    REAL NOT NULL,
    impuesto_total_ven REAL NOT NULL
);
CREATE TABLE zona (
    codigo_zon      INTEGER NOT NULL,
    nombre_zon      VARCHAR(255) NOT NULL,
    descripcion_zon VARCHAR(255) NOT NULL,
    fk_sede         INTEGER NOT NULL
);

CREATE TABLE sesion(

    id  VARCHAR(255) PRIMARY KEY,
    user_id INTEGER NOT NULL,
    expires_at timestamp with time zone NOT NULL

);

CREATE OR REPLACE PROCEDURE insertar_usuario(
    nombre_usu VARCHAR(255),
    contraseña_usu VARCHAR(255)
)
LANGUAGE plpgsql
AS $$ BEGIN
INSERT INTO usuario (nombre_usu,contraseña_usu) VALUES (nombre_usu,contraseña_usu);
END;
$$;

CREATE OR REPLACE PROCEDURE insertar_rol( 
    codigo_rol INTEGER, 
    nombre_rol VARCHAR(255),
    descripcion_rol VARCHAR(255)
    ) 
    LANGUAGE plpgsql
    AS $$ BEGIN
    INSERT INTO rol (codigo_rol,nombre_rol,descripcion_rol) 
    VALUES (codigo_rol,nombre_rol,descripcion_rol);
END;
$$;

CREATE OR REPLACE PROCEDURE eliminar_rol(
    codigo_rolN INTEGER
    ) 
    LANGUAGE plpgsql 
    AS $$ BEGIN
    DELETE FROM rol WHERE codigo_rol=codigo_rolN;
END;
$$;

CREATE OR REPLACE PROCEDURE insertar_tipo_prueba( 
    codigo_tp2            INTEGER,
    nombre_tp2            VARCHAR(255),
    descripcion_tp2       VARCHAR(512),
    duracion_estimada_tp2 VARCHAR(255)
    ) 
    LANGUAGE plpgsql
    AS $$ BEGIN
    INSERT INTO tipo_prueba (codigo_tp,nombre_tp,descripcion_tp,duracion_estimada_tp) 
    VALUES (codigo_tp2,nombre_tp2,descripcion_tp2,duracion_estimada_tp2);
END;
$$;

CREATE OR REPLACE PROCEDURE eliminar_tipo_prueba(
    codigo_tpN INTEGER
    ) 
    LANGUAGE plpgsql 
    AS $$ BEGIN
    DELETE FROM tipo_prueba WHERE codigo_tp=codigo_tpN;
END;
$$;

CREATE OR REPLACE PROCEDURE editar_rol(
    codigo_rolN INTEGER,
    nombre_rolN VARCHAR(255),
    descripcionN VARCHAR(255),
    viejo_codigo_rolN INTEGER
    ) 
    LANGUAGE plpgsql 
    AS $$ BEGIN
    UPDATE rol SET codigo_rol=codigo_rolN,nombre_rol=nombre_rolN,descripcion_rol=descripcionN
    WHERE codigo_rol=viejo_codigo_rolN;
END;
$$;

CREATE OR REPLACE PROCEDURE insertar_empleado( 
    codigo       INTEGER,
    primer_nombre         VARCHAR(255),
    segundo_nombre        VARCHAR(255),
    primer_apellido       VARCHAR(255),
    segundo_apellido      VARCHAR(255),
    direccion            VARCHAR(516),
    fecha_inicio_servicio DATE,
    fk_lugar                  INTEGER,
    sueldo                  REAL,
    fk_usuario                INTEGER,
    cedula                VARCHAR(255)
    ) 
    LANGUAGE plpgsql
    AS $$ BEGIN
    INSERT INTO empleado (codigo_empleado_per,primer_nombre_per,segundo_nombre_per,primer_apellido_per,
    segundo_apellido_per,direccion_per,fecha_inicio_servicio_per,fk_lugar,sueldo_per,fk_usuario,cedula_per) 
    VALUES (codigo,primer_nombre,segundo_nombre,primer_apellido,
    segundo_apellido,direccion,fecha_inicio_servicio,fk_lugar,sueldo,fk_usuario,cedula);
END;
$$;

CREATE OR REPLACE PROCEDURE eliminar_empleado(
    codigo INTEGER
    ) 
    LANGUAGE plpgsql 
    AS $$ BEGIN
    DELETE FROM empleado WHERE codigo_empleado_per=codigo;
END;
$$;

CREATE OR REPLACE PROCEDURE editar_empleado(
    codigo INTEGER,
    primer_nombre         VARCHAR(255),
    segundo_nombre        VARCHAR(255),
    primer_apellido       VARCHAR(255),
    segundo_apellido      VARCHAR(255),
    direccion            VARCHAR(516),
    fecha_inicio_servicio DATE,
    fk_lugar2                 INTEGER,
    sueldo                  REAL,
    fk_usuario2                INTEGER,
    cedula                VARCHAR(255),
    viejo_codigo INTEGER
    ) 
    LANGUAGE plpgsql 
    AS $$ BEGIN
    UPDATE empleado SET codigo_empleado_per=codigo,primer_nombre_per=primer_nombre,segundo_nombre_per=segundo_nombre,
    primer_apellido_per=primer_apellido,segundo_apellido_per=segundo_apellido,direccion_per=direccion,
    fecha_inicio_servicio_per=fecha_inicio_servicio,fk_lugar=fk_lugar2,sueldo_per=sueldo,fk_usuario=fk_usuario2,
    cedula_per=cedula
    WHERE codigo_empleado_per=viejo_codigo;
END;
$$;

CREATE OR REPLACE PROCEDURE insertar_persona( 
    codigo                 INTEGER,
    direccion             VARCHAR(516),
    monto_acreditado       REAL,
    fecha_inicio_operacion DATE,
    tipo                  VARCHAR(255),
    nacionalidad           VARCHAR(255),
    fk_lugar2                   INTEGER,
    fk_usuario2         	       INTEGER,
    tipo_persona 	       VARCHAR(255),
    rif                    VARCHAR(255),
    denominacion_persona VARCHAR(255),
    razon_social           VARCHAR(255),
    pagina_web             VARCHAR(255),
    cedula                VARCHAR(100),
    primer_nombre          VARCHAR(255),
    segundo_nombre         VARCHAR(255),
    primer_apellido        VARCHAR(255),
    segundo_apellido       VARCHAR(255)
    ) 
    LANGUAGE plpgsql
    AS $$ BEGIN
    INSERT INTO persona (codigo_com,direccion_com,monto_acreditado_com,fecha_inicio_operacion_com,
    tipo_com,nacionalidad_com,fk_lugar,fk_usuario,tipo_persona_com,rif_jur,
    denominacion_persona_jur,razon_social_jur,pagina_web_jur,cedula_nat,
    primer_nombre_nat,segundo_nombre_nat,primer_apellido_nat,segundo_apellido_nat) 
    VALUES (codigo,direccion,monto_acreditado,fecha_inicio_operacion,tipo,nacionalidad,
    fk_lugar2,fk_usuario2,tipo_persona,rif,denominacion_persona,razon_social,pagina_web,cedula,
    primer_nombre,segundo_nombre,primer_apellido,segundo_apellido);
END;
$$;

CREATE OR REPLACE PROCEDURE eliminar_persona(
    codigo INTEGER
    ) 
    LANGUAGE plpgsql 
    AS $$ BEGIN
    DELETE FROM persona WHERE codigo_com=codigo;
END;
$$;

CREATE OR REPLACE PROCEDURE editar_persona(
    codigo                 INTEGER,
    direccion             VARCHAR(516),
    monto_acreditado       REAL,
    fecha_inicio_operacion DATE,
    tipo                  VARCHAR(255),
    nacionalidad           VARCHAR(255),
    fk_lugar2                   INTEGER,
    fk_usuario2         	       INTEGER,
    tipo_persona 	       VARCHAR(255),
    rif                    VARCHAR(255),
    denominacion_persona VARCHAR(255),
    razon_social           VARCHAR(255),
    pagina_web             VARCHAR(255),
    cedula                VARCHAR(100),
    primer_nombre          VARCHAR(255),
    segundo_nombre         VARCHAR(255),
    primer_apellido        VARCHAR(255),
    segundo_apellido       VARCHAR(255),
    viejo_codigo           INTEGER
    ) 
    LANGUAGE plpgsql 
    AS $$ BEGIN
    UPDATE persona SET codigo_com=codigo,direccion_com=direccion,monto_acreditado_com=monto_acreditado,fecha_inicio_operacion_com=fecha_inicio_operacion,
    tipo_com=tipo,nacionalidad_com=nacionalidad,fk_lugar=fk_lugar2,fk_usuario=fk_usuario2,tipo_persona_com=tipo_persona,
    rif_jur=rif,denominacion_persona_jur=denominacion_persona,razon_social_jur=razon_social,pagina_web_jur=pagina_web,
    cedula_nat=cedula,primer_nombre_nat=primer_nombre,segundo_nombre_nat=segundo_nombre,primer_apellido_nat=primer_apellido,
    segundo_apellido_nat=segundo_apellido
    WHERE codigo_com=viejo_codigo;
END;
$$;
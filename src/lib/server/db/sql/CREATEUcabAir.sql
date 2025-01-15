CREATE TABLE
    almacen (
        codigo_alm INTEGER NOT NULL,
        tamaño_alm VARCHAR(255) NOT NULL,
        fk_sede INTEGER NOT NULL
    );

CREATE TABLE
    asistencia (
        codigo_asi INTEGER NOT NULL,
        fecha_asi DATE NOT NULL,
        hora_entrada_asi TIME,
        hora_salida_asi TIME,
        fk_empleado INTEGER NOT NULL
    );

CREATE TABLE
    avion (
        codigo_avi INTEGER NOT NULL,
        color_avi VARCHAR(255) NOT NULL,
        fk_modelo_avion INTEGER NOT NULL,
        fk_venta INTEGER NOT NULL,
        fk_almacen INTEGER NOT NULL,
        fk_almacen2 INTEGER NOT NULL,
        fk_ensamblaje INTEGER NOT NULL,
        nombre_avi VARCHAR(255) NOT NULL,
        matricula_avi VARCHAR(255) NOT NULL
    );

CREATE TABLE
    beneficiario (
        codigo_ben INTEGER NOT NULL,
        primer_nombre_ben VARCHAR(255) NOT NULL,
        segundo_nombre_ben VARCHAR(255) NOT NULL,
        primer_apellido_ben VARCHAR(255) NOT NULL,
        segundo_apellido_ben VARCHAR(255) NOT NULL,
        descripcion_ben TEXT NOT NULL,
        fk_empleado INTEGER NOT NULL
    );

CREATE TABLE
    caracteristica (
        codigo_car SERIAL NOT NULL,
        nombre_car VARCHAR(255) NOT NULL
    );

CREATE TABLE
    caracteristica_modelo (
        valor_cm INTEGER,
        unidad_medida_cm VARCHAR(255),
        fk_caracteristica INTEGER NOT NULL,
        fk_modelo_avion INTEGER NOT NULL
    );

CREATE TABLE
    caracteristica_pieza (
        valor_cp INTEGER,
        unidad_medida_cp VARCHAR(255),
        fk_tipo_pieza INTEGER NOT NULL,
        fk_caracteristica INTEGER NOT NULL
    );

CREATE TABLE
    persona (
        codigo_com SERIAL NOT NULL,
        direccion_com VARCHAR(516) NOT NULL,
        monto_acreditado_com REAL NOT NULL,
        fecha_inicio_operacion_com DATE NOT NULL,
        tipo_com VARCHAR(255) NOT NULL,
        nacionalidad_com VARCHAR(255) NOT NULL,
        fk_lugar INTEGER NOT NULL,
        fk_usuario INTEGER NOT NULL,
        tipo_persona_com VARCHAR(255) NOT NULL,
        rif_jur VARCHAR(255),
        denominacion_persona_jur VARCHAR(255),
        razon_social_jur VARCHAR(255),
        pagina_web_jur VARCHAR(255),
        cedula_nat VARCHAR(100),
        primer_nombre_nat VARCHAR(255),
        segundo_nombre_nat VARCHAR(255),
        primer_apellido_nat VARCHAR(255),
        segundo_apellido_nat VARCHAR(255)
    );

CREATE TABLE
    compra (
        codigo_compra_com SERIAL NOT NULL,
        numero_factura_com SERIAL NOT NULL,
        fecha_hora_com DATE NOT NULL,
        monto_total_com REAL NOT NULL,
        impuesto_total_com REAL NOT NULL
    );

CREATE TABLE
    configuracion_avion (
        cantidad_pieza_ca INTEGER DEFAULT 1,
        fk_tipo_pieza INTEGER NOT NULL,
        fk_modelo_avion INTEGER NOT NULL,
        fk_sede INTEGER NOT NULL
    );

CREATE TABLE
    configuracion_pieza (
        cantidad_materia_prima_cp INTEGER NOT NULL,
        fk_tipo_materia_prima INTEGER NOT NULL,
        fk_tipo_pieza INTEGER NOT NULL,
        fk_sede INTEGER NOT NULL
    );

CREATE TABLE
    correo_electronico (
        codigo_ce serial NOT NULL,
        direccion_correo_ce VARCHAR(255) NOT NULL,
        fk_persona INTEGER,
        fk_empleado INTEGER
    );

CREATE TABLE
    detalle_compra (
        cantidad_dc INTEGER NOT NULL,
        precio_unitario_dc REAL NOT NULL,
        fk_compra INTEGER NOT NULL,
        codigo_dc SERIAL NOT NULL,
        fk_persona INTEGER NOT NULL
    );

CREATE TABLE
    detalle_venta (
        cantidad_dv INTEGER NOT NULL,
        precio_unitario_dv REAL NOT NULL,
        fk_venta INTEGER NOT NULL,
        codigo_dv SERIAL NOT NULL,
        fk_persona INTEGER NOT NULL
    );

CREATE TABLE
    embalaje (
        codigo_emb INTEGER NOT NULL,
        fecha_hora_inicio_emb TIMESTAMP NOT NULL,
        fecha_hora_fin_emb TIMESTAMP,
        fk_embalaje_plan INTEGER NOT NULL,
        fk_pieza INTEGER,
        fk_equipo_empleado INTEGER NOT NULL,
        fk_equipo_empleado2 INTEGER NOT NULL,
        fk_lote_materia_prima INTEGER,
        fk_avion INTEGER
    );

CREATE TABLE
    embalaje_configuracion_avion (
        fk_embalaje_plan INTEGER NOT NULL,
        fk_modelo_avion INTEGER NOT NULL,
        fk_sede INTEGER NOT NULL
    );

CREATE TABLE
    embalaje_configuracion_pieza (
        fk_embalaje_plan INTEGER NOT NULL,
        fk_tipo_pieza INTEGER NOT NULL,
        fk_sede INTEGER NOT NULL
    );

CREATE TABLE
    embalaje_configuracion_materia (
        fk_embalaje_plan INTEGER NOT NULL,
        fk_tipo_materia_prima INTEGER NOT NULL,
        fk_sede INTEGER NOT NULL
    );

CREATE TABLE
    embalaje_plan (
        codigo_ep INTEGER NOT NULL,
        duracion_estimada_ep VARCHAR(255) NOT NULL
    );

CREATE TABLE
    empleado_profesion (
        titulacion_ep VARCHAR(255) NOT NULL,
        experiencia_profesional_ep VARCHAR(255) NOT NULL,
        fk_profesion INTEGER NOT NULL,
        fk_empleado INTEGER NOT NULL
    );

CREATE TABLE
    ensamblaje (
        codigo_ens INTEGER NOT NULL,
        fecha_inicio_ens DATE NOT NULL,
        fecha_fin_ens DATE,
        fk_plan_ensamblaje INTEGER NOT NULL,
        fk_pieza INTEGER,
        fk_lote_materia_prima INTEGER,
        fk_equipo_empleado INTEGER NOT NULL,
        fk_equipo_empleado2 INTEGER NOT NULL
    );

CREATE TABLE
    configuracion_ensamblaje_pieza (
        fk_plan_ensamblaje INTEGER NOT NULL,
        fk_tipo_pieza INTEGER NOT NULL,
        fk_sede INTEGER NOT NULL
    );

CREATE TABLE
    configuracion_ensamblaje_materia (
        fk_plan_ensamblaje INTEGER NOT NULL,
        fk_tipo_materia_prima INTEGER NOT NULL,
        fk_sede INTEGER NOT NULL
    );

CREATE TABLE
    equipo (
        codigo_equ INTEGER NOT NULL,
        descripcion_equ VARCHAR NOT NULL,
        fk_labor INTEGER NOT NULL,
        fk_zona INTEGER NOT NULL,
        fk_zona2 INTEGER NOT NULL
    );

CREATE TABLE
    equipo_empleado (
        lider_equipo_ep BOOLEAN NOT NULL,
        fk_equipo INTEGER NOT NULL,
        fk_empleado INTEGER NOT NULL
    );

CREATE TABLE
    estatus (
        codigo_est INTEGER NOT NULL,
        nombre_est VARCHAR(255) NOT NULL
    );

CREATE TABLE
    estatus_historial_ensamblaje (
        fecha_ehe DATE NOT NULL,
        fk_estatus INTEGER NOT NULL,
        fk_ensamblaje INTEGER NOT NULL
    );

CREATE TABLE
    estimacion_profesion_empleado (
        codigo_epp SERIAL NOT NULL,
        fk_tipo_prueba INTEGER,
        fk_embalaje_plan INTEGER,
        fk_plan_transporte INTEGER,
        fk_plan_ensamblaje INTEGER,
        cantidad_empleado_epp INTEGER DEFAULT 1,
        fk_profesion INTEGER NOT NULL
    );

CREATE TABLE
    historial_estatus_compra (
        fk_compra INTEGER NOT NULL,
        fk_estatus INTEGER NOT NULL,
        fecha_hec DATE NOT NULL
    );

CREATE TABLE
    historial_estatus_embalaje (
        fecha_hee DATE NOT NULL,
        fk_estatus INTEGER NOT NULL,
        fk_embalaje INTEGER NOT NULL
    );

CREATE TABLE
    historial_estatus_prueba (
        fk_estatus INTEGER NOT NULL,
        fk_prueba INTEGER NOT NULL,
        fecha_hep DATE NOT NULL
    );

CREATE TABLE
    historial_estatus_solicitud_transferencia (
        fecha_hest DATE NOT NULL,
        fk_solicitud_transferencia INTEGER NOT NULL,
        fk_estatus INTEGER NOT NULL
    );

CREATE TABLE
    historial_estatus_transporte (
        fecha_het DATE NOT NULL,
        fk_estatus INTEGER NOT NULL,
        fk_transporte INTEGER NOT NULL
    );

CREATE TABLE
    historial_estatus_venta (
        fecha_hev DATE NOT NULL,
        fk_venta INTEGER NOT NULL,
        fk_estatus INTEGER NOT NULL
    );

CREATE TABLE
    horario (
        fk_turno INTEGER NOT NULL,
        fk_empleado INTEGER NOT NULL
    );

CREATE TABLE
    labor (
        codigo_lab INTEGER NOT NULL,
        nombre_lab VARCHAR(255) NOT NULL,
        nivel_importancia_lab VARCHAR(255) NOT NULL
    );

CREATE TABLE
    lote_materia_prima (
        codigo_lmp INTEGER NOT NULL,
        fk_configuracion_pieza INTEGER NOT NULL,
        fk_configuracion_pieza2 INTEGER NOT NULL,
        fk_compra INTEGER NOT NULL,
        fk_almacen INTEGER NOT NULL,
        fk_almacen2 INTEGER NOT NULL,
        cantidad_lmp INTEGER NOT NULL
    );

CREATE TABLE
    lugar (
        codigo_lug SERIAL NOT NULL,
        nombre_lug VARCHAR(255) NOT NULL,
        tipo_lug VARCHAR(255) NOT NULL,
        fk_lugar INTEGER
    );

CREATE TABLE
    modelo_avion (
        codigo_ma SERIAL NOT NULL,
        nombre_ma VARCHAR(255) NOT NULL,
        descripcion_ma VARCHAR(255) NOT NULL,
        precio_unidad_ma REAL NOT NULL,
        fk_modelo_avion INTEGER
    );

CREATE TABLE
    modo_pago (
        codigo_mp SERIAL NOT NULL,
        tipo_mp VARCHAR(100) NOT NULL,
        numero_tarjeta_tar BIGINT,
        banco_tar VARCHAR(255),
        cvv_tar NUMERIC(3),
        fecha_vencimiento_tar DATE,
        nombre_tar VARCHAR(100),
        fecha_emision_tar DATE,
        numero_transferencia_tran BIGINT,
        fecha_emision_tran DATE,
        numero_cuenta_tran BIGINT,
        numero_cheque_che BIGINT,
        banco_che VARCHAR(255),
        fecha_emision_che DATE,
        beneficiario_che VARCHAR(255),
        denominacion_efe VARCHAR(255)
    );

CREATE TABLE
    moneda (
        codigo_mon INTEGER NOT NULL,
        nombre_mon VARCHAR(255) NOT NULL,
        tasa_cambio_mon REAL NOT NULL,
        fecha_inicio_mon DATE NOT NULL,
        fecha_fin_mon DATE
    );

CREATE TABLE
    pago_compra (
        codigo_pago_pc SERIAL NOT NULL,
        fecha_pago_pc DATE NOT NULL,
        fk_modo_pago INTEGER NOT NULL,
        fk_compra INTEGER NOT NULL
    );

CREATE TABLE
    pago_moneda (
        fk_pago_venta INTEGER,
        fk_moneda INTEGER,
        fk_pago_compra INTEGER,
        cantidad_dinero_pm REAL NOT NULL,
        codigo_pm SERIAL NOT NULL
    );

CREATE TABLE
    pago_empleado (
        codigo_pp INTEGER NOT NULL,
        fecha_pago_pp DATE NOT NULL,
        monto_pago_sueldo_pp REAL NOT NULL,
        monto_pago_extra_pp REAL,
        fk_empleado INTEGER NOT NULL,
        fk_modo_pago INTEGER NOT NULL
    );

CREATE TABLE
    pago_venta (
        codigo_pago_pv SERIAL NOT NULL,
        fecha_pago_pv DATE NOT NULL DEFAULT CURRENT_DATE,
        fk_venta INTEGER NOT NULL,
        fk_modo_pago INTEGER NOT NULL
    );

CREATE TABLE
    empleado (
        codigo_empleado_per SERIAL NOT NULL,
        primer_nombre_per VARCHAR(255) NOT NULL,
        segundo_nombre_per VARCHAR(255),
        primer_apellido_per VARCHAR(255) NOT NULL,
        segundo_apellido_per VARCHAR(255),
        direccion_per VARCHAR(516) NOT NULL,
        fecha_inicio_servicio_per DATE NOT NULL,
        fk_lugar INTEGER NOT NULL,
        sueldo_per REAL NOT NULL,
        fk_usuario INTEGER NOT NULL,
        cedula_per VARCHAR(255) NOT NULL
    );

CREATE TABLE
    pieza (
        codigo_pie INTEGER NOT NULL,
        fk_pieza INTEGER,
        fk_configuracion_avion INTEGER NOT NULL,
        fk_configuracion_avion2 INTEGER NOT NULL,
        fk_almacen INTEGER NOT NULL,
        fk_almacen2 INTEGER NOT NULL,
        fk_avion INTEGER,
        fk_ensamblaje INTEGER
    );

CREATE TABLE
    plan_ensamblaje (
        codigo_pe INTEGER NOT NULL,
        descripcion_pe VARCHAR(255) NOT NULL,
        duracion_estimada_pe VARCHAR(255) NOT NULL
    );

CREATE TABLE
    plan_transporte (
        codigo_pt INTEGER NOT NULL,
        duracion_estimada_pt VARCHAR(255) NOT NULL,
        descripcion_pt VARCHAR(255) NOT NULL
    );

CREATE TABLE
    privilegio (
        codigo_pri INTEGER NOT NULL,
        nombre_pri VARCHAR(255) NOT NULL
    );

CREATE TABLE
    rol_privilegio (
        fk_rol INTEGER NOT NULL,
        fk_privilegio INTEGER NOT NULL
    );

CREATE TABLE
    profesion (
        codigo_pro INTEGER NOT NULL,
        nombre_pro VARCHAR(255) NOT NULL
    );

CREATE TABLE
    prueba (
        codigo_pru INTEGER NOT NULL,
        fecha_inicio_pru DATE NOT NULL,
        fecha_fin_pru DATE,
        fk_tipo_prueba INTEGER NOT NULL,
        fk_equipo_empleado INTEGER NOT NULL,
        fk_equipo_empleado2 INTEGER NOT NULL,
        fk_zona INTEGER NOT NULL,
        fk_zona2 INTEGER NOT NULL,
        fk_lote_materia_prima INTEGER,
        fk_pieza INTEGER,
        fk_avion INTEGER
    );

CREATE TABLE
    configuracion_prueba_avion (
        fk_tipo_prueba INTEGER NOT NULL,
        fk_modelo_avion INTEGER NOT NULL,
        fk_sede INTEGER NOT NULL
    );

CREATE TABLE
    configuracion_prueba_pieza (
        fk_tipo_prueba INTEGER NOT NULL,
        fk_tipo_pieza INTEGER NOT NULL,
        fk_sede INTEGER NOT NULL
    );

CREATE TABLE
    configuracion_prueba_materia (
        fk_tipo_prueba INTEGER NOT NULL,
        fk_tipo_materia_prima INTEGER NOT NULL,
        fk_sede INTEGER NOT NULL
    );

CREATE TABLE
    red_social (
        codigo_rs INTEGER NOT NULL,
        direccion_rs VARCHAR(255) NOT NULL,
        dominio_rs VARCHAR(255) NOT NULL,
        fk_empleado INTEGER NOT NULL
    );

CREATE TABLE
    rol (
        codigo_rol INTEGER NOT NULL,
        nombre_rol VARCHAR(255) NOT NULL,
        descripcion_rol VARCHAR(255) NOT NULL
    );

CREATE TABLE
    sede (
        codigo_sed INTEGER NOT NULL,
        nombre_sed VARCHAR(40) NOT NULL,
        direccion_sed VARCHAR(255) NOT NULL,
        fk_lugar INTEGER NOT NULL,
        central_sed BOOLEAN NOT NULL
    );

CREATE TABLE
    solicitud_transferencia (
        codigo_st INTEGER NOT NULL,
        fecha_envio_estimada_st DATE NOT NULL,
        fecha_recibo_estimada_st DATE NOT NULL,
        fk_sede INTEGER NOT NULL,
        fk_sede2 INTEGER NOT NULL
    );

CREATE TABLE
    telefono (
        codigo_tel SERIAL NOT NULL,
        numero_telefono_tel VARCHAR NOT NULL,
        codigo_area_tel VARCHAR(30) NOT NULL,
        fk_persona INTEGER,
        fk_empleado INTEGER
    );

CREATE TABLE
    tipo_materia_prima (
        codigo_tmp INTEGER NOT NULL,
        nombre_tmp VARCHAR(255) NOT NULL,
        descripcion_tmp VARCHAR(255) NOT NULL,
        unidad_medida_tmp VARCHAR(255) NOT NULL
    );

CREATE TABLE
    tipo_pieza (
        codigo_tp SERIAL NOT NULL,
        nombre_tp VARCHAR(255) NOT NULL,
        descripcion_tp VARCHAR(255) NOT NULL,
        fk_tipo_pieza INTEGER,
        precio_unidad_tp REAL NOT NULL
    );

CREATE TABLE
    tipo_prueba (
        codigo_tp SERIAL NOT NULL,
        nombre_tp VARCHAR(255) NOT NULL,
        descripcion_tp VARCHAR(512) NOT NULL,
        duracion_estimada_tp VARCHAR(255) NOT NULL
    );

CREATE TABLE
    transferencia_pieza_material (
        cantidad_tpm INTEGER NOT NULL,
        unidad_medida_tpm VARCHAR(100) NOT NULL,
        fk_solicitud_transferencia INTEGER NOT NULL,
        fk_lote_materia_prima INTEGER,
        fk_pieza INTEGER,
        codigo_tpm INTEGER NOT NULL,
        fecha_envio_tpm DATE NOT NULL,
        fecha_recibo_tpm DATE
    );

CREATE TABLE
    transporte (
        codigo_tra INTEGER NOT NULL,
        fecha_hora_inicio_tra DATE NOT NULL,
        fecha_hora_fin_tra DATE,
        fk_plan_transporte INTEGER NOT NULL,
        fk_transferencia_pieza_material INTEGER,
        fk_equipo_empleado INTEGER NOT NULL,
        fk_equipo_empleado2 INTEGER NOT NULL,
        fk_detalle_compra INTEGER,
        fk_detalle_compra2 INTEGER,
        fk_detalle_compra3 INTEGER
    );

CREATE TABLE
    transporte_configuracion_avion (
        fk_plan_transporte INTEGER NOT NULL,
        fk_modelo_avion INTEGER NOT NULL,
        fk_sede INTEGER NOT NULL
    );

CREATE TABLE
    transporte_configuracion_pieza (
        fk_plan_transporte INTEGER NOT NULL,
        fk_tipo_pieza INTEGER NOT NULL,
        fk_sede INTEGER NOT NULL
    );

CREATE TABLE
    transporte_configuracion_materia (
        fk_plan_transporte INTEGER NOT NULL,
        fk_tipo_materia_prima INTEGER NOT NULL,
        fk_sede INTEGER NOT NULL
    );

CREATE TABLE
    turno (
        codigo_tur INTEGER NOT NULL,
        dia_tur VARCHAR NOT NULL,
        hora_entrada_tur TIME NOT NULL,
        hora_salida_tur TIME NOT NULL
    );

CREATE TABLE
    usuario (
        codigo_usu SERIAL NOT NULL,
        nombre_usu VARCHAR(255) UNIQUE NOT NULL,
        contraseña_usu VARCHAR(255) NOT NULL,
        fk_rol INTEGER NOT NULL DEFAULT 2
    );

CREATE TABLE
    venta (
        codigo_venta_ven SERIAL NOT NULL,
        numero_factura_ven SERIAL NOT NULL ,
        fecha_hora_ven TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        monto_total_ven REAL NOT NULL,
        impuesto_total_ven REAL NOT NULL
    );

CREATE TABLE
    zona (
        codigo_zon INTEGER NOT NULL,
        nombre_zon VARCHAR(255) NOT NULL,
        descripcion_zon VARCHAR(255) NOT NULL,
        fk_sede INTEGER NOT NULL
    );

CREATE TABLE
    sesion (
        id VARCHAR(255) PRIMARY KEY,
        user_id INTEGER NOT NULL,
        expires_at timestamp
        with
            time zone NOT NULL
    );

CREATE TABLE
    historial_inventario (
        codigo_hi INTEGER NOT NULL,
        fecha_entrada_hi TIMESTAMP NOT NULL,
        fecha_salida_hi TIMESTAMP NOT NULL,
        fk_almacen INTEGER NOT NULL,
        fk_almacen2 INTEGER NOT NULL,
        fk_avion INTEGER,
        fk_pieza INTEGER,
        fk_lote_materia_prima INTEGER
    );
CREATE OR REPLACE PROCEDURE insertar_usuario(nombre_usu VARCHAR(255), contraseña_usu VARCHAR(255)) LANGUAGE plpgsql AS $$ BEGIN
INSERT INTO usuario (nombre_usu,contraseña_usu) VALUES (nombre_usu,contraseña_usu);
END;
$$;


CREATE OR REPLACE PROCEDURE insertar_rol(codigo_rol INTEGER, nombre_rol VARCHAR(255), descripcion_rol VARCHAR(255)) LANGUAGE plpgsql AS $$ BEGIN
    INSERT INTO rol (codigo_rol,nombre_rol,descripcion_rol)
    VALUES (codigo_rol,nombre_rol,descripcion_rol);
END;
$$;


CREATE OR REPLACE PROCEDURE eliminar_rol(codigo_rolN INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    DELETE FROM rol WHERE codigo_rol=codigo_rolN;
END;
$$;


CREATE OR REPLACE PROCEDURE insertar_tipo_prueba(nombre_tp2 VARCHAR(255), descripcion_tp2 VARCHAR(512), duracion_estimada_tp2 VARCHAR(255)) LANGUAGE plpgsql AS $$ BEGIN
    INSERT INTO tipo_prueba (nombre_tp,descripcion_tp,duracion_estimada_tp)
    VALUES (nombre_tp2,descripcion_tp2,duracion_estimada_tp2);
END;
$$;


CREATE OR REPLACE PROCEDURE editar_tipo_prueba(codigo_tp2 INTEGER, nombre_tp2 VARCHAR(255), descripcion_tp2 VARCHAR(512), duracion_estimada_tp2 VARCHAR(255), codigo_tpN INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    UPDATE tipo_prueba SET nombre_tp=nombre_tp2,descripcion_tp=descripcion_tp2,duracion_estimada_tp=duracion_estimada_tp2
    WHERE codigo_tp=codigo_tpN;
END;
$$;


CREATE OR REPLACE PROCEDURE eliminar_tipo_prueba(codigo_tpN INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    DELETE FROM tipo_prueba WHERE codigo_tp=codigo_tpN;
END;
$$;


CREATE OR REPLACE PROCEDURE editar_rol(codigo_rolN INTEGER, nombre_rolN VARCHAR(255), descripcionN VARCHAR(255), viejo_codigo_rolN INTEGER, privilegios TEXT[]) LANGUAGE plpgsql AS $$
DECLARE
        privilege INTEGER;
BEGIN
    UPDATE rol SET codigo_rol=codigo_rolN,nombre_rol=nombre_rolN,descripcion_rol=descripcionN
    WHERE codigo_rol=viejo_codigo_rolN;

    DELETE FROM rol_privilegio WHERE fk_rol = viejo_codigo_rolN;

    FOREACH privilege IN ARRAY privilegios
    LOOP
        INSERT INTO rol_privilegio (fk_rol, fk_privilegio) VALUES (codigo_rolN, privilege);
    END LOOP;
END;
$$;


CREATE OR REPLACE PROCEDURE insertar_telefono(numero_telefono_tel2 VARCHAR, codigo_area_tel2 VARCHAR(30), fk_persona2 INTEGER, fk_empleado2 INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    INSERT INTO telefono (numero_telefono_tel,codigo_area_tel,fk_persona,fk_empleado)
    VALUES (numero_telefono_tel2,codigo_area_tel2,fk_persona2,fk_empleado2);
END;
$$;


CREATE OR REPLACE PROCEDURE insertar_correo(direccion_correo_ce2 VARCHAR(255), fk_persona2 INTEGER, fk_empleado2 INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    INSERT INTO correo_electronico (direccion_correo_ce,fk_persona,fk_empleado)
    VALUES (direccion_correo_ce2,fk_persona2,fk_empleado2);
END;
$$;


CREATE OR REPLACE PROCEDURE insertar_empleado(primer_nombre VARCHAR(255), segundo_nombre VARCHAR(255), primer_apellido VARCHAR(255), segundo_apellido VARCHAR(255), direccion VARCHAR(516), fecha_inicio_servicio DATE, fk_lugar INTEGER, sueldo REAL, fk_usuario INTEGER, cedula VARCHAR(255)) LANGUAGE plpgsql AS $$ BEGIN
    INSERT INTO empleado (primer_nombre_per,segundo_nombre_per,primer_apellido_per,
    segundo_apellido_per,direccion_per,fecha_inicio_servicio_per,fk_lugar,sueldo_per,fk_usuario,cedula_per)
    VALUES (primer_nombre,segundo_nombre,primer_apellido,
    segundo_apellido,direccion,fecha_inicio_servicio,fk_lugar,sueldo,fk_usuario,cedula);
END;
$$;


CREATE OR REPLACE PROCEDURE eliminar_empleado(codigo INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    DELETE FROM empleado WHERE codigo_empleado_per=codigo;
END;
$$;


CREATE OR REPLACE PROCEDURE editar_empleado(codigo INTEGER, primer_nombre VARCHAR(255), segundo_nombre VARCHAR(255), primer_apellido VARCHAR(255), segundo_apellido VARCHAR(255), direccion VARCHAR(516), fecha_inicio_servicio DATE, fk_lugar2 INTEGER, sueldo REAL, fk_usuario2 INTEGER, cedula VARCHAR(255), viejo_codigo INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    UPDATE empleado SET codigo_empleado_per=codigo,primer_nombre_per=primer_nombre,segundo_nombre_per=segundo_nombre,
    primer_apellido_per=primer_apellido,segundo_apellido_per=segundo_apellido,direccion_per=direccion,
    fecha_inicio_servicio_per=fecha_inicio_servicio,fk_lugar=fk_lugar2,sueldo_per=sueldo,fk_usuario=fk_usuario2,
    cedula_per=cedula
    WHERE codigo_empleado_per=viejo_codigo;
END;
$$;


CREATE OR REPLACE PROCEDURE insertar_persona(direccion VARCHAR(516), monto_acreditado REAL, fecha_inicio_operacion DATE, tipo VARCHAR(255), nacionalidad VARCHAR(255), fk_lugar2 INTEGER, fk_usuario2 INTEGER, tipo_persona VARCHAR(255), rif VARCHAR(255), denominacion_persona VARCHAR(255), razon_social VARCHAR(255), pagina_web VARCHAR(255), cedula VARCHAR(100), primer_nombre VARCHAR(255), segundo_nombre VARCHAR(255), primer_apellido VARCHAR(255), segundo_apellido VARCHAR(255), OUT id_persona INTEGER) LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO persona (direccion_com,monto_acreditado_com,fecha_inicio_operacion_com,
    tipo_com,nacionalidad_com,fk_lugar,fk_usuario,tipo_persona_com,rif_jur,
    denominacion_persona_jur,razon_social_jur,pagina_web_jur,cedula_nat,
    primer_nombre_nat,segundo_nombre_nat,primer_apellido_nat,segundo_apellido_nat)
    VALUES (direccion,monto_acreditado,fecha_inicio_operacion,tipo,nacionalidad,
    fk_lugar2,fk_usuario2,tipo_persona,rif,denominacion_persona,razon_social,pagina_web,cedula,
    primer_nombre,segundo_nombre,primer_apellido,segundo_apellido)
    RETURNING codigo_com INTO id_persona;
END;
$$;


CREATE OR REPLACE PROCEDURE eliminar_persona(codigo INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    DELETE FROM persona WHERE codigo_com=codigo;
END;
$$;


CREATE OR REPLACE PROCEDURE editar_persona(direccion VARCHAR(516), monto_acreditado REAL, fecha_inicio_operacion DATE, tipo VARCHAR(255), nacionalidad VARCHAR(255), fk_lugar2 INTEGER, fk_usuario2 INTEGER, tipo_persona VARCHAR(255), rif VARCHAR(255), denominacion_persona VARCHAR(255), razon_social VARCHAR(255), pagina_web VARCHAR(255), cedula VARCHAR(100), primer_nombre VARCHAR(255), segundo_nombre VARCHAR(255), primer_apellido VARCHAR(255), segundo_apellido VARCHAR(255), viejo_codigo INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    UPDATE persona SET direccion_com=direccion,monto_acreditado_com=monto_acreditado,fecha_inicio_operacion_com=fecha_inicio_operacion,
    tipo_com=tipo,nacionalidad_com=nacionalidad,fk_lugar=fk_lugar2,fk_usuario=fk_usuario2,tipo_persona_com=tipo_persona,
    rif_jur=rif,denominacion_persona_jur=denominacion_persona,razon_social_jur=razon_social,pagina_web_jur=pagina_web,
    cedula_nat=cedula,primer_nombre_nat=primer_nombre,segundo_nombre_nat=segundo_nombre,primer_apellido_nat=primer_apellido,
    segundo_apellido_nat=segundo_apellido
    WHERE codigo_com=viejo_codigo;
END;
$$;


CREATE OR REPLACE PROCEDURE insertar_aeronave(nombre_ma2 VARCHAR(255), descripcion_ma2 VARCHAR(255), precio_unidad_ma2 REAL, fk_modelo_avion2 INTEGER, Out id_ma INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    INSERT INTO modelo_avion (nombre_ma,descripcion_ma,precio_unidad_ma,fk_modelo_avion)
    VALUES (nombre_ma2,descripcion_ma2,precio_unidad_ma2,fk_modelo_avion2)
    RETURNING codigo_ma INTO id_ma;

END;
$$;


CREATE OR REPLACE PROCEDURE eliminar_modelo_avion(codigo INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    DELETE FROM modelo_avion WHERE codigo_ma=codigo;
END;
$$;


CREATE OR REPLACE PROCEDURE insertar_caracteristica(nombre_car2 VARCHAR(255), OUT salida INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    INSERT INTO caracteristica (nombre_car)
    VALUES (nombre_car2)
    RETURNING codigo_car into salida;
END;
$$;


CREATE OR REPLACE PROCEDURE insertar_caracteristica_modelo(valor_cm2 INTEGER, unidad_medida_cm2 VARCHAR(255), fk_caracteristica2 INTEGER, fk_modelo_avion2 INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    INSERT INTO caracteristica_modelo (valor_cm,unidad_medida_cm,fk_caracteristica,fk_modelo_avion)
    VALUES (valor_cm2,unidad_medida_cm2,fk_caracteristica2,fk_modelo_avion2);
END;
$$;


CREATE OR REPLACE PROCEDURE insertar_tipo_pieza(nombre_tp2 VARCHAR(255), descripcion_tp2 VARCHAR(255), fk_tipo_pieza2 INTEGER, precio_unidad_tp2 REAL, OUT salida INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    INSERT INTO tipo_pieza (nombre_tp,descripcion_tp,fk_tipo_pieza,precio_unidad_tp)
    VALUES (nombre_tp2,descripcion_tp2,fk_tipo_pieza2, precio_unidad_tp2)
    RETURNING codigo_tp into salida;
END;
$$;


CREATE OR REPLACE PROCEDURE editar_pieza(nombre_tp2 VARCHAR(255), descripcion_tp2 VARCHAR(255), fk_tipo_pieza2 INTEGER, precio_unidad_tp2 REAL, codigo_viejo INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    UPDATE tipo_pieza
SET
    nombre_tp = nombre_tp2,
    descripcion_tp = descripcion_tp2,
    fk_tipo_pieza=fk_tipo_pieza2,
    precio_unidad_tp = precio_unidad_tp2
WHERE codigo_tp = codigo_viejo;
END;
$$;


CREATE OR REPLACE PROCEDURE eliminar_tipo_pieza(codigo INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    DELETE FROM modelo_avion WHERE codigo_tp=codigo;
END;
$$;


CREATE OR REPLACE PROCEDURE eliminar_tipo_materia_prima(codigo INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    DELETE FROM tipo_materia_prima WHERE codigo_tmp=codigo;
END;
$$;


CREATE OR REPLACE PROCEDURE insertar_tipo_materia_prima(codigo_tmp2 INTEGER, nombre_tmp2 VARCHAR(255), descripcion_tmp2 VARCHAR(255), unidad_medida_tmp2 VARCHAR(255)) LANGUAGE plpgsql AS $$ BEGIN
    INSERT INTO tipo_materia_prima (codigo_tmp, nombre_tmp, descripcion_tmp, unidad_medida_tmp)
    VALUES (codigo_tmp2, nombre_tmp2, descripcion_tmp2, unidad_medida_tmp2);
END;
$$;


CREATE OR REPLACE PROCEDURE editar_tipo_materia_prima(codigo_tmp2 INTEGER, nombre_tmp2 VARCHAR(255), descripcion_tmp2 VARCHAR(255), unidad_medida_tmp2 VARCHAR(255), codigo_tmpN INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    UPDATE tipo_materia_prima
    SET codigo_tmp = codigo_tmp2, nombre_tmp = nombre_tmp2, descripcion_tmp = descripcion_tmp2, unidad_medida_tmp = unidad_medida_tmp2
    WHERE codigo_tmp = codigo_tmpN;
END;
$$;


CREATE OR REPLACE PROCEDURE editar_aeronave(codigo INTEGER, nombre VARCHAR(255), descripcion VARCHAR(255), precio_unidad REAL,fk_modelo_avion2 INTEGER, viejo_codigo INTEGER) LANGUAGE plpgsql AS $$ BEGIN
    UPDATE modelo_avion SET nombre_ma=nombre,descripcion_ma=descripcion,
    precio_unidad_ma=precio_unidad,fk_modelo_avion=fk_modelo_avion2
    WHERE codigo_ma=viejo_codigo;
END;
$$;


CREATE OR REPLACE PROCEDURE insertar_configuracion_avion(cantidad_pieza INTEGER, fk_tipo_pieza2 INTEGER[], fk_modelo_avion2 INTEGER, fk_sede2 INTEGER) LANGUAGE plpgsql AS $$
DECLARE
    tPieza INTEGER ;
BEGIN

    FOREACH tPieza IN ARRAY fk_tipo_pieza2
    LOOP
        INSERT INTO configuracion_avion (cantidad_pieza_ca, fk_tipo_pieza, fk_modelo_avion, fk_sede) VALUES
        (cantidad_pieza, tPieza, fk_modelo_avion2, fk_sede2);
    END LOOP;

END;
$$;


CREATE OR REPLACE PROCEDURE insertar_configuracion_embalaje(fk_modelo_avion2 INTEGER, fk_sede2 INTEGER, fk_embalaje_plan2 INTEGER, fk_profesion2 INTEGER[], cantidad_empleado_epp2 INTEGER) LANGUAGE plpgsql AS $$
DECLARE
    profesion INTEGER ;
BEGIN
    INSERT INTO embalaje_configuracion_avion (fk_embalaje_plan, fk_modelo_avion, fk_sede) VALUES
    (fk_embalaje_plan2, fk_modelo_avion2, fk_sede2);


    FOREACH profesion IN ARRAY fk_profesion2
    LOOP
        INSERT INTO estimacion_profesion_empleado (fk_tipo_prueba, fk_embalaje_plan, fk_plan_transporte, fk_plan_ensamblaje, cantidad_empleado_epp, fk_profesion)
        VALUES (NULL, fk_embalaje_plan2, NULL, NULL, cantidad_empleado_epp2, profesion);
    END LOOP;
END;
$$;


CREATE OR REPLACE PROCEDURE insertar_configuracion_transporte(fk_modelo_avion2 INTEGER, fk_sede2 INTEGER, fk_plan_transporte2 INTEGER, fk_profesion2 INTEGER[], cantidad_empleado_epp2 INTEGER) LANGUAGE plpgsql AS $$
    DECLARE
    profesion INTEGER ;
BEGIN

INSERT INTO transporte_configuracion_avion (fk_plan_transporte, fk_modelo_avion, fk_sede)
VALUES (fk_plan_transporte2, fk_modelo_avion2, fk_sede2);


FOREACH profesion IN ARRAY fk_profesion2
LOOP
    INSERT INTO estimacion_profesion_empleado (fk_tipo_prueba, fk_embalaje_plan, fk_plan_transporte, fk_plan_ensamblaje, cantidad_empleado_epp, fk_profesion)
    VALUES (NULL, NULL, fk_plan_transporte2, NULL, cantidad_empleado_epp2, profesion);
END LOOP;
END;
$$;


CREATE OR REPLACE PROCEDURE insertar_configuracion_prueba(fk_modelo_avion2 INTEGER, fk_sede2 INTEGER, fk_tipo_prueba2 INTEGER, fk_profesion2 INTEGER[], cantidad_empleado_epp2 INTEGER) LANGUAGE plpgsql AS $$
    DECLARE
    profesion INTEGER ;
BEGIN

    INSERT INTO configuracion_prueba_avion (fk_tipo_prueba, fk_modelo_avion, fk_sede)
    VALUES (fk_tipo_prueba2, fk_modelo_avion2, fk_sede2);

    FOREACH profesion IN ARRAY fk_profesion2
    LOOP
        INSERT INTO estimacion_profesion_empleado (fk_tipo_prueba, fk_embalaje_plan, fk_plan_transporte, fk_plan_ensamblaje, cantidad_empleado_epp, fk_profesion)
        VALUES (fk_tipo_prueba2, NULL, NULL, NULL, cantidad_empleado_epp2, profesion);
    END LOOP;
END;
$$;


CREATE OR REPLACE FUNCTION reponer_materia_prima_150() RETURNS TRIGGER AS $$
DECLARE
    monto REAL;
    impuesto REAL;
    nuevo_codigo_compra INTEGER;
BEGIN
    monto := FLOOR(1000 + RANDOM() * 30000);
    impuesto := FLOOR(100 + RANDOM() * 3000);

    IF NEW.cantidad_lmp <= 150 THEN
        INSERT INTO compra (fecha_hora_com, monto_total_com, impuesto_total_com)
        VALUES (CURRENT_DATE, monto, impuesto)
        RETURNING codigo_compra_com INTO nuevo_codigo_compra;

        INSERT INTO lote_materia_prima (codigo_lmp, fk_configuracion_pieza, fk_configuracion_pieza2, fk_compra, fk_almacen, fk_almacen2, cantidad_lmp)
        VALUES (
            (SELECT COALESCE(MAX(codigo_lmp), 0) + 1 FROM lote_materia_prima),
            2,
            5,
            nuevo_codigo_compra,
            8,
            3,
            0
        );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trigger_reponer_materia_prima_150 AFTER
UPDATE ON lote_materia_prima
FOR EACH ROW WHEN (NEW.cantidad_lmp <= 150) EXECUTE FUNCTION reponer_materia_prima_150();


CREATE OR REPLACE FUNCTION insertar_en_lote_materia_prima() RETURNS TRIGGER AS $$
DECLARE
    nuevo_codigo_lmp INTEGER;
BEGIN

    SELECT COALESCE(MAX(codigo_lmp), 0) + 1 INTO nuevo_codigo_lmp FROM lote_materia_prima;

    IF (SELECT es.nombre_est FROM estatus es inner join historial_estatus_compra hec on hec.fk_estatus=es.codigo_est
    WHERE es.codigo_est = NEW.fk_estatus limit 1) LIKE '%Listo%' THEN

        INSERT INTO lote_materia_prima (codigo_lmp, fk_configuracion_pieza, fk_configuracion_pieza2, fk_compra, fk_almacen, fk_almacen2, cantidad_lmp)
        VALUES (
            nuevo_codigo_lmp,
            2,
            5,
            NEW.fk_compra,
            8,
            3,
            170
        );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trigger_insertar_en_lote_materia_prima AFTER
INSERT ON historial_estatus_compra
FOR EACH ROW EXECUTE FUNCTION insertar_en_lote_materia_prima();


CREATE OR REPLACE PROCEDURE cambiar_estatus_compra(codigo_compra INTEGER) LANGUAGE plpgsql AS $$
BEGIN
    UPDATE historial_estatus_compra
    set fk_estatus=12
    where codigo_compra=fk_compra;
END;
$$;


CREATE
OR REPLACE PROCEDURE insertar_modo_pago (
    tipo_mp2 VARCHAR(100),
    numero_tarjeta_tar2 BIGINT,
    banco_tar2 VARCHAR(255),
    cvv_tar2 NUMERIC(3),
    fecha_vencimiento_tar2 DATE,
    nombre_tar2 VARCHAR(100),
    fecha_emision_tar2 DATE,
    numero_transferencia_tran2 BIGINT,
    fecha_emision_tran2 DATE,
    numero_cuenta_tran2 BIGINT,
    numero_cheque_che2 BIGINT,
    banco_che2 VARCHAR(255),
    fecha_emision_che2 DATE,
    beneficiario_che2 VARCHAR(255),
    denominacion_efe2 VARCHAR(255),
    out ret INTEGER
) LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO
    modo_pago (
        tipo_mp,
        numero_tarjeta_tar,
        banco_tar,
        cvv_tar,
        fecha_vencimiento_tar,
        nombre_tar,
        fecha_emision_tar,
        numero_transferencia_tran,
        fecha_emision_tran,
        numero_cuenta_tran,
        numero_cheque_che,
        banco_che,
        fecha_emision_che,
        beneficiario_che,
        denominacion_efe
    )
VALUES
    (
        tipo_mp2,
        numero_tarjeta_tar2,
        banco_tar2,
        cvv_tar2,
        fecha_vencimiento_tar2,
        nombre_tar2,
        fecha_emision_tar2,
        numero_transferencia_tran2,
        fecha_emision_tran2,
        numero_cuenta_tran2,
        numero_cheque_che2,
        banco_che2,
        fecha_emision_che2,
        beneficiario_che2,
        denominacion_efe2
    ) RETURNING codigo_mp INTO ret;

END;$$;

CREATE
OR REPLACE PROCEDURE insertar_pago_venta (
    monto_total_venI REAL,
    impuestoI REAL,
    cantidad_dinero_pmI REAL,
    fk_modo_pagoI INTEGER,
    fk_monedaI INTEGER,
    fk_personaI INTEGER,
    cantidad INTEGER
) LANGUAGE plpgsql
AS $$
DECLARE
    codigo_venta_venI INTEGER;
BEGIN
INSERT INTO
    venta (monto_total_ven, impuesto_total_ven)
VALUES
    (monto_total_venI*cantidad, impuestoI*cantidad) RETURNING codigo_venta_ven INTO codigo_venta_venI;

INSERT INTO
    pago_venta (fk_venta, fk_modo_pago)
VALUES
    (codigo_venta_venI, fk_modo_pagoI);

INSERT INTO
    pago_moneda (fk_pago_venta, fk_moneda, cantidad_dinero_pm)
VALUES
    (codigo_venta_venI, fk_monedaI, cantidad_dinero_pmI);

INSERT INTO 
    detalle_venta (fk_venta,fk_persona,cantidad_dv,precio_unitario_dv)
VALUES
    (codigo_venta_venI,fk_personaI,cantidad,monto_total_venI);

INSERT INTO
    historial_estatus_venta (fecha_hev, fk_venta, fk_estatus)
VALUES
    (CURRENT_DATE, codigo_venta_venI, 12);


END;$$;

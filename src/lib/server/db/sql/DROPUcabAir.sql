
DROP PROCEDURE IF EXISTS insertar_usuario;
ALTER TABLE sede DROP CONSTRAINT IF EXISTS fk_lugar;

ALTER TABLE almacen DROP CONSTRAINT IF EXISTS fk_sede;

ALTER TABLE lugar DROP CONSTRAINT IF EXISTS fk_lugar;

ALTER TABLE avion DROP CONSTRAINT IF EXISTS fk_ensamblaje;

ALTER TABLE pieza DROP CONSTRAINT IF EXISTS fk_ensamblaje;

ALTER TABLE embalaje DROP CONSTRAINT IF EXISTS fk_embalaje_plan;

ALTER TABLE transporte DROP CONSTRAINT IF EXISTS fk_plan_transporte;

ALTER TABLE equipo DROP CONSTRAINT IF EXISTS fk_zona;

ALTER TABLE transporte DROP CONSTRAINT IF EXISTS fk_detalle_tranferencia;

ALTER TABLE transporte DROP CONSTRAINT IF EXISTS fk_detalle_compra;

ALTER TABLE pago_venta DROP CONSTRAINT IF EXISTS fk_modo_pago;

ALTER TABLE transporte_configuracion_pieza DROP CONSTRAINT IF EXISTS fk_plan_transporte;

ALTER TABLE transporte_configuracion_pieza DROP CONSTRAINT IF EXISTS fk_configuracion_pieza;

ALTER TABLE transporte_configuracion_avion DROP CONSTRAINT IF EXISTS fk_plan_transporte;

ALTER TABLE transporte_configuracion_avion DROP CONSTRAINT IF EXISTS fk_configuracion_avion;

ALTER TABLE embalaje DROP CONSTRAINT IF EXISTS fk_pieza;

ALTER TABLE embalaje DROP CONSTRAINT IF EXISTS fk_equipo_personal;

ALTER TABLE transporte DROP CONSTRAINT IF EXISTS fk_equipo_personal;

ALTER TABLE ensamblaje DROP CONSTRAINT IF EXISTS fk_equipo_personal;

ALTER TABLE comercial DROP CONSTRAINT IF EXISTS fk_lugar;

ALTER TABLE embalaje DROP CONSTRAINT IF EXISTS fk_lote_materia_prima;

ALTER TABLE embalaje_configuracion_avion DROP CONSTRAINT IF EXISTS fk_embalaje_plan;

ALTER TABLE embalaje_configuracion_pieza DROP CONSTRAINT IF EXISTS fk_embalaje_plan;

ALTER TABLE embalaje_configuracion_avion DROP CONSTRAINT IF EXISTS fk_configuracion_avion;

ALTER TABLE embalaje_configuracion_pieza DROP CONSTRAINT IF EXISTS fk_configuracion_pieza;

ALTER TABLE rol DROP CONSTRAINT IF EXISTS fk_usuario;

ALTER TABLE privilegio DROP CONSTRAINT IF EXISTS fk_rol;

ALTER TABLE prueba_configuracion_avion DROP CONSTRAINT IF EXISTS fk_configuracion_avion;

ALTER TABLE prueba_configuracion_avion DROP CONSTRAINT IF EXISTS fk_tipo_prueba;

ALTER TABLE prueba_configuracion_pieza DROP CONSTRAINT IF EXISTS fk_configuracion_pieza;

ALTER TABLE personal DROP CONSTRAINT IF EXISTS fk_lugar;

ALTER TABLE prueba_configuracion_pieza DROP CONSTRAINT IF EXISTS fk_tipo_prueba;

ALTER TABLE estimacion_profesion_personal DROP CONSTRAINT IF EXISTS fk_tipo_prueba;

ALTER TABLE estimacion_profesion_personal DROP CONSTRAINT IF EXISTS fk_embalaje_plan;

ALTER TABLE estimacion_profesion_personal DROP CONSTRAINT IF EXISTS fk_plan_transporte;

ALTER TABLE estimacion_profesion_personal DROP CONSTRAINT IF EXISTS fk_plan_ensamblaje;

ALTER TABLE estimacion_profesion_personal DROP CONSTRAINT IF EXISTS fk_profesion;

ALTER TABLE comercial DROP CONSTRAINT IF EXISTS fk_usuario;

ALTER TABLE personal DROP CONSTRAINT IF EXISTS fk_usuario;

ALTER TABLE pago_personal DROP CONSTRAINT IF EXISTS fk_modo_pago;

ALTER TABLE horario DROP CONSTRAINT IF EXISTS fk_turno;

ALTER TABLE horario DROP CONSTRAINT IF EXISTS fk_personal;

ALTER TABLE zona DROP CONSTRAINT IF EXISTS fk_sede;

ALTER TABLE historial_estatus_compra DROP CONSTRAINT IF EXISTS fk_estatus;

ALTER TABLE historial_estatus_venta DROP CONSTRAINT IF EXISTS fk_venta;

ALTER TABLE historial_estatus_venta DROP CONSTRAINT IF EXISTS fk_estatus;

ALTER TABLE historial_estatus_transporte DROP CONSTRAINT IF EXISTS fk_estatus;

ALTER TABLE historial_estatus_transporte DROP CONSTRAINT IF EXISTS fk_transporte;

ALTER TABLE historial_estatus_embalaje DROP CONSTRAINT IF EXISTS fk_estatus;

ALTER TABLE historial_estatus_embalaje DROP CONSTRAINT IF EXISTS fk_embalaje;

ALTER TABLE solicitud_transferencia DROP CONSTRAINT IF EXISTS fk_sede2;

ALTER TABLE historial_estatus_solicitud_transferencia DROP CONSTRAINT IF EXISTS fk_solicitud_transferencia;

ALTER TABLE historial_estatus_solicitud_transferencia DROP CONSTRAINT IF EXISTS fk_estatus;

ALTER TABLE historial_estatus_prueba DROP CONSTRAINT IF EXISTS fk_estatus;

ALTER TABLE historial_estatus_prueba DROP CONSTRAINT IF EXISTS fk_prueba;

ALTER TABLE estatus_historial_ensamblaje DROP CONSTRAINT IF EXISTS fk_estatus;

ALTER TABLE estatus_historial_ensamblaje DROP CONSTRAINT IF EXISTS fk_ensamblaje;

ALTER TABLE solicitud_transferencia DROP CONSTRAINT IF EXISTS fk_sede;

ALTER TABLE transferencia_pieza_material DROP CONSTRAINT IF EXISTS fk_solicitud_transferencia;

ALTER TABLE detalle_transferencia DROP CONSTRAINT IF EXISTS fk_solicitud_transferencia;

ALTER TABLE correo_electronico DROP CONSTRAINT IF EXISTS fk_comercial;

ALTER TABLE correo_electronico DROP CONSTRAINT IF EXISTS fk_personal;

ALTER TABLE telefono DROP CONSTRAINT IF EXISTS fk_comercial;

ALTER TABLE telefono DROP CONSTRAINT IF EXISTS fk_personal;

ALTER TABLE red_social DROP CONSTRAINT IF EXISTS fk_personal;

ALTER TABLE pago_personal DROP CONSTRAINT IF EXISTS fk_personal;

ALTER TABLE beneficiario DROP CONSTRAINT IF EXISTS fk_personal;

ALTER TABLE asistencia DROP CONSTRAINT IF EXISTS fk_personal;

ALTER TABLE asistencia DROP CONSTRAINT IF EXISTS fk_turno;

ALTER TABLE equipo DROP CONSTRAINT IF EXISTS fk_labor;

ALTER TABLE equipo_personal DROP CONSTRAINT IF EXISTS fk_equipo;

ALTER TABLE equipo_personal DROP CONSTRAINT IF EXISTS fk_personal;

ALTER TABLE caracteristica_pieza DROP CONSTRAINT IF EXISTS fk_tipo_pieza;

ALTER TABLE caracteristica_pieza DROP CONSTRAINT IF EXISTS fk_caracteristica;

ALTER TABLE caracteristica_modelo DROP CONSTRAINT IF EXISTS fk_caracteristica;

ALTER TABLE caracteristica_modelo DROP CONSTRAINT IF EXISTS fk_modelo_avion;

ALTER TABLE tipo_pieza DROP CONSTRAINT IF EXISTS fk_tipo_pieza;

ALTER TABLE pieza DROP CONSTRAINT IF EXISTS fk_pieza;

ALTER TABLE modelo_avion DROP CONSTRAINT IF EXISTS fk_modelo_avion;

ALTER TABLE configuracion_pieza DROP CONSTRAINT IF EXISTS fk_tipo_materia_prima;

ALTER TABLE configuracion_pieza DROP CONSTRAINT IF EXISTS fk_tipo_pieza;

ALTER TABLE lote_materia_prima DROP CONSTRAINT IF EXISTS fk_configuracion_pieza;

ALTER TABLE configuracion_avion DROP CONSTRAINT IF EXISTS fk_tipo_pieza;

ALTER TABLE configuracion_avion DROP CONSTRAINT IF EXISTS fk_modelo_avion;

ALTER TABLE pieza DROP CONSTRAINT IF EXISTS fk_configuracion_avion;

ALTER TABLE avion DROP CONSTRAINT IF EXISTS fk_modelo_avion;

ALTER TABLE detalle_compra DROP CONSTRAINT IF EXISTS fk_compra;

ALTER TABLE prueba DROP CONSTRAINT IF EXISTS fk_tipo_prueba;

ALTER TABLE prueba DROP CONSTRAINT IF EXISTS fk_equipo_personal;

ALTER TABLE prueba DROP CONSTRAINT IF EXISTS fk_zona;

ALTER TABLE detalle_venta DROP CONSTRAINT IF EXISTS fk_venta;

ALTER TABLE historial_estatus_compra DROP CONSTRAINT IF EXISTS fk_compra;

ALTER TABLE transferencia_pieza_material DROP CONSTRAINT IF EXISTS fk_lote_materia_prima;

ALTER TABLE transferencia_pieza_material DROP CONSTRAINT IF EXISTS fk_pieza;

ALTER TABLE pago_compra DROP CONSTRAINT IF EXISTS fk_modo_pago;

ALTER TABLE configuracion_avion DROP CONSTRAINT IF EXISTS fk_sede;

ALTER TABLE configuracion_pieza DROP CONSTRAINT IF EXISTS fk_sede;

ALTER TABLE avion DROP CONSTRAINT IF EXISTS fk_venta;

ALTER TABLE lote_materia_prima DROP CONSTRAINT IF EXISTS fk_compra;

ALTER TABLE compra DROP CONSTRAINT IF EXISTS fk_comercial;

ALTER TABLE venta DROP CONSTRAINT IF EXISTS fk_comercial;

ALTER TABLE avion DROP CONSTRAINT IF EXISTS fk_almacen;

ALTER TABLE pieza DROP CONSTRAINT IF EXISTS fk_almacen;

ALTER TABLE lote_materia_prima DROP CONSTRAINT IF EXISTS fk_almacen;

ALTER TABLE pago_compra DROP CONSTRAINT IF EXISTS fk_compra;

ALTER TABLE pieza DROP CONSTRAINT IF EXISTS fk_avion;

ALTER TABLE pago_moneda DROP CONSTRAINT IF EXISTS fk_pago_venta;

ALTER TABLE pago_moneda DROP CONSTRAINT IF EXISTS fk_pago_compra;

ALTER TABLE pago_moneda DROP CONSTRAINT IF EXISTS fk_moneda;

ALTER TABLE prueba DROP CONSTRAINT IF EXISTS fk_lote_materia_prima;

ALTER TABLE prueba DROP CONSTRAINT IF EXISTS fk_pieza;

ALTER TABLE prueba DROP CONSTRAINT IF EXISTS fk_avion;

ALTER TABLE empleado_profesion DROP CONSTRAINT IF EXISTS fk_profesion;

ALTER TABLE pago_venta DROP CONSTRAINT IF EXISTS fk_venta;

ALTER TABLE empleado_profesion DROP CONSTRAINT IF EXISTS fk_personal;

ALTER TABLE ensamblaje_pieza DROP CONSTRAINT IF EXISTS fk_plan_ensamblaje;

ALTER TABLE ensamblaje_avion DROP CONSTRAINT IF EXISTS fk_plan_ensamblaje;

ALTER TABLE ensamblaje_pieza DROP CONSTRAINT IF EXISTS fk_configuracion_pieza;

ALTER TABLE ensamblaje_avion DROP CONSTRAINT IF EXISTS fk_configuracion_avion;

ALTER TABLE ensamblaje DROP CONSTRAINT IF EXISTS fk_plan_ensamblaje;

ALTER TABLE ensamblaje DROP CONSTRAINT IF EXISTS fk_pieza;

ALTER TABLE ensamblaje DROP CONSTRAINT IF EXISTS fk_lote_materia_prima;

ALTER TABLE lugar DROP CONSTRAINT IF EXISTS tipo_lug_check;

ALTER TABLE comercial DROP CONSTRAINT IF EXISTS tipo_com_check;

ALTER TABLE comercial DROP CONSTRAINT IF EXISTS tipo_comerial_com_check;

ALTER TABLE comercial DROP CONSTRAINT IF EXISTS comercial_fk_usuario_key;

ALTER TABLE comercial DROP CONSTRAINT IF EXISTS comercial_rif_jur_key;

ALTER TABLE comercial DROP CONSTRAINT IF EXISTS comercial_denominacion_comercial_jur_key;

ALTER TABLE comercial DROP CONSTRAINT IF EXISTS comercial_pagina_web_jur_key;

ALTER TABLE comercial DROP CONSTRAINT IF EXISTS comercial_cedula_nat_key;

ALTER TABLE compra DROP CONSTRAINT IF EXISTS compra_numero_factura_com_key;

ALTER TABLE correo_electronico DROP CONSTRAINT IF EXISTS correo_electronico_direccion_correo_ce_key;

ALTER TABLE personal DROP CONSTRAINT IF EXISTS personal_fk_usuario_key;

ALTER TABLE personal DROP CONSTRAINT IF EXISTS personal_cedula_per_key;

ALTER TABLE telefono DROP CONSTRAINT IF EXISTS telefono_numero_telefono_tel_key;





ALTER TABLE almacen DROP CONSTRAINT IF EXISTS almacen_pk;

ALTER TABLE asistencia DROP CONSTRAINT IF EXISTS asistencia_pk;

ALTER TABLE avion DROP CONSTRAINT IF EXISTS avion_pk;

ALTER TABLE beneficiario DROP CONSTRAINT IF EXISTS beneficiario_pk;

ALTER TABLE caracteristica DROP CONSTRAINT IF EXISTS caracteristica_pk;

ALTER TABLE caracteristica_modelo DROP CONSTRAINT IF EXISTS caracteristica_modelo_pk;

ALTER TABLE caracteristica_pieza DROP CONSTRAINT IF EXISTS caracteristica_pieza_pk;

ALTER TABLE comercial DROP CONSTRAINT IF EXISTS empresa_pk;

ALTER TABLE compra DROP CONSTRAINT IF EXISTS compra_pk;

ALTER TABLE configuracion_avion DROP CONSTRAINT IF EXISTS configuracion_avion_pk;

ALTER TABLE configuracion_pieza DROP CONSTRAINT IF EXISTS configuracion_pieza_pk;

ALTER TABLE correo_electronico DROP CONSTRAINT IF EXISTS arco_ce;

ALTER TABLE correo_electronico DROP CONSTRAINT IF EXISTS correo_electronico_pk;

ALTER TABLE detalle_compra DROP CONSTRAINT IF EXISTS detalle_compra_pk;

ALTER TABLE detalle_transferencia DROP CONSTRAINT IF EXISTS detalle_transferencia_pk;

ALTER TABLE detalle_venta DROP CONSTRAINT IF EXISTS detalle_venta_pk;

ALTER TABLE embalaje DROP CONSTRAINT IF EXISTS arco_emb;

ALTER TABLE embalaje DROP CONSTRAINT IF EXISTS embalaje_pk;

ALTER TABLE embalaje_configuracion_avion DROP CONSTRAINT IF EXISTS embalaje_configuracion_avion_pk;

ALTER TABLE embalaje_configuracion_pieza DROP CONSTRAINT IF EXISTS embalaje_configuracion_pieza_pk;

ALTER TABLE embalaje_plan DROP CONSTRAINT IF EXISTS embalaje_plan_pk;

ALTER TABLE empleado_profesion DROP CONSTRAINT IF EXISTS empleado_profesion_pk;

ALTER TABLE ensamblaje DROP CONSTRAINT IF EXISTS arco_ens;

ALTER TABLE ensamblaje DROP CONSTRAINT IF EXISTS ensamblaje_pk;

ALTER TABLE ensamblaje_avion DROP CONSTRAINT IF EXISTS ensamblaje_avion_pk;

ALTER TABLE ensamblaje_pieza DROP CONSTRAINT IF EXISTS ensamblaje_pieza_pk;

ALTER TABLE equipo DROP CONSTRAINT IF EXISTS equipo_pk;

ALTER TABLE equipo_personal DROP CONSTRAINT IF EXISTS equipo_personal_pk;

ALTER TABLE estatus DROP CONSTRAINT IF EXISTS estatus_pk;

ALTER TABLE estatus_historial_ensamblaje DROP CONSTRAINT IF EXISTS estatus_historial_ensamblaje_pk;

ALTER TABLE estimacion_profesion_personal DROP CONSTRAINT IF EXISTS estimacion_profesion_personal_pk;

ALTER TABLE historial_estatus_compra DROP CONSTRAINT IF EXISTS historial_estatus_compra_pk;

ALTER TABLE historial_estatus_embalaje DROP CONSTRAINT IF EXISTS historial_estatus_embalaje_pk;

ALTER TABLE historial_estatus_prueba DROP CONSTRAINT IF EXISTS historial_estatus_prueba_pk;

ALTER TABLE historial_estatus_solicitud_transferencia DROP CONSTRAINT IF EXISTS historial_estatus_solicitud_transferencia_pk;

ALTER TABLE historial_estatus_transporte DROP CONSTRAINT IF EXISTS historial_estatus_transporte_pk;

ALTER TABLE historial_estatus_venta DROP CONSTRAINT IF EXISTS historial_estatus_venta_pk;

ALTER TABLE horario DROP CONSTRAINT IF EXISTS horario_pk;

ALTER TABLE labor DROP CONSTRAINT IF EXISTS labor_pk;

ALTER TABLE lote_materia_prima DROP CONSTRAINT IF EXISTS lote_materia_prima_pk;

ALTER TABLE lugar DROP CONSTRAINT IF EXISTS lugar_pk;

ALTER TABLE modelo_avion DROP CONSTRAINT IF EXISTS modelo_avion_pk;

ALTER TABLE modo_pago DROP CONSTRAINT IF EXISTS modo_pago_pk;

ALTER TABLE moneda DROP CONSTRAINT IF EXISTS moneda_pk;

ALTER TABLE pago_compra DROP CONSTRAINT IF EXISTS pago_compra_pk;

ALTER TABLE pago_moneda DROP CONSTRAINT IF EXISTS arco_pm;

ALTER TABLE pago_moneda DROP CONSTRAINT IF EXISTS pago_moneda_pk;

ALTER TABLE pago_personal DROP CONSTRAINT IF EXISTS pago_personal_pk;

ALTER TABLE pago_venta DROP CONSTRAINT IF EXISTS pago_venta_pk;

ALTER TABLE personal DROP CONSTRAINT IF EXISTS personal_pk;

ALTER TABLE pieza DROP CONSTRAINT IF EXISTS pieza_pk;

ALTER TABLE plan_ensamblaje DROP CONSTRAINT IF EXISTS plan_ensamblaje_pk;

ALTER TABLE plan_transporte DROP CONSTRAINT IF EXISTS plan_transporte_pk;

ALTER TABLE privilegio DROP CONSTRAINT IF EXISTS privilegio_pk;

ALTER TABLE profesion DROP CONSTRAINT IF EXISTS profesion_pk;

ALTER TABLE prueba DROP CONSTRAINT IF EXISTS arco_pru;

ALTER TABLE prueba DROP CONSTRAINT IF EXISTS prueba_pk;

ALTER TABLE prueba_configuracion_avion DROP CONSTRAINT IF EXISTS prueba_configuracion_avion_pk;

ALTER TABLE prueba_configuracion_pieza DROP CONSTRAINT IF EXISTS prueba_configuracion_pieza_pk;

ALTER TABLE red_social DROP CONSTRAINT IF EXISTS red_social_pk;

ALTER TABLE rol DROP CONSTRAINT IF EXISTS rol_pk;

ALTER TABLE sede DROP CONSTRAINT IF EXISTS sede_pk;

ALTER TABLE solicitud_transferencia DROP CONSTRAINT IF EXISTS solicitud_transferencia_pk;

ALTER TABLE telefono DROP CONSTRAINT IF EXISTS arco_tel;

ALTER TABLE telefono DROP CONSTRAINT IF EXISTS telefono_pk;

ALTER TABLE tipo_materia_prima DROP CONSTRAINT IF EXISTS tipo_materia_prima_pk;

ALTER TABLE tipo_pieza DROP CONSTRAINT IF EXISTS tipo_pieza_pk;

ALTER TABLE tipo_prueba DROP CONSTRAINT IF EXISTS tipo_prueba_pk;

ALTER TABLE transferencia_pieza_material DROP CONSTRAINT IF EXISTS arco_tpm;

ALTER TABLE transferencia_pieza_material DROP CONSTRAINT IF EXISTS transferencia_pieza_material_pk;

ALTER TABLE transporte DROP CONSTRAINT IF EXISTS arco_tra;

ALTER TABLE transporte DROP CONSTRAINT IF EXISTS transporte_pk;

ALTER TABLE transporte_configuracion_avion DROP CONSTRAINT IF EXISTS transporte_configuracion_avion_pk;

ALTER TABLE transporte_configuracion_pieza DROP CONSTRAINT IF EXISTS transporte_configuracion_pieza_pk;

ALTER TABLE turno DROP CONSTRAINT IF EXISTS turno_pk;

ALTER TABLE sesion DROP CONSTRAINT IF EXISTS usuario_fk;

ALTER TABLE usuario DROP CONSTRAINT IF EXISTS usuario_pk;

ALTER TABLE venta DROP CONSTRAINT IF EXISTS venta_pk;

ALTER TABLE zona DROP CONSTRAINT IF EXISTS zona_pk;


DROP TABLE IF EXISTS almacen;
DROP TABLE IF EXISTS asistencia;
DROP TABLE IF EXISTS avion;
DROP TABLE IF EXISTS beneficiario;
DROP TABLE IF EXISTS caracteristica;
DROP TABLE IF EXISTS caracteristica_modelo;
DROP TABLE IF EXISTS caracteristica_pieza;
DROP TABLE IF EXISTS comercial;
DROP TABLE IF EXISTS compra;
DROP TABLE IF EXISTS configuracion_avion;
DROP TABLE IF EXISTS configuracion_pieza;
DROP TABLE IF EXISTS correo_electronico;
DROP TABLE IF EXISTS detalle_compra;
DROP TABLE IF EXISTS detalle_transferencia;
DROP TABLE IF EXISTS detalle_venta;
DROP TABLE IF EXISTS embalaje;
DROP TABLE IF EXISTS embalaje_configuracion_avion;
DROP TABLE IF EXISTS embalaje_configuracion_pieza;
DROP TABLE IF EXISTS embalaje_plan;
DROP TABLE IF EXISTS empleado_profesion;
DROP TABLE IF EXISTS ensamblaje;
DROP TABLE IF EXISTS ensamblaje_avion;
DROP TABLE IF EXISTS ensamblaje_pieza;
DROP TABLE IF EXISTS equipo;
DROP TABLE IF EXISTS equipo_personal;
DROP TABLE IF EXISTS estatus;
DROP TABLE IF EXISTS estatus_historial_ensamblaje;
DROP TABLE IF EXISTS estimacion_profesion_personal;
DROP TABLE IF EXISTS historial_estatus_compra;
DROP TABLE IF EXISTS historial_estatus_embalaje;
DROP TABLE IF EXISTS historial_estatus_prueba;
DROP TABLE IF EXISTS historial_estatus_solicitud_transferencia;
DROP TABLE IF EXISTS historial_estatus_transporte;
DROP TABLE IF EXISTS historial_estatus_venta;
DROP TABLE IF EXISTS horario;
DROP TABLE IF EXISTS labor;
DROP TABLE IF EXISTS lote_materia_prima;
DROP TABLE IF EXISTS lugar;
DROP TABLE IF EXISTS modelo_avion;
DROP TABLE IF EXISTS modo_pago;
DROP TABLE IF EXISTS moneda;
DROP TABLE IF EXISTS pago_compra;
DROP TABLE IF EXISTS pago_moneda;
DROP TABLE IF EXISTS pago_personal;
DROP TABLE IF EXISTS pago_venta;
DROP TABLE IF EXISTS personal;
DROP TABLE IF EXISTS pieza;
DROP TABLE IF EXISTS plan_ensamblaje;
DROP TABLE IF EXISTS plan_transporte;
DROP TABLE IF EXISTS privilegio;
DROP TABLE IF EXISTS profesion;
DROP TABLE IF EXISTS prueba;
DROP TABLE IF EXISTS prueba_configuracion_avion;
DROP TABLE IF EXISTS prueba_configuracion_pieza;
DROP TABLE IF EXISTS red_social;
DROP TABLE IF EXISTS rol;
DROP TABLE IF EXISTS sede;
DROP TABLE IF EXISTS solicitud_transferencia;
DROP TABLE IF EXISTS telefono;
DROP TABLE IF EXISTS tipo_materia_prima;
DROP TABLE IF EXISTS tipo_pieza;
DROP TABLE IF EXISTS tipo_prueba;
DROP TABLE IF EXISTS transferencia_pieza_material;
DROP TABLE IF EXISTS transporte;
DROP TABLE IF EXISTS transporte_configuracion_avion;
DROP TABLE IF EXISTS transporte_configuracion_pieza;
DROP TABLE IF EXISTS turno;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS venta;
DROP TABLE IF EXISTS zona;
DROP TABLE IF EXISTS sesion;

DROP SEQUENCE IF EXISTS usuario_codigo_usu_seq;
DROP SEQUENCE IF EXISTS lugar_codigo_lug_seq;


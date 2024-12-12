DROP PROCEDURE IF EXISTS insertar_usuario;
DROP PROCEDURE IF EXISTS eliminar_rol;

ALTER TABLE IF EXISTS sede DROP CONSTRAINT IF EXISTS fk_lugar;

ALTER TABLE IF EXISTS almacen DROP CONSTRAINT IF EXISTS fk_sede;

ALTER TABLE IF EXISTS usuario DROP CONSTRAINT IF EXISTS fk_rol;

ALTER TABLE IF EXISTS lugar DROP CONSTRAINT IF EXISTS fk_lugar;

ALTER TABLE IF EXISTS avion DROP CONSTRAINT IF EXISTS fk_ensamblaje;

ALTER TABLE IF EXISTS pieza DROP CONSTRAINT IF EXISTS fk_ensamblaje;

ALTER TABLE IF EXISTS embalaje DROP CONSTRAINT IF EXISTS fk_embalaje_plan;

ALTER TABLE IF EXISTS transporte DROP CONSTRAINT IF EXISTS fk_plan_transporte;

ALTER TABLE IF EXISTS equipo DROP CONSTRAINT IF EXISTS fk_zona;

ALTER TABLE IF EXISTS transporte DROP CONSTRAINT IF EXISTS fk_detalle_tranferencia;

ALTER TABLE IF EXISTS transporte DROP CONSTRAINT IF EXISTS fk_detalle_compra;

ALTER TABLE IF EXISTS pago_venta DROP CONSTRAINT IF EXISTS fk_modo_pago;

ALTER TABLE IF EXISTS transporte_configuracion_pieza DROP CONSTRAINT IF EXISTS fk_plan_transporte;

ALTER TABLE IF EXISTS transporte_configuracion_pieza DROP CONSTRAINT IF EXISTS fk_configuracion_pieza;

ALTER TABLE IF EXISTS transporte_configuracion_avion DROP CONSTRAINT IF EXISTS fk_plan_transporte;

ALTER TABLE IF EXISTS transporte_configuracion_avion DROP CONSTRAINT IF EXISTS fk_configuracion_avion;

ALTER TABLE IF EXISTS embalaje DROP CONSTRAINT IF EXISTS fk_pieza;

ALTER TABLE IF EXISTS embalaje DROP CONSTRAINT IF EXISTS fk_equipo_empleado;

ALTER TABLE IF EXISTS transporte DROP CONSTRAINT IF EXISTS fk_equipo_empleado;

ALTER TABLE IF EXISTS ensamblaje DROP CONSTRAINT IF EXISTS fk_equipo_empleado;

ALTER TABLE IF EXISTS persona DROP CONSTRAINT IF EXISTS fk_lugar;

ALTER TABLE IF EXISTS embalaje DROP CONSTRAINT IF EXISTS fk_lote_materia_prima;

ALTER TABLE IF EXISTS embalaje_configuracion_avion DROP CONSTRAINT IF EXISTS fk_embalaje_plan;

ALTER TABLE IF EXISTS embalaje_configuracion_pieza DROP CONSTRAINT IF EXISTS fk_embalaje_plan;

ALTER TABLE IF EXISTS embalaje_configuracion_avion DROP CONSTRAINT IF EXISTS fk_configuracion_avion;

ALTER TABLE IF EXISTS embalaje_configuracion_pieza DROP CONSTRAINT IF EXISTS fk_configuracion_pieza;

ALTER TABLE IF EXISTS privilegio DROP CONSTRAINT IF EXISTS fk_rol;

ALTER TABLE IF EXISTS prueba_configuracion_avion DROP CONSTRAINT IF EXISTS fk_configuracion_avion;

ALTER TABLE IF EXISTS prueba_configuracion_avion DROP CONSTRAINT IF EXISTS fk_tipo_prueba;

ALTER TABLE IF EXISTS prueba_configuracion_pieza DROP CONSTRAINT IF EXISTS fk_configuracion_pieza;

ALTER TABLE IF EXISTS empleado DROP CONSTRAINT IF EXISTS fk_lugar;

ALTER TABLE IF EXISTS prueba_configuracion_pieza DROP CONSTRAINT IF EXISTS fk_tipo_prueba;

ALTER TABLE IF EXISTS estimacion_profesion_empleado DROP CONSTRAINT IF EXISTS fk_tipo_prueba;

ALTER TABLE IF EXISTS estimacion_profesion_empleado DROP CONSTRAINT IF EXISTS fk_embalaje_plan;

ALTER TABLE IF EXISTS estimacion_profesion_empleado DROP CONSTRAINT IF EXISTS fk_plan_transporte;

ALTER TABLE IF EXISTS estimacion_profesion_empleado DROP CONSTRAINT IF EXISTS fk_plan_ensamblaje;

ALTER TABLE IF EXISTS estimacion_profesion_empleado DROP CONSTRAINT IF EXISTS fk_profesion;

ALTER TABLE IF EXISTS persona DROP CONSTRAINT IF EXISTS fk_usuario;

ALTER TABLE IF EXISTS empleado DROP CONSTRAINT IF EXISTS fk_usuario;

ALTER TABLE IF EXISTS pago_empleado DROP CONSTRAINT IF EXISTS fk_modo_pago;

ALTER TABLE IF EXISTS horario DROP CONSTRAINT IF EXISTS fk_turno;

ALTER TABLE IF EXISTS horario DROP CONSTRAINT IF EXISTS fk_empleado;

ALTER TABLE IF EXISTS zona DROP CONSTRAINT IF EXISTS fk_sede;

ALTER TABLE IF EXISTS historial_estatus_compra DROP CONSTRAINT IF EXISTS fk_estatus;

ALTER TABLE IF EXISTS historial_estatus_venta DROP CONSTRAINT IF EXISTS fk_venta;

ALTER TABLE IF EXISTS historial_estatus_venta DROP CONSTRAINT IF EXISTS fk_estatus;

ALTER TABLE IF EXISTS historial_estatus_transporte DROP CONSTRAINT IF EXISTS fk_estatus;

ALTER TABLE IF EXISTS historial_estatus_transporte DROP CONSTRAINT IF EXISTS fk_transporte;

ALTER TABLE IF EXISTS historial_estatus_embalaje DROP CONSTRAINT IF EXISTS fk_estatus;

ALTER TABLE IF EXISTS historial_estatus_embalaje DROP CONSTRAINT IF EXISTS fk_embalaje;

ALTER TABLE IF EXISTS solicitud_transferencia DROP CONSTRAINT IF EXISTS fk_sede2;

ALTER TABLE IF EXISTS historial_estatus_solicitud_transferencia DROP CONSTRAINT IF EXISTS fk_solicitud_transferencia;

ALTER TABLE IF EXISTS historial_estatus_solicitud_transferencia DROP CONSTRAINT IF EXISTS fk_estatus;

ALTER TABLE IF EXISTS historial_estatus_prueba DROP CONSTRAINT IF EXISTS fk_estatus;

ALTER TABLE IF EXISTS historial_estatus_prueba DROP CONSTRAINT IF EXISTS fk_prueba;

ALTER TABLE IF EXISTS estatus_historial_ensamblaje DROP CONSTRAINT IF EXISTS fk_estatus;

ALTER TABLE IF EXISTS estatus_historial_ensamblaje DROP CONSTRAINT IF EXISTS fk_ensamblaje;

ALTER TABLE IF EXISTS solicitud_transferencia DROP CONSTRAINT IF EXISTS fk_sede;

ALTER TABLE IF EXISTS transferencia_pieza_material DROP CONSTRAINT IF EXISTS fk_solicitud_transferencia;

ALTER TABLE IF EXISTS detalle_transferencia DROP CONSTRAINT IF EXISTS fk_solicitud_transferencia;

ALTER TABLE IF EXISTS correo_electronico DROP CONSTRAINT IF EXISTS fk_persona;

ALTER TABLE IF EXISTS correo_electronico DROP CONSTRAINT IF EXISTS fk_empleado;

ALTER TABLE IF EXISTS telefono DROP CONSTRAINT IF EXISTS fk_persona;

ALTER TABLE IF EXISTS telefono DROP CONSTRAINT IF EXISTS fk_empleado;

ALTER TABLE IF EXISTS red_social DROP CONSTRAINT IF EXISTS fk_empleado;

ALTER TABLE IF EXISTS pago_empleado DROP CONSTRAINT IF EXISTS fk_empleado;

ALTER TABLE IF EXISTS beneficiario DROP CONSTRAINT IF EXISTS fk_empleado;

ALTER TABLE IF EXISTS asistencia DROP CONSTRAINT IF EXISTS fk_empleado;

ALTER TABLE IF EXISTS asistencia DROP CONSTRAINT IF EXISTS fk_turno;

ALTER TABLE IF EXISTS equipo DROP CONSTRAINT IF EXISTS fk_labor;

ALTER TABLE IF EXISTS equipo_empleado DROP CONSTRAINT IF EXISTS fk_equipo;

ALTER TABLE IF EXISTS equipo_empleado DROP CONSTRAINT IF EXISTS fk_empleado;

ALTER TABLE IF EXISTS caracteristica_pieza DROP CONSTRAINT IF EXISTS fk_tipo_pieza;

ALTER TABLE IF EXISTS caracteristica_pieza DROP CONSTRAINT IF EXISTS fk_caracteristica;

ALTER TABLE IF EXISTS caracteristica_modelo DROP CONSTRAINT IF EXISTS fk_caracteristica;

ALTER TABLE IF EXISTS caracteristica_modelo DROP CONSTRAINT IF EXISTS fk_modelo_avion;

ALTER TABLE IF EXISTS tipo_pieza DROP CONSTRAINT IF EXISTS fk_tipo_pieza;

ALTER TABLE IF EXISTS pieza DROP CONSTRAINT IF EXISTS fk_pieza;

ALTER TABLE IF EXISTS modelo_avion DROP CONSTRAINT IF EXISTS fk_modelo_avion;

ALTER TABLE IF EXISTS configuracion_pieza DROP CONSTRAINT IF EXISTS fk_tipo_materia_prima;

ALTER TABLE IF EXISTS configuracion_pieza DROP CONSTRAINT IF EXISTS fk_tipo_pieza;

ALTER TABLE IF EXISTS lote_materia_prima DROP CONSTRAINT IF EXISTS fk_configuracion_pieza;

ALTER TABLE IF EXISTS configuracion_avion DROP CONSTRAINT IF EXISTS fk_tipo_pieza;

ALTER TABLE IF EXISTS configuracion_avion DROP CONSTRAINT IF EXISTS fk_modelo_avion;

ALTER TABLE IF EXISTS pieza DROP CONSTRAINT IF EXISTS fk_configuracion_avion;

ALTER TABLE IF EXISTS avion DROP CONSTRAINT IF EXISTS fk_modelo_avion;

ALTER TABLE IF EXISTS detalle_compra DROP CONSTRAINT IF EXISTS fk_compra;

ALTER TABLE IF EXISTS prueba DROP CONSTRAINT IF EXISTS fk_tipo_prueba;

ALTER TABLE IF EXISTS prueba DROP CONSTRAINT IF EXISTS fk_equipo_empleado;

ALTER TABLE IF EXISTS prueba DROP CONSTRAINT IF EXISTS fk_zona;

ALTER TABLE IF EXISTS detalle_venta DROP CONSTRAINT IF EXISTS fk_venta;

ALTER TABLE IF EXISTS historial_estatus_compra DROP CONSTRAINT IF EXISTS fk_compra;

ALTER TABLE IF EXISTS transferencia_pieza_material DROP CONSTRAINT IF EXISTS fk_lote_materia_prima;

ALTER TABLE IF EXISTS transferencia_pieza_material DROP CONSTRAINT IF EXISTS fk_pieza;

ALTER TABLE IF EXISTS pago_compra DROP CONSTRAINT IF EXISTS fk_modo_pago;

ALTER TABLE IF EXISTS configuracion_avion DROP CONSTRAINT IF EXISTS fk_sede;

ALTER TABLE IF EXISTS configuracion_pieza DROP CONSTRAINT IF EXISTS fk_sede;

ALTER TABLE IF EXISTS avion DROP CONSTRAINT IF EXISTS fk_venta;

ALTER TABLE IF EXISTS lote_materia_prima DROP CONSTRAINT IF EXISTS fk_compra;

ALTER TABLE IF EXISTS compra DROP CONSTRAINT IF EXISTS fk_persona;

ALTER TABLE IF EXISTS venta DROP CONSTRAINT IF EXISTS fk_persona;

ALTER TABLE IF EXISTS avion DROP CONSTRAINT IF EXISTS fk_almacen;

ALTER TABLE IF EXISTS pieza DROP CONSTRAINT IF EXISTS fk_almacen;

ALTER TABLE IF EXISTS lote_materia_prima DROP CONSTRAINT IF EXISTS fk_almacen;

ALTER TABLE IF EXISTS pago_compra DROP CONSTRAINT IF EXISTS fk_compra;

ALTER TABLE IF EXISTS pieza DROP CONSTRAINT IF EXISTS fk_avion;

ALTER TABLE IF EXISTS pago_moneda DROP CONSTRAINT IF EXISTS fk_pago_venta;

ALTER TABLE IF EXISTS pago_moneda DROP CONSTRAINT IF EXISTS fk_pago_compra;

ALTER TABLE IF EXISTS pago_moneda DROP CONSTRAINT IF EXISTS fk_moneda;

ALTER TABLE IF EXISTS prueba DROP CONSTRAINT IF EXISTS fk_lote_materia_prima;

ALTER TABLE IF EXISTS prueba DROP CONSTRAINT IF EXISTS fk_pieza;

ALTER TABLE IF EXISTS prueba DROP CONSTRAINT IF EXISTS fk_avion;

ALTER TABLE IF EXISTS empleado_profesion DROP CONSTRAINT IF EXISTS fk_profesion;

ALTER TABLE IF EXISTS pago_venta DROP CONSTRAINT IF EXISTS fk_venta;

ALTER TABLE IF EXISTS empleado_profesion DROP CONSTRAINT IF EXISTS fk_empleado;

ALTER TABLE IF EXISTS ensamblaje_pieza DROP CONSTRAINT IF EXISTS fk_plan_ensamblaje;

ALTER TABLE IF EXISTS ensamblaje_avion DROP CONSTRAINT IF EXISTS fk_plan_ensamblaje;

ALTER TABLE IF EXISTS ensamblaje_pieza DROP CONSTRAINT IF EXISTS fk_configuracion_pieza;

ALTER TABLE IF EXISTS ensamblaje_avion DROP CONSTRAINT IF EXISTS fk_configuracion_avion;

ALTER TABLE IF EXISTS ensamblaje DROP CONSTRAINT IF EXISTS fk_plan_ensamblaje;

ALTER TABLE IF EXISTS ensamblaje DROP CONSTRAINT IF EXISTS fk_pieza;

ALTER TABLE IF EXISTS ensamblaje DROP CONSTRAINT IF EXISTS fk_lote_materia_prima;

ALTER TABLE IF EXISTS lugar DROP CONSTRAINT IF EXISTS tipo_lug_check;

ALTER TABLE IF EXISTS persona DROP CONSTRAINT IF EXISTS tipo_com_check;

ALTER TABLE IF EXISTS persona DROP CONSTRAINT IF EXISTS tipo_comerial_com_check;

ALTER TABLE IF EXISTS persona DROP CONSTRAINT IF EXISTS persona_fk_usuario_key;

ALTER TABLE IF EXISTS persona DROP CONSTRAINT IF EXISTS persona_rif_jur_key;

ALTER TABLE IF EXISTS persona DROP CONSTRAINT IF EXISTS persona_denominacion_persona_jur_key;

ALTER TABLE IF EXISTS persona DROP CONSTRAINT IF EXISTS persona_pagina_web_jur_key;

ALTER TABLE IF EXISTS persona DROP CONSTRAINT IF EXISTS persona_cedula_nat_key;

ALTER TABLE IF EXISTS compra DROP CONSTRAINT IF EXISTS compra_numero_factura_com_key;

ALTER TABLE IF EXISTS correo_electronico DROP CONSTRAINT IF EXISTS correo_electronico_direccion_correo_ce_key;

ALTER TABLE IF EXISTS empleado DROP CONSTRAINT IF EXISTS empleado_fk_usuario_key;

ALTER TABLE IF EXISTS empleado DROP CONSTRAINT IF EXISTS empleado_cedula_per_key;

ALTER TABLE IF EXISTS telefono DROP CONSTRAINT IF EXISTS telefono_numero_telefono_tel_key;





ALTER TABLE IF EXISTS almacen DROP CONSTRAINT IF EXISTS almacen_pk;

ALTER TABLE IF EXISTS asistencia DROP CONSTRAINT IF EXISTS asistencia_pk;

ALTER TABLE IF EXISTS avion DROP CONSTRAINT IF EXISTS avion_pk;

ALTER TABLE IF EXISTS beneficiario DROP CONSTRAINT IF EXISTS beneficiario_pk;

ALTER TABLE IF EXISTS caracteristica DROP CONSTRAINT IF EXISTS caracteristica_pk;

ALTER TABLE IF EXISTS caracteristica_modelo DROP CONSTRAINT IF EXISTS caracteristica_modelo_pk;

ALTER TABLE IF EXISTS caracteristica_pieza DROP CONSTRAINT IF EXISTS caracteristica_pieza_pk;

ALTER TABLE IF EXISTS persona DROP CONSTRAINT IF EXISTS empresa_pk;

ALTER TABLE IF EXISTS compra DROP CONSTRAINT IF EXISTS compra_pk;

ALTER TABLE IF EXISTS configuracion_avion DROP CONSTRAINT IF EXISTS configuracion_avion_pk;

ALTER TABLE IF EXISTS configuracion_pieza DROP CONSTRAINT IF EXISTS configuracion_pieza_pk;

ALTER TABLE IF EXISTS correo_electronico DROP CONSTRAINT IF EXISTS arco_ce;

ALTER TABLE IF EXISTS correo_electronico DROP CONSTRAINT IF EXISTS correo_electronico_pk;

ALTER TABLE IF EXISTS detalle_compra DROP CONSTRAINT IF EXISTS detalle_compra_pk;

ALTER TABLE IF EXISTS detalle_transferencia DROP CONSTRAINT IF EXISTS detalle_transferencia_pk;

ALTER TABLE IF EXISTS detalle_venta DROP CONSTRAINT IF EXISTS detalle_venta_pk;

ALTER TABLE IF EXISTS embalaje DROP CONSTRAINT IF EXISTS arco_emb;

ALTER TABLE IF EXISTS embalaje DROP CONSTRAINT IF EXISTS embalaje_pk;

ALTER TABLE IF EXISTS embalaje_configuracion_avion DROP CONSTRAINT IF EXISTS embalaje_configuracion_avion_pk;

ALTER TABLE IF EXISTS embalaje_configuracion_pieza DROP CONSTRAINT IF EXISTS embalaje_configuracion_pieza_pk;

ALTER TABLE IF EXISTS embalaje_plan DROP CONSTRAINT IF EXISTS embalaje_plan_pk;

ALTER TABLE IF EXISTS empleado_profesion DROP CONSTRAINT IF EXISTS empleado_profesion_pk;

ALTER TABLE IF EXISTS ensamblaje DROP CONSTRAINT IF EXISTS arco_ens;

ALTER TABLE IF EXISTS ensamblaje DROP CONSTRAINT IF EXISTS ensamblaje_pk;

ALTER TABLE IF EXISTS ensamblaje_avion DROP CONSTRAINT IF EXISTS ensamblaje_avion_pk;

ALTER TABLE IF EXISTS ensamblaje_pieza DROP CONSTRAINT IF EXISTS ensamblaje_pieza_pk;

ALTER TABLE IF EXISTS equipo DROP CONSTRAINT IF EXISTS equipo_pk;

ALTER TABLE IF EXISTS equipo_empleado DROP CONSTRAINT IF EXISTS equipo_empleado_pk;

ALTER TABLE IF EXISTS estatus DROP CONSTRAINT IF EXISTS estatus_pk;

ALTER TABLE IF EXISTS estatus_historial_ensamblaje DROP CONSTRAINT IF EXISTS estatus_historial_ensamblaje_pk;

ALTER TABLE IF EXISTS estimacion_profesion_empleado DROP CONSTRAINT IF EXISTS estimacion_profesion_empleado_pk;

ALTER TABLE IF EXISTS historial_estatus_compra DROP CONSTRAINT IF EXISTS historial_estatus_compra_pk;

ALTER TABLE IF EXISTS historial_estatus_embalaje DROP CONSTRAINT IF EXISTS historial_estatus_embalaje_pk;

ALTER TABLE IF EXISTS historial_estatus_prueba DROP CONSTRAINT IF EXISTS historial_estatus_prueba_pk;

ALTER TABLE IF EXISTS historial_estatus_solicitud_transferencia DROP CONSTRAINT IF EXISTS historial_estatus_solicitud_transferencia_pk;

ALTER TABLE IF EXISTS historial_estatus_transporte DROP CONSTRAINT IF EXISTS historial_estatus_transporte_pk;

ALTER TABLE IF EXISTS historial_estatus_venta DROP CONSTRAINT IF EXISTS historial_estatus_venta_pk;

ALTER TABLE IF EXISTS horario DROP CONSTRAINT IF EXISTS horario_pk;

ALTER TABLE IF EXISTS labor DROP CONSTRAINT IF EXISTS labor_pk;

ALTER TABLE IF EXISTS lote_materia_prima DROP CONSTRAINT IF EXISTS lote_materia_prima_pk;

ALTER TABLE IF EXISTS lugar DROP CONSTRAINT IF EXISTS lugar_pk;

ALTER TABLE IF EXISTS modelo_avion DROP CONSTRAINT IF EXISTS modelo_avion_pk;

ALTER TABLE IF EXISTS modo_pago DROP CONSTRAINT IF EXISTS modo_pago_pk;

ALTER TABLE IF EXISTS moneda DROP CONSTRAINT IF EXISTS moneda_pk;

ALTER TABLE IF EXISTS pago_compra DROP CONSTRAINT IF EXISTS pago_compra_pk;

ALTER TABLE IF EXISTS pago_moneda DROP CONSTRAINT IF EXISTS arco_pm;

ALTER TABLE IF EXISTS pago_moneda DROP CONSTRAINT IF EXISTS pago_moneda_pk;

ALTER TABLE IF EXISTS pago_empleado DROP CONSTRAINT IF EXISTS pago_empleado_pk;

ALTER TABLE IF EXISTS pago_venta DROP CONSTRAINT IF EXISTS pago_venta_pk;

ALTER TABLE IF EXISTS empleado DROP CONSTRAINT IF EXISTS empleado_pk;

ALTER TABLE IF EXISTS pieza DROP CONSTRAINT IF EXISTS pieza_pk;

ALTER TABLE IF EXISTS plan_ensamblaje DROP CONSTRAINT IF EXISTS plan_ensamblaje_pk;

ALTER TABLE IF EXISTS plan_transporte DROP CONSTRAINT IF EXISTS plan_transporte_pk;

ALTER TABLE IF EXISTS privilegio DROP CONSTRAINT IF EXISTS privilegio_pk;

ALTER TABLE IF EXISTS profesion DROP CONSTRAINT IF EXISTS profesion_pk;

ALTER TABLE IF EXISTS prueba DROP CONSTRAINT IF EXISTS arco_pru;

ALTER TABLE IF EXISTS prueba DROP CONSTRAINT IF EXISTS prueba_pk;

ALTER TABLE IF EXISTS prueba_configuracion_avion DROP CONSTRAINT IF EXISTS prueba_configuracion_avion_pk;

ALTER TABLE IF EXISTS prueba_configuracion_pieza DROP CONSTRAINT IF EXISTS prueba_configuracion_pieza_pk;

ALTER TABLE IF EXISTS red_social DROP CONSTRAINT IF EXISTS red_social_pk;

ALTER TABLE IF EXISTS rol DROP CONSTRAINT IF EXISTS rol_pk;

ALTER TABLE IF EXISTS sede DROP CONSTRAINT IF EXISTS sede_pk;

ALTER TABLE IF EXISTS solicitud_transferencia DROP CONSTRAINT IF EXISTS solicitud_transferencia_pk;

ALTER TABLE IF EXISTS telefono DROP CONSTRAINT IF EXISTS arco_tel;

ALTER TABLE IF EXISTS telefono DROP CONSTRAINT IF EXISTS telefono_pk;

ALTER TABLE IF EXISTS tipo_materia_prima DROP CONSTRAINT IF EXISTS tipo_materia_prima_pk;

ALTER TABLE IF EXISTS tipo_pieza DROP CONSTRAINT IF EXISTS tipo_pieza_pk;

ALTER TABLE IF EXISTS tipo_prueba DROP CONSTRAINT IF EXISTS tipo_prueba_pk;

ALTER TABLE IF EXISTS transferencia_pieza_material DROP CONSTRAINT IF EXISTS arco_tpm;

ALTER TABLE IF EXISTS transferencia_pieza_material DROP CONSTRAINT IF EXISTS transferencia_pieza_material_pk;

ALTER TABLE IF EXISTS transporte DROP CONSTRAINT IF EXISTS arco_tra;

ALTER TABLE IF EXISTS transporte DROP CONSTRAINT IF EXISTS transporte_pk;

ALTER TABLE IF EXISTS transporte_configuracion_avion DROP CONSTRAINT IF EXISTS transporte_configuracion_avion_pk;

ALTER TABLE IF EXISTS transporte_configuracion_pieza DROP CONSTRAINT IF EXISTS transporte_configuracion_pieza_pk;

ALTER TABLE IF EXISTS turno DROP CONSTRAINT IF EXISTS turno_pk;

ALTER TABLE IF EXISTS sesion DROP CONSTRAINT IF EXISTS usuario_fk;

ALTER TABLE IF EXISTS usuario DROP CONSTRAINT IF EXISTS usuario_pk;

ALTER TABLE IF EXISTS venta DROP CONSTRAINT IF EXISTS venta_pk;

ALTER TABLE IF EXISTS zona DROP CONSTRAINT IF EXISTS zona_pk;



DROP TABLE IF EXISTS almacen;
DROP TABLE IF EXISTS asistencia;
DROP TABLE IF EXISTS avion;
DROP TABLE IF EXISTS beneficiario;
DROP TABLE IF EXISTS caracteristica;
DROP TABLE IF EXISTS caracteristica_modelo;
DROP TABLE IF EXISTS caracteristica_pieza;
DROP TABLE IF EXISTS persona;
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
DROP TABLE IF EXISTS equipo_empleado;
DROP TABLE IF EXISTS estatus;
DROP TABLE IF EXISTS estatus_historial_ensamblaje;
DROP TABLE IF EXISTS estimacion_profesion_empleado;
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
DROP TABLE IF EXISTS pago_empleado;
DROP TABLE IF EXISTS pago_venta;
DROP TABLE IF EXISTS empleado;
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

/*DROP SEQUENCE IF EXISTS lugar_codigo_lug_seq;
DROP SEQUENCE IF EXISTS usuario_codigo_usu_seq;*/
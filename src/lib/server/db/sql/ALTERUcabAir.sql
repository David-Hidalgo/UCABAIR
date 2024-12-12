ALTER TABLE almacen ADD CONSTRAINT almacen_pk PRIMARY KEY ( codigo_alm,
                                                            fk_sede );

ALTER TABLE asistencia ADD CONSTRAINT asistencia_pk PRIMARY KEY ( fk_turno,
                                                                  fk_empleado );

ALTER TABLE avion ADD CONSTRAINT avion_pk PRIMARY KEY ( codigo_avi,
                                                        fk_ensamblaje );

ALTER TABLE beneficiario ADD CONSTRAINT beneficiario_pk PRIMARY KEY ( codigo_ben );

ALTER TABLE caracteristica ADD CONSTRAINT caracteristica_pk PRIMARY KEY ( codigo_car );

ALTER TABLE caracteristica_modelo ADD CONSTRAINT caracteristica_modelo_pk PRIMARY KEY ( fk_caracteristica,
                                                                                        fk_modelo_avion );

ALTER TABLE caracteristica_pieza ADD CONSTRAINT caracteristica_pieza_pk PRIMARY KEY ( fk_tipo_pieza,
                                                                                      fk_caracteristica );

ALTER TABLE persona ADD CONSTRAINT empresa_pk PRIMARY KEY ( codigo_com );

ALTER TABLE compra ADD CONSTRAINT compra_pk PRIMARY KEY ( codigo_compra_com );

ALTER TABLE configuracion_avion ADD CONSTRAINT configuracion_avion_pk PRIMARY KEY ( fk_tipo_pieza,
                                                                                    fk_modelo_avion );

ALTER TABLE configuracion_pieza ADD CONSTRAINT configuracion_pieza_pk PRIMARY KEY ( fk_tipo_materia_prima,
                                                                                    fk_tipo_pieza );

ALTER TABLE correo_electronico
    ADD CONSTRAINT arco_ce CHECK ( ( ( fk_persona IS NOT NULL )
                                   AND ( fk_empleado IS NULL ) )
                                 OR ( ( fk_empleado IS NOT NULL )
                                      AND ( fk_persona IS NULL ) ));

ALTER TABLE correo_electronico ADD CONSTRAINT correo_electronico_pk PRIMARY KEY ( codigo_ce );

ALTER TABLE detalle_compra ADD CONSTRAINT detalle_compra_pk PRIMARY KEY ( fk_compra,codigo_dc );

ALTER TABLE detalle_transferencia ADD CONSTRAINT detalle_transferencia_pk PRIMARY KEY ( fk_solicitud_transferencia, codigo_dt );

ALTER TABLE detalle_venta ADD CONSTRAINT detalle_venta_pk PRIMARY KEY ( fk_venta,codigo_dv );

ALTER TABLE embalaje
    ADD CONSTRAINT arco_emb CHECK ( ( ( fk_lote_materia_prima IS NOT NULL )
                                   AND ( fk_pieza IS NULL )
                                   AND ( fk_pieza2 IS NULL ) )
                                 OR ( ( fk_pieza IS NOT NULL )
                                      AND ( fk_pieza2 IS NOT NULL )
                                      AND ( fk_lote_materia_prima IS NULL ) ));

ALTER TABLE embalaje ADD CONSTRAINT embalaje_pk PRIMARY KEY ( codigo_emb );

ALTER TABLE embalaje_configuracion_avion
    ADD CONSTRAINT embalaje_configuracion_avion_pk PRIMARY KEY ( fk_embalaje_plan,
                                                                 fk_configuracion_avion,
                                                                 fk_configuracion_avion2 );

ALTER TABLE embalaje_configuracion_pieza
    ADD CONSTRAINT embalaje_configuracion_pieza_pk PRIMARY KEY ( fk_embalaje_plan,
                                                                 fk_configuracion_pieza,
                                                                 fk_configuracion_pieza2 );

ALTER TABLE embalaje_plan ADD CONSTRAINT embalaje_plan_pk PRIMARY KEY ( codigo_ep );

ALTER TABLE empleado_profesion ADD CONSTRAINT empleado_profesion_pk PRIMARY KEY ( fk_profesion,
                                                                                  fk_empleado );
ALTER TABLE ensamblaje
    ADD CONSTRAINT arco_ens CHECK ( ( ( fk_lote_materia_prima IS NOT NULL )
                                   AND ( fk_pieza IS NULL )
                                   AND ( fk_pieza2 IS NULL ) )
                                 OR ( ( fk_pieza IS NOT NULL )
                                      AND ( fk_pieza2 IS NOT NULL )
                                      AND ( fk_lote_materia_prima IS NULL ) ) );

ALTER TABLE ensamblaje ADD CONSTRAINT ensamblaje_pk PRIMARY KEY ( codigo_ens );

ALTER TABLE ensamblaje_avion
    ADD CONSTRAINT ensamblaje_avion_pk PRIMARY KEY ( fk_plan_ensamblaje,
                                                     fk_configuracion_avion,
                                                     fk_configuracion_avion2 );
ALTER TABLE ensamblaje_pieza
    ADD CONSTRAINT ensamblaje_pieza_pk PRIMARY KEY ( fk_plan_ensamblaje,
                                                     fk_configuracion_pieza,
                                                     fk_configuracion_pieza2 );

ALTER TABLE equipo ADD CONSTRAINT equipo_pk PRIMARY KEY ( codigo_equ );

ALTER TABLE equipo_empleado ADD CONSTRAINT equipo_empleado_pk PRIMARY KEY ( fk_equipo,
                                                                            fk_empleado );

ALTER TABLE estatus ADD CONSTRAINT estatus_pk PRIMARY KEY ( codigo_est );


ALTER TABLE estatus_historial_ensamblaje
    ADD CONSTRAINT estatus_historial_ensamblaje_pk PRIMARY KEY ( fecha_ehe,
                                                                 fk_estatus,
                                                                 fk_ensamblaje );


ALTER TABLE estimacion_profesion_empleado ADD CONSTRAINT estimacion_profesion_empleado_pk PRIMARY KEY ( codigo_epp );

ALTER TABLE historial_estatus_compra
    ADD CONSTRAINT historial_estatus_compra_pk PRIMARY KEY ( fecha_hec,
                                                             fk_estatus,
                                                             fk_compra );

ALTER TABLE historial_estatus_embalaje
    ADD CONSTRAINT historial_estatus_embalaje_pk PRIMARY KEY ( fecha_hee,
                                                               fk_estatus,
                                                               fk_embalaje );

ALTER TABLE historial_estatus_prueba
    ADD CONSTRAINT historial_estatus_prueba_pk PRIMARY KEY ( fk_estatus,
                                                             fk_prueba,
                                                             fecha_hep );

ALTER TABLE historial_estatus_solicitud_transferencia
    ADD CONSTRAINT historial_estatus_solicitud_transferencia_pk PRIMARY KEY ( fecha_hest,
                                                                              fk_solicitud_transferencia,
                                                                              fk_estatus );

ALTER TABLE historial_estatus_transporte
    ADD CONSTRAINT historial_estatus_transporte_pk PRIMARY KEY ( fecha_het,
                                                                 fk_estatus,
                                                                 fk_transporte );

ALTER TABLE historial_estatus_venta
    ADD CONSTRAINT historial_estatus_venta_pk PRIMARY KEY ( fecha_hev,
                                                            fk_venta,
                                                            fk_estatus );

ALTER TABLE horario ADD CONSTRAINT horario_pk PRIMARY KEY ( fk_turno,
                                                            fk_empleado );

ALTER TABLE labor ADD CONSTRAINT labor_pk PRIMARY KEY ( codigo_lab );

ALTER TABLE lote_materia_prima ADD CONSTRAINT lote_materia_prima_pk PRIMARY KEY ( codigo_lmp );

ALTER TABLE lugar ADD CONSTRAINT lugar_pk PRIMARY KEY ( codigo_lug );

ALTER TABLE modelo_avion ADD CONSTRAINT modelo_avion_pk PRIMARY KEY ( codigo_ma );

ALTER TABLE modo_pago ADD CONSTRAINT modo_pago_pk PRIMARY KEY ( codigo_mp );

ALTER TABLE moneda ADD CONSTRAINT moneda_pk PRIMARY KEY ( codigo_mon );

ALTER TABLE pago_compra
    ADD CONSTRAINT pago_compra_pk PRIMARY KEY ( codigo_pago_pc);

ALTER TABLE pago_moneda
    ADD CONSTRAINT arco_pm CHECK ( ( ( fk_pago_venta IS NOT NULL )
                                   AND ( fk_moneda IS NOT NULL )
                                   AND ( fk_pago_compra IS NULL )
                                  
                                 OR ( ( fk_pago_compra IS NOT NULL )
                                      AND ( fk_moneda IS NOT NULL )
                                      AND ( fk_pago_venta IS NULL ) )));

ALTER TABLE pago_moneda ADD CONSTRAINT pago_moneda_pk PRIMARY KEY ( fk_moneda );

ALTER TABLE pago_empleado ADD CONSTRAINT pago_empleado_pk PRIMARY KEY ( codigo_pp );

ALTER TABLE pago_venta
    ADD CONSTRAINT pago_venta_pk PRIMARY KEY ( codigo_pago_pv );

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( codigo_empleado_per );

ALTER TABLE pieza ADD CONSTRAINT pieza_pk PRIMARY KEY ( codigo_pie,
                                                        fk_ensamblaje );

ALTER TABLE plan_ensamblaje ADD CONSTRAINT plan_ensamblaje_pk PRIMARY KEY ( codigo_pe );

ALTER TABLE plan_transporte ADD CONSTRAINT plan_transporte_pk PRIMARY KEY ( codigo_pt );

ALTER TABLE privilegio ADD CONSTRAINT privilegio_pk PRIMARY KEY ( codigo_pri );

ALTER TABLE profesion ADD CONSTRAINT profesion_pk PRIMARY KEY ( codigo_pro );

ALTER TABLE prueba
    ADD CONSTRAINT arco_pru CHECK ( ( ( fk_avion IS NOT NULL )
                                   
                                   AND ( fk_pieza IS NULL )
                                   AND ( fk_pieza2 IS NULL )
                                   AND ( fk_lote_materia_prima IS NULL ) )
                                 OR ( ( fk_pieza IS NOT NULL )
                                      AND ( fk_pieza2 IS NOT NULL )
                                      AND ( fk_avion IS NULL )
                                      
                                      AND ( fk_lote_materia_prima IS NULL ) )
                                 OR ( ( fk_lote_materia_prima IS NOT NULL )
                                      AND ( fk_avion IS NULL )
                                     
                                      AND ( fk_pieza IS NULL )
                                      AND ( fk_pieza2 IS NULL ) ) );

ALTER TABLE prueba ADD CONSTRAINT prueba_pk PRIMARY KEY ( codigo_pru );

ALTER TABLE prueba_configuracion_avion
    ADD CONSTRAINT prueba_configuracion_avion_pk PRIMARY KEY ( fk_tipo_prueba,
                                                               fk_configuracion_avion,
                                                               fk_configuracion_avion2 );

ALTER TABLE prueba_configuracion_pieza
    ADD CONSTRAINT prueba_configuracion_pieza_pk PRIMARY KEY ( fk_tipo_prueba,
                                                               fk_configuracion_pieza,
                                                               fk_configuracion_pieza2 );

ALTER TABLE red_social ADD CONSTRAINT red_social_pk PRIMARY KEY ( codigo_rs );

ALTER TABLE rol ADD CONSTRAINT rol_pk PRIMARY KEY ( codigo_rol );

ALTER TABLE sede ADD CONSTRAINT sede_pk PRIMARY KEY ( codigo_sed );

ALTER TABLE solicitud_transferencia ADD CONSTRAINT solicitud_transferencia_pk PRIMARY KEY ( codigo_st );

ALTER TABLE telefono
    ADD CONSTRAINT arco_tel CHECK ( ( ( fk_persona IS NOT NULL )
                                   AND ( fk_empleado IS NULL ) )
                                 OR ( ( fk_empleado IS NOT NULL )
                                      AND ( fk_persona IS NULL ) ) );

ALTER TABLE telefono ADD CONSTRAINT telefono_pk PRIMARY KEY ( codigo_tel );

ALTER TABLE tipo_materia_prima ADD CONSTRAINT tipo_materia_prima_pk PRIMARY KEY ( codigo_tmp );

ALTER TABLE tipo_pieza ADD CONSTRAINT tipo_pieza_pk PRIMARY KEY ( codigo_tp );

ALTER TABLE tipo_prueba ADD CONSTRAINT tipo_prueba_pk PRIMARY KEY ( codigo_tp );

ALTER TABLE transferencia_pieza_material
    ADD CONSTRAINT arco_tpm CHECK ( ( ( fk_pieza IS NOT NULL )
                                   AND ( fk_pieza2 IS NOT NULL )
                                   AND ( fk_lote_materia_prima IS NULL ) )
                                 OR ( ( fk_lote_materia_prima IS NOT NULL )
                                      AND ( fk_pieza IS NULL )
                                      AND ( fk_pieza2 IS NULL ) ) );

ALTER TABLE transferencia_pieza_material ADD CONSTRAINT transferencia_pieza_material_pk PRIMARY KEY ( codigo_tpm );

ALTER TABLE transporte
    ADD CONSTRAINT arco_tra CHECK ( ( ( fk_detalle_compra IS NOT NULL )
				   AND ( fk_detalle_compra2 IS NOT NULL )
				   AND ( fk_detalle_transferencia IS NULL )
                                   AND ( fk_detalle_transferencia2 IS NULL ) )
                                 OR ( ( fk_detalle_transferencia IS NOT NULL )
				      AND (fk_detalle_transferencia2 IS NOT NULL )
				      AND ( fk_detalle_compra IS NULL )
                                      AND ( fk_detalle_compra2 IS NULL ) ) );

ALTER TABLE transporte ADD CONSTRAINT transporte_pk PRIMARY KEY ( codigo_tra );

ALTER TABLE transporte_configuracion_avion
    ADD CONSTRAINT transporte_configuracion_avion_pk PRIMARY KEY ( fk_plan_transporte,
                                                                   fk_configuracion_avion,
                                                                   fk_configuracion_avion2 );

ALTER TABLE transporte_configuracion_pieza
    ADD CONSTRAINT transporte_configuracion_pieza_pk PRIMARY KEY ( fk_plan_transporte,
                                                                   fk_configuracion_pieza,
                                                                   fk_configuracion_pieza2 );

ALTER TABLE turno ADD CONSTRAINT turno_pk PRIMARY KEY ( codigo_tur );

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( codigo_usu );

ALTER TABLE venta ADD CONSTRAINT venta_pk PRIMARY KEY ( codigo_venta_ven );

ALTER TABLE zona ADD CONSTRAINT zona_pk PRIMARY KEY ( codigo_zon,
                                                      fk_sede );




ALTER TABLE sede
    ADD CONSTRAINT fk_lugar FOREIGN KEY ( fk_lugar )
        REFERENCES lugar ( codigo_lug );

ALTER TABLE almacen
    ADD CONSTRAINT fk_sede FOREIGN KEY ( fk_sede )
        REFERENCES sede ( codigo_sed );

ALTER TABLE lugar
    ADD CONSTRAINT fk_lugar FOREIGN KEY ( fk_lugar )
        REFERENCES lugar ( codigo_lug );

ALTER TABLE avion
    ADD CONSTRAINT fk_ensamblaje FOREIGN KEY ( fk_ensamblaje )
        REFERENCES ensamblaje ( codigo_ens );

ALTER TABLE pieza
    ADD CONSTRAINT fk_ensamblaje FOREIGN KEY ( fk_ensamblaje )
        REFERENCES ensamblaje ( codigo_ens );

ALTER TABLE embalaje
    ADD CONSTRAINT fk_embalaje_plan FOREIGN KEY ( fk_embalaje_plan )
        REFERENCES embalaje_plan ( codigo_ep );

ALTER TABLE transporte
    ADD CONSTRAINT fk_plan_transporte FOREIGN KEY ( fk_plan_transporte )
        REFERENCES plan_transporte ( codigo_pt );

ALTER TABLE equipo
    ADD CONSTRAINT fk_zona FOREIGN KEY ( fk_zona, 
                                              fk_zona2 )
        REFERENCES zona ( codigo_zon,
                          fk_sede );

ALTER TABLE transporte
    ADD CONSTRAINT fk_detalle_tranferencia FOREIGN KEY ( fk_detalle_transferencia, fk_detalle_transferencia2 )
        REFERENCES detalle_transferencia ( fk_solicitud_transferencia, codigo_dt );

ALTER TABLE transporte
    ADD CONSTRAINT fk_detalle_compra FOREIGN KEY ( fk_detalle_compra, fk_detalle_compra2 )
        REFERENCES detalle_compra ( fk_compra, codigo_dc );

ALTER TABLE pago_venta
    ADD CONSTRAINT fk_modo_pago FOREIGN KEY ( fk_modo_pago )
        REFERENCES modo_pago ( codigo_mp );

ALTER TABLE transporte_configuracion_pieza
    ADD CONSTRAINT fk_plan_transporte FOREIGN KEY ( fk_plan_transporte )
        REFERENCES plan_transporte ( codigo_pt );

ALTER TABLE transporte_configuracion_pieza
    ADD CONSTRAINT fk_configuracion_pieza FOREIGN KEY ( fk_configuracion_pieza,
                                              fk_configuracion_pieza2 )
        REFERENCES configuracion_pieza ( fk_tipo_materia_prima,
                                         fk_tipo_pieza );

ALTER TABLE transporte_configuracion_avion
    ADD CONSTRAINT fk_plan_transporte FOREIGN KEY ( fk_plan_transporte )
        REFERENCES plan_transporte ( codigo_pt );

ALTER TABLE transporte_configuracion_avion
    ADD CONSTRAINT fk_configuracion_avion FOREIGN KEY ( fk_configuracion_avion,
                                              fk_configuracion_avion2 )
        REFERENCES configuracion_avion ( fk_tipo_pieza,
                                         fk_modelo_avion );

ALTER TABLE embalaje
    ADD CONSTRAINT fk_pieza FOREIGN KEY ( fk_pieza,
                                              fk_pieza2 )
        REFERENCES pieza ( codigo_pie,
                           fk_ensamblaje );

ALTER TABLE embalaje
    ADD CONSTRAINT fk_equipo_empleado FOREIGN KEY ( fk_equipo_empleado,
                                              fk_equipo_empleado2 )
        REFERENCES equipo_empleado ( fk_equipo,
                                     fk_empleado );

ALTER TABLE transporte
    ADD CONSTRAINT fk_equipo_empleado FOREIGN KEY ( fk_equipo_empleado,
                                              fk_equipo_empleado2 )
        REFERENCES equipo_empleado ( fk_equipo,
                                     fk_empleado );

ALTER TABLE ensamblaje
    ADD CONSTRAINT fk_equipo_empleado FOREIGN KEY ( fk_equipo_empleado,
                                              fk_equipo_empleado2 )
        REFERENCES equipo_empleado ( fk_equipo,
                                     fk_empleado );

ALTER TABLE persona
    ADD CONSTRAINT fk_lugar FOREIGN KEY ( fk_lugar )
        REFERENCES lugar ( codigo_lug );

ALTER TABLE embalaje
    ADD CONSTRAINT fk_lote_materia_prima FOREIGN KEY ( fk_lote_materia_prima )
        REFERENCES lote_materia_prima ( codigo_lmp );

ALTER TABLE embalaje_configuracion_avion
    ADD CONSTRAINT fk_embalaje_plan FOREIGN KEY ( fk_embalaje_plan )
        REFERENCES embalaje_plan ( codigo_ep );

ALTER TABLE embalaje_configuracion_pieza
    ADD CONSTRAINT fk_embalaje_plan FOREIGN KEY ( fk_embalaje_plan )
        REFERENCES embalaje_plan ( codigo_ep );

ALTER TABLE embalaje_configuracion_avion
    ADD CONSTRAINT fk_configuracion_avion FOREIGN KEY ( fk_configuracion_avion,
                                              fk_configuracion_avion2 )
        REFERENCES configuracion_avion ( fk_tipo_pieza,
                                         fk_modelo_avion );

ALTER TABLE embalaje_configuracion_pieza
    ADD CONSTRAINT fk_configuracion_pieza FOREIGN KEY ( fk_configuracion_pieza,
                                              fk_configuracion_pieza2 )
        REFERENCES configuracion_pieza ( fk_tipo_materia_prima,
                                         fk_tipo_pieza );

ALTER TABLE usuario
    ADD CONSTRAINT fk_rol FOREIGN KEY ( fk_rol )
        REFERENCES rol ( codigo_rol );

ALTER TABLE privilegio
    ADD CONSTRAINT fk_rol FOREIGN KEY ( fk_rol )
        REFERENCES rol ( codigo_rol );

ALTER TABLE prueba_configuracion_avion
    ADD CONSTRAINT fk_configuracion_avion FOREIGN KEY ( fk_configuracion_avion,
                                              fk_configuracion_avion2 )
        REFERENCES configuracion_avion ( fk_tipo_pieza,
                                         fk_modelo_avion );

ALTER TABLE prueba_configuracion_avion
    ADD CONSTRAINT fk_tipo_prueba FOREIGN KEY ( fk_tipo_prueba )
        REFERENCES tipo_prueba ( codigo_tp );

ALTER TABLE prueba_configuracion_pieza
    ADD CONSTRAINT fk_configuracion_pieza FOREIGN KEY ( fk_configuracion_pieza,
                                              fk_configuracion_pieza2 )
        REFERENCES configuracion_pieza ( fk_tipo_materia_prima,
                                         fk_tipo_pieza );

ALTER TABLE empleado
    ADD CONSTRAINT fk_lugar FOREIGN KEY ( fk_lugar )
        REFERENCES lugar ( codigo_lug );

ALTER TABLE prueba_configuracion_pieza
    ADD CONSTRAINT fk_tipo_prueba FOREIGN KEY ( fk_tipo_prueba )
        REFERENCES tipo_prueba ( codigo_tp );

ALTER TABLE estimacion_profesion_empleado
    ADD CONSTRAINT fk_tipo_prueba FOREIGN KEY ( fk_tipo_prueba )
        REFERENCES tipo_prueba ( codigo_tp );

ALTER TABLE estimacion_profesion_empleado
    ADD CONSTRAINT fk_embalaje_plan FOREIGN KEY ( fk_embalaje_plan )
        REFERENCES embalaje_plan ( codigo_ep );

ALTER TABLE estimacion_profesion_empleado
    ADD CONSTRAINT fk_plan_transporte FOREIGN KEY ( fk_plan_transporte )
        REFERENCES plan_transporte ( codigo_pt );

ALTER TABLE estimacion_profesion_empleado
    ADD CONSTRAINT fk_plan_ensamblaje FOREIGN KEY ( fk_plan_ensamblaje )
        REFERENCES plan_ensamblaje ( codigo_pe );

ALTER TABLE estimacion_profesion_empleado
    ADD CONSTRAINT fk_profesion FOREIGN KEY ( fk_profesion )
        REFERENCES profesion ( codigo_pro );

ALTER TABLE persona
    ADD CONSTRAINT fk_usuario FOREIGN KEY ( fk_usuario )
        REFERENCES usuario ( codigo_usu );

ALTER TABLE empleado
    ADD CONSTRAINT fk_usuario FOREIGN KEY ( fk_usuario )
        REFERENCES usuario ( codigo_usu );

ALTER TABLE pago_empleado
    ADD CONSTRAINT fk_modo_pago FOREIGN KEY ( fk_modo_pago )
        REFERENCES modo_pago ( codigo_mp );

ALTER TABLE horario
    ADD CONSTRAINT fk_turno FOREIGN KEY ( fk_turno )
        REFERENCES turno ( codigo_tur );

ALTER TABLE horario
    ADD CONSTRAINT fk_empleado FOREIGN KEY ( fk_empleado )
        REFERENCES empleado ( codigo_empleado_per );

ALTER TABLE zona
    ADD CONSTRAINT fk_sede FOREIGN KEY ( fk_sede )
        REFERENCES sede ( codigo_sed );

ALTER TABLE historial_estatus_compra
    ADD CONSTRAINT fk_estatus FOREIGN KEY ( fk_estatus )
        REFERENCES estatus ( codigo_est );

ALTER TABLE historial_estatus_venta
    ADD CONSTRAINT fk_venta FOREIGN KEY ( fk_venta )
        REFERENCES venta ( codigo_venta_ven );

ALTER TABLE historial_estatus_venta
    ADD CONSTRAINT fk_estatus FOREIGN KEY ( fk_estatus )
        REFERENCES estatus ( codigo_est );

ALTER TABLE historial_estatus_transporte
    ADD CONSTRAINT fk_estatus FOREIGN KEY ( fk_estatus )
        REFERENCES estatus ( codigo_est );

ALTER TABLE historial_estatus_transporte
    ADD CONSTRAINT fk_transporte FOREIGN KEY ( fk_transporte )
        REFERENCES transporte ( codigo_tra );

ALTER TABLE historial_estatus_embalaje
    ADD CONSTRAINT fk_estatus FOREIGN KEY ( fk_estatus )
        REFERENCES estatus ( codigo_est );

ALTER TABLE historial_estatus_embalaje
    ADD CONSTRAINT fk_embalaje FOREIGN KEY ( fk_embalaje )
        REFERENCES embalaje ( codigo_emb );

ALTER TABLE solicitud_transferencia
    ADD CONSTRAINT fk_sede2 FOREIGN KEY ( fk_sede )
        REFERENCES sede ( codigo_sed );

ALTER TABLE historial_estatus_solicitud_transferencia
    ADD CONSTRAINT fk_solicitud_transferencia FOREIGN KEY ( fk_solicitud_transferencia )
        REFERENCES solicitud_transferencia ( codigo_st );

ALTER TABLE historial_estatus_solicitud_transferencia
    ADD CONSTRAINT fk_estatus FOREIGN KEY ( fk_estatus )
        REFERENCES estatus ( codigo_est );

ALTER TABLE historial_estatus_prueba
    ADD CONSTRAINT fk_estatus FOREIGN KEY ( fk_estatus )
        REFERENCES estatus ( codigo_est );

ALTER TABLE historial_estatus_prueba
    ADD CONSTRAINT fk_prueba FOREIGN KEY ( fk_prueba )
        REFERENCES prueba ( codigo_pru );

ALTER TABLE estatus_historial_ensamblaje
    ADD CONSTRAINT fk_estatus FOREIGN KEY ( fk_estatus )
        REFERENCES estatus ( codigo_est );

ALTER TABLE estatus_historial_ensamblaje
    ADD CONSTRAINT fk_ensamblaje FOREIGN KEY ( fk_ensamblaje )
        REFERENCES ensamblaje ( codigo_ens );

ALTER TABLE solicitud_transferencia
    ADD CONSTRAINT fk_sede FOREIGN KEY ( fk_sede )
        REFERENCES sede ( codigo_sed );

ALTER TABLE transferencia_pieza_material
    ADD CONSTRAINT fk_solicitud_transferencia FOREIGN KEY ( fk_solicitud_transferencia )
        REFERENCES solicitud_transferencia ( codigo_st );

ALTER TABLE detalle_transferencia
    ADD CONSTRAINT fk_solicitud_transferencia FOREIGN KEY ( fk_solicitud_transferencia )
        REFERENCES solicitud_transferencia ( codigo_st );

ALTER TABLE correo_electronico
    ADD CONSTRAINT fk_persona FOREIGN KEY ( fk_persona )
        REFERENCES persona ( codigo_com );

ALTER TABLE correo_electronico
    ADD CONSTRAINT fk_empleado FOREIGN KEY ( fk_empleado )
        REFERENCES empleado ( codigo_empleado_per );

ALTER TABLE telefono
    ADD CONSTRAINT fk_persona FOREIGN KEY ( fk_persona )
        REFERENCES persona ( codigo_com );

ALTER TABLE telefono
    ADD CONSTRAINT fk_empleado FOREIGN KEY ( fk_empleado )
        REFERENCES empleado ( codigo_empleado_per );

ALTER TABLE red_social
    ADD CONSTRAINT fk_empleado FOREIGN KEY ( fk_empleado )
        REFERENCES empleado ( codigo_empleado_per );

ALTER TABLE pago_empleado
    ADD CONSTRAINT fk_empleado FOREIGN KEY ( fk_empleado )
        REFERENCES empleado ( codigo_empleado_per );

ALTER TABLE beneficiario
    ADD CONSTRAINT fk_empleado FOREIGN KEY ( fk_empleado )
        REFERENCES empleado ( codigo_empleado_per );

ALTER TABLE asistencia
    ADD CONSTRAINT fk_empleado FOREIGN KEY ( fk_empleado )
        REFERENCES empleado ( codigo_empleado_per );

ALTER TABLE asistencia
    ADD CONSTRAINT fk_turno FOREIGN KEY ( fk_turno )
        REFERENCES turno ( codigo_tur );

ALTER TABLE equipo
    ADD CONSTRAINT fk_labor FOREIGN KEY ( fk_labor )
        REFERENCES labor ( codigo_lab );

ALTER TABLE equipo_empleado
    ADD CONSTRAINT fk_equipo FOREIGN KEY ( fk_equipo )
        REFERENCES equipo ( codigo_equ );

ALTER TABLE equipo_empleado
    ADD CONSTRAINT fk_empleado FOREIGN KEY ( fk_empleado )
        REFERENCES empleado ( codigo_empleado_per );

ALTER TABLE caracteristica_pieza
    ADD CONSTRAINT fk_tipo_pieza FOREIGN KEY ( fk_tipo_pieza )
        REFERENCES tipo_pieza ( codigo_tp );

ALTER TABLE caracteristica_pieza
    ADD CONSTRAINT fk_caracteristica FOREIGN KEY ( fk_caracteristica )
        REFERENCES caracteristica ( codigo_car );

ALTER TABLE caracteristica_modelo
    ADD CONSTRAINT fk_caracteristica FOREIGN KEY ( fk_caracteristica )
        REFERENCES caracteristica ( codigo_car );

ALTER TABLE caracteristica_modelo
    ADD CONSTRAINT fk_modelo_avion FOREIGN KEY ( fk_modelo_avion )
        REFERENCES modelo_avion ( codigo_ma );

ALTER TABLE tipo_pieza
    ADD CONSTRAINT fk_tipo_pieza FOREIGN KEY ( fk_tipo_pieza )
        REFERENCES tipo_pieza ( codigo_tp );

ALTER TABLE pieza
    ADD CONSTRAINT fk_pieza FOREIGN KEY ( fk_pieza,fk_pieza2 )
        REFERENCES pieza ( codigo_pie, fk_ensamblaje );

ALTER TABLE modelo_avion
    ADD CONSTRAINT fk_modelo_avion FOREIGN KEY ( fk_modelo_avion )
        REFERENCES modelo_avion ( codigo_ma );

ALTER TABLE configuracion_pieza
    ADD CONSTRAINT fk_tipo_materia_prima FOREIGN KEY ( fk_tipo_materia_prima )
        REFERENCES tipo_materia_prima ( codigo_tmp );

ALTER TABLE configuracion_pieza
    ADD CONSTRAINT fk_tipo_pieza FOREIGN KEY ( fk_tipo_pieza )
        REFERENCES tipo_pieza ( codigo_tp );

ALTER TABLE lote_materia_prima
    ADD CONSTRAINT fk_configuracion_pieza FOREIGN KEY ( fk_configuracion_pieza,
                                             fk_configuracion_pieza2 )
        REFERENCES configuracion_pieza ( fk_tipo_materia_prima,
                                         fk_tipo_pieza );

ALTER TABLE configuracion_avion
    ADD CONSTRAINT fk_tipo_pieza FOREIGN KEY ( fk_tipo_pieza )
        REFERENCES tipo_pieza ( codigo_tp );

ALTER TABLE configuracion_avion
    ADD CONSTRAINT fk_modelo_avion FOREIGN KEY ( fk_modelo_avion )
        REFERENCES modelo_avion ( codigo_ma );

ALTER TABLE pieza
    ADD CONSTRAINT fk_configuracion_avion FOREIGN KEY ( fk_configuracion_avion,
                                             fk_configuracion_avion2 )
        REFERENCES configuracion_avion ( fk_tipo_pieza,
                                         fk_modelo_avion );

ALTER TABLE avion
    ADD CONSTRAINT fk_modelo_avion FOREIGN KEY ( fk_modelo_avion )
        REFERENCES modelo_avion ( codigo_ma );

ALTER TABLE detalle_compra
    ADD CONSTRAINT fk_compra FOREIGN KEY ( fk_compra )
        REFERENCES compra ( codigo_compra_com );

ALTER TABLE prueba
    ADD CONSTRAINT fk_tipo_prueba FOREIGN KEY ( fk_tipo_prueba )
        REFERENCES tipo_prueba ( codigo_tp );

ALTER TABLE prueba
    ADD CONSTRAINT fk_equipo_empleado FOREIGN KEY ( fk_equipo_empleado,
                                             fk_equipo_empleado2 )
        REFERENCES equipo_empleado ( fk_equipo,
                                     fk_empleado );

ALTER TABLE prueba
    ADD CONSTRAINT fk_zona FOREIGN KEY ( fk_zona, 
                                             fk_zona2 )
        REFERENCES zona ( codigo_zon,
                          fk_sede );

ALTER TABLE detalle_venta
    ADD CONSTRAINT fk_venta FOREIGN KEY ( fk_venta )
        REFERENCES venta ( codigo_venta_ven );

ALTER TABLE historial_estatus_compra
    ADD CONSTRAINT fk_compra FOREIGN KEY ( fk_estatus )
        REFERENCES compra ( codigo_compra_com );

ALTER TABLE transferencia_pieza_material
    ADD CONSTRAINT fk_lote_materia_prima FOREIGN KEY ( fk_lote_materia_prima )
        REFERENCES lote_materia_prima ( codigo_lmp );

ALTER TABLE transferencia_pieza_material
    ADD CONSTRAINT fk_pieza FOREIGN KEY ( fk_pieza,
                                             fk_pieza2 )
        REFERENCES pieza ( codigo_pie,
                           fk_ensamblaje );

ALTER TABLE pago_compra
    ADD CONSTRAINT fk_modo_pago FOREIGN KEY ( fk_modo_pago )
        REFERENCES modo_pago ( codigo_mp );

ALTER TABLE configuracion_avion
    ADD CONSTRAINT fk_sede FOREIGN KEY ( fk_sede )
        REFERENCES sede ( codigo_sed );

ALTER TABLE configuracion_pieza
    ADD CONSTRAINT fk_sede FOREIGN KEY ( fk_sede )
        REFERENCES sede ( codigo_sed );

ALTER TABLE avion
    ADD CONSTRAINT fk_venta FOREIGN KEY ( fk_venta )
        REFERENCES venta ( codigo_venta_ven );

ALTER TABLE lote_materia_prima
    ADD CONSTRAINT fk_compra FOREIGN KEY ( fk_compra )
        REFERENCES compra ( codigo_compra_com );

ALTER TABLE compra
    ADD CONSTRAINT fk_persona FOREIGN KEY ( fk_persona )
        REFERENCES persona ( codigo_com );

ALTER TABLE venta
    ADD CONSTRAINT fk_persona FOREIGN KEY ( fk_persona )
        REFERENCES persona ( codigo_com );

ALTER TABLE avion
    ADD CONSTRAINT fk_almacen FOREIGN KEY ( fk_almacen,
                                             fk_almacen2 )
        REFERENCES almacen ( codigo_alm,
                             fk_sede );

ALTER TABLE pieza
    ADD CONSTRAINT fk_almacen FOREIGN KEY ( fk_almacen,
                                             fk_almacen2 )
        REFERENCES almacen ( codigo_alm,
                             fk_sede );

ALTER TABLE lote_materia_prima
    ADD CONSTRAINT fk_almacen FOREIGN KEY ( fk_almacen,
                                             fk_almacen2 )
        REFERENCES almacen ( codigo_alm,
                             fk_sede );

ALTER TABLE pago_compra
    ADD CONSTRAINT fk_compra FOREIGN KEY ( fk_compra )
        REFERENCES compra ( codigo_compra_com );

ALTER TABLE pieza
    ADD CONSTRAINT fk_avion FOREIGN KEY ( fk_avion,
                                             fk_avion2 )
        REFERENCES avion ( codigo_avi,
                           fk_ensamblaje );

ALTER TABLE pago_moneda
    ADD CONSTRAINT fk_pago_venta FOREIGN KEY ( fk_pago_venta )
        REFERENCES pago_venta ( codigo_pago_pv);

ALTER TABLE pago_moneda
    ADD CONSTRAINT fk_pago_compra FOREIGN KEY ( fk_pago_compra )
        REFERENCES pago_compra ( codigo_pago_pc );

ALTER TABLE pago_moneda
    ADD CONSTRAINT fk_moneda FOREIGN KEY ( fk_moneda )
        REFERENCES moneda ( codigo_mon );

ALTER TABLE prueba
    ADD CONSTRAINT fk_lote_materia_prima FOREIGN KEY ( fk_lote_materia_prima )
        REFERENCES lote_materia_prima ( codigo_lmp );

ALTER TABLE prueba
    ADD CONSTRAINT fk_pieza FOREIGN KEY ( fk_pieza,
                                             fk_pieza2 )
        REFERENCES pieza ( codigo_pie,
                           fk_ensamblaje );

ALTER TABLE prueba
    ADD CONSTRAINT fk_avion FOREIGN KEY ( fk_avion,
                                             fk_avion2 )
        REFERENCES avion ( codigo_avi,
                           fk_ensamblaje );

ALTER TABLE empleado_profesion
    ADD CONSTRAINT fk_profesion FOREIGN KEY ( fk_profesion )
        REFERENCES profesion ( codigo_pro );

ALTER TABLE pago_venta
    ADD CONSTRAINT fk_venta FOREIGN KEY ( fk_venta )
        REFERENCES venta ( codigo_venta_ven );

ALTER TABLE empleado_profesion
    ADD CONSTRAINT fk_empleado FOREIGN KEY ( fk_empleado )
        REFERENCES empleado ( codigo_empleado_per );

ALTER TABLE ensamblaje_pieza
    ADD CONSTRAINT fk_plan_ensamblaje FOREIGN KEY ( fk_plan_ensamblaje )
        REFERENCES plan_ensamblaje ( codigo_pe );

ALTER TABLE ensamblaje_avion
    ADD CONSTRAINT fk_plan_ensamblaje FOREIGN KEY ( fk_plan_ensamblaje )
        REFERENCES plan_ensamblaje ( codigo_pe );

ALTER TABLE ensamblaje_pieza
    ADD CONSTRAINT fk_configuracion_pieza FOREIGN KEY ( fk_configuracion_pieza,
                                             fk_configuracion_pieza2 )
        REFERENCES configuracion_pieza ( fk_tipo_materia_prima,
                                         fk_tipo_pieza );

ALTER TABLE ensamblaje_avion
    ADD CONSTRAINT fk_configuracion_avion FOREIGN KEY ( fk_configuracion_avion,
                                             fk_configuracion_avion2 )
        REFERENCES configuracion_avion ( fk_tipo_pieza,
                                         fk_modelo_avion );

ALTER TABLE ensamblaje
    ADD CONSTRAINT fk_plan_ensamblaje FOREIGN KEY ( fk_plan_ensamblaje )
        REFERENCES plan_ensamblaje ( codigo_pe );

ALTER TABLE ensamblaje
    ADD CONSTRAINT fk_pieza FOREIGN KEY ( fk_pieza,
                                             fk_pieza2 )
        REFERENCES pieza ( codigo_pie,
                           fk_ensamblaje );

ALTER TABLE ensamblaje
    ADD CONSTRAINT fk_lote_materia_prima FOREIGN KEY ( fk_lote_materia_prima )
        REFERENCES lote_materia_prima ( codigo_lmp );



ALTER TABLE lugar ADD CONSTRAINT tipo_lug_check check(tipo_lug in ('parroquia','municipio', 'estado'));

ALTER TABLE persona ADD CONSTRAINT tipo_com_check check(tipo_com in ('cliente','proveedor'));

ALTER TABLE persona ADD CONSTRAINT tipo_comerial_com_check check(tipo_persona_com in ('juridico','natural'));

ALTER TABLE persona ADD UNIQUE (fk_usuario);

ALTER TABLE persona ADD UNIQUE (rif_jur);

ALTER TABLE persona ADD UNIQUE (denominacion_persona_jur);

ALTER TABLE persona ADD UNIQUE (pagina_web_jur);

ALTER TABLE persona ADD UNIQUE (cedula_nat);

ALTER TABLE compra ADD UNIQUE (numero_factura_com);

ALTER TABLE correo_electronico ADD UNIQUE (direccion_correo_ce);

ALTER TABLE empleado ADD UNIQUE (fk_usuario);

ALTER TABLE empleado ADD UNIQUE (cedula_per);

ALTER TABLE telefono ADD UNIQUE (numero_telefono_tel);

ALTER TABLE sesion ADD CONSTRAINT usuario_fk FOREIGN KEY(user_id) REFERENCES usuario(codigo_usu);
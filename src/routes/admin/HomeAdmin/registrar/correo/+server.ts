import { json } from '@sveltejs/kit';
import {dbPostgre } from '$lib/server/db';

export async function POST({ request }) {
    const { codigo_com, direccion_com, monto_acreditado_com, fecha_inicio_operaciones_com, tipo_com,
       nacionalidad_com, fk_lugar, fk_usuario, tipo_persona_com, rif_jur, denominacion_persona_jur, 
       razon_social_jur, pagina_web_jur, cedula_nat, primer_nombre_nat, segundo_nombre_nat, 
       primer_apellido_nat, segundo_apellido_nat } = await request.json();

      const respuesta = await dbPostgre`CALL insertar_persona(${codigo_com}, ${direccion_com}, 
                      ${monto_acreditado_com}, ${fecha_inicio_operaciones_com}, ${tipo_com}, ${nacionalidad_com},
                      ${fk_lugar}, ${fk_usuario}, ${tipo_persona_com}, ${rif_jur}, ${denominacion_persona_jur},
                      ${razon_social_jur}, ${pagina_web_jur}, ${cedula_nat}, ${primer_nombre_nat}, ${segundo_nombre_nat},
                      ${primer_apellido_nat}, ${segundo_apellido_nat})`;

    const { codigo_tel, numero_telefono_tel, codigo_area_tel, fk_persona, fk_empleado } = await request.json();

    const respuesta2 = await dbPostgre`CALL insertar_telefono(${codigo_tel}, ${numero_telefono_tel}, ${codigo_area_tel},
                                      ${fk_persona}, NULL)`;
                                      
    return json({ respuesta }, { status: 201 });
}

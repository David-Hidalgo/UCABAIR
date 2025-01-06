import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';

export async function POST({ request }) {
	const {
		codigo_com,
		direccion_com,
		monto_acreditado_com,
		fecha_inicio_operacion_com,
		tipo_com,
		nacionalidad_com,
		fk_lugar,
		fk_usuario,
		tipo_persona_com,
		rif_jur,
		denominacion_persona_jur,
		razon_social_jur,
		pagina_web_jur,
		cedula_nat,
		primer_nombre_nat,
		segundo_nombre_nat,
		primer_apellido_nat,
		segundo_apellido_nat
	} = await request.json();

	
    console.log("ajá aquí se guarda");
    console.log(request.json);

	const respuesta = await dbPostgre`CALL insertar_persona(${direccion_com},${monto_acreditado_com},
        ${fecha_inicio_operacion_com},${tipo_com},${nacionalidad_com},${fk_lugar}, ${fk_usuario},
        ${tipo_persona_com},${rif_jur}, ${denominacion_persona_jur},${razon_social_jur}, ${pagina_web_jur}, 
        ${cedula_nat},${primer_nombre_nat}, ${segundo_nombre_nat}, ${primer_apellido_nat}, ${segundo_apellido_nat});`;

	return json({ respuesta }, { status: 201 });
}

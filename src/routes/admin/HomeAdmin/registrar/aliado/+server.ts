import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';

interface proveedor {
	codigo_com: string;
	direccion_com: string;
	monto_acreditado_com: number;
	fecha_inicio_operaciones_com: string;
	tipo_com: string;
	nacionalidad_com: string;
	fk_lugar: number;
	fk_usuario: number;
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
}

export async function POST({ request }) {
	const {
		codigo_com,
		direccion_com,
		monto_acreditado_com,
		fecha_inicio_operaciones_com,
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
	}:proveedor = await request.json();

	console.log('ajá aquí se guarda');
	console.log(request.json);
 	let cosa=1;
	const respuesta = await dbPostgre`CALL insertar_persona(${direccion_com},${monto_acreditado_com},${fecha_inicio_operaciones_com}, ${tipo_com}, ${nacionalidad_com}, ${fk_lugar}, ${fk_usuario}, ${tipo_persona_com}, ${rif_jur}, ${denominacion_persona_jur},${razon_social_jur}, ${pagina_web_jur}, NULL, NULL, NULL,NULL,NULL,${cosa});
    `;
	console.log(respuesta);

	return json({ respuesta }, { status: 201 });
}

//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';
import type { RequestHandler } from './$types';

export const POST: RequestHandler = async ({ request }) => {
	const modo_pago = await request.json();
	let respuesta;
	switch (modo_pago.tipo_mp) {
		case 'debito':
			[respuesta] =
				await dbPostgre`CALL insertar_modo_pago(${modo_pago.tipo_mp}, ${modo_pago.numero_tarjeta_tar}, ${modo_pago.banco_tar}, ${modo_pago.cvv_tar},${modo_pago.mes_vencimiento_tar}, ${modo_pago.nombre_tar}, ${modo_pago.fecha_emision_tar},NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1)`;
			return json(respuesta, { status: 201 });
			break;
		case 'credito':
			[respuesta] =
				await dbPostgre`CALL insertar_modo_pago(${modo_pago.tipo_mp}, ${modo_pago.numero_tarjeta_tar}, ${modo_pago.banco_tar}, ${modo_pago.cvv_tar},${modo_pago.mes_vencimiento_tar}, ${modo_pago.nombre_tar}, ${modo_pago.fecha_emision_tar},NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1)`;
			return json(respuesta, { status: 201 });
			break;
		case 'transferencia':
			[respuesta] =
				await dbPostgre`CALL insertar_modo_pago(${modo_pago.tipo_mp},NULL, NULL, NULL,NULL, NULL, NULL,${modo_pago.numero_transferencia_tran},${modo_pago.fecha_emision_tran},${modo_pago.numero_cuenta_tran},NULL,NULL,NULL,NULL,NULL,1)`;
			return json(respuesta, { status: 201 });
			break;
		case 'cheque':
			[respuesta] =
				await dbPostgre`CALL insertar_modo_pago(${modo_pago.tipo_mp}, NULL, NULL, NULL,NULL, NULL, NULL,,NULL,NULL,NULL,${modo_pago.numero_cheque_che},${modo_pago.banco_che},${modo_pago.fecha_emision_che},${modo_pago.beneficiario_che},NULL,1)`;
			return json(respuesta, { status: 201 });
			break;
		case 'efectivo':
			[respuesta] =
				await dbPostgre`CALL insertar_modo_pago(${modo_pago.tipo_mp}, NULL, NULL, NULL,NULL, NULL, NULL,,NULL,NULL,NULL,NULL,NULL,NULL,NULL,${modo_pago.denominacion_efe},1)`;
			return json(respuesta, { status: 201 });
			break;
		default:
			throw new Error('Tipo de medio de pago no soportado');
	}
};

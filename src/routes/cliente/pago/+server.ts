//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';
import type { RequestHandler } from './$types';

export const POST: RequestHandler = async ({request}) => {
    const { codigo_mp,tipo_mp,numero_tarjeta_tar,banco_tar,cvv_tar,mes_vencimiento_tar,
            ano_vencimiento_tar,nombre_tar,fecha_emision_tar,numero_transferencia_tran,
            fecha_emision_tran,numero_cuenta_tran,numero_cheque_che,banco_che,fecha_emision_che,
            beneficiario_che,denominacion_efe } = await request.json();
            let respuesta
            switch (tipo_mp) {
                case 'tarjeta':
                    respuesta = await dbPostgre`CALL insertar_modo_pago(${tipo_mp}, ${numero_tarjeta_tar}, ${banco_tar}, ${cvv_tar},${mes_vencimiento_tar}, ${nombre_tar}, ${fecha_emision_tar},NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,)`;
                    return json({ respuesta }, { status: 201 });
                    break;
                case 'transferencia':
                    respuesta = await dbPostgre`CALL insertar_modo_pago(${tipo_mp},NULL, NULL, NULL,NULL, NULL, NULL,${numero_transferencia_tran},${fecha_emision_tran},${numero_cuenta_tran},NULL,NULL,NULL,NULL,NULL,)`;
                    return json({ respuesta }, { status: 201 });
                    break;
                case 'cheque':
                    respuesta = await dbPostgre`CALL insertar_modo_pago(${tipo_mp}, NULL, NULL, NULL,NULL, NULL, NULL,,NULL,NULL,NULL,${numero_cheque_che},${banco_che},${fecha_emision_che},${beneficiario_che},NULL)`;
                    return json({ respuesta }, { status: 201 });
                    break;
                case 'efectivo':
                    respuesta = await dbPostgre`CALL insertar_modo_pago(${tipo_mp}, NULL, NULL, NULL,NULL, NULL, NULL,,NULL,NULL,NULL,NULL,NULL,NULL,NULL,${denominacion_efe})`;
                    return json({ respuesta }, { status: 201 });
                    break;
                default:
                    throw new Error('Tipo de medio de pago no soportado');
            }
            
	
}

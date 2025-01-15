//import { error } from '@sveltejs/kit';
import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';
import type { RequestHandler } from './$types';

export const POST: RequestHandler = async ({request}) => {
    const datosVenta = await request.json();
    console.log(datosVenta);
    if (!datosVenta) {
        return json({ error: 'No se recibieron datos' }, { status: 400 });
    }
    let respuesta;
        let precioAvion:number = datosVenta.precioAvion;
        let impuesto:number = datosVenta.precioAvion * 0.16;
        let total:number = datosVenta.precioAvion+datosVenta.precioAvion*0.16;
        const cantidad= datosVenta.cantidad;

    if (datosVenta.moneda.nombre_mon === "Bolívar") {
        [respuesta] = await dbPostgre`call insertar_pago_venta(${precioAvion},${impuesto},${total},${(datosVenta.modo_pago)as number},${(datosVenta.moneda.codigo_mon)as number},${(datosVenta.codigo_com  )as number},${cantidad})`
    }else{
        precioAvion = (datosVenta.precioAvion / datosVenta.moneda.tasa_cambio_mon);
        impuesto = (datosVenta.precioAvion / datosVenta.moneda.tasa_cambio_mon) * 0.03;
        total = (datosVenta.precioAvion / datosVenta.moneda.tasa_cambio_mon)+((datosVenta.precioAvion / datosVenta.moneda.tasa_cambio_mon)*0.03);
        [respuesta] = await dbPostgre`call insertar_pago_venta(${precioAvion},${impuesto},${total},${datosVenta.modo_pago},${datosVenta.moneda.codigo_mon},${datosVenta.codigo_com},${cantidad})`
    }
    return json({ respuesta }, { status: 201 });
	
}

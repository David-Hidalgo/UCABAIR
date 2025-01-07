import { error } from '@sveltejs/kit';
import type {PageServerLoad } from './$types';
import { dbPostgre } from "$lib/server/db/index";
import type {Proveedor, Telefono, Correo_electronico} from '$lib/server/db/schema';
export const load: PageServerLoad=async({ params}) =>{
    const index = params.index;

    if (!index) error(404);
    const n=Number.parseInt(index)

    if (Number.isInteger(n)) {
        
        const [resultado] =await dbPostgre<Proveedor[]>`select * from persona where codigo_com=${n}`
        const [telefonos] =await dbPostgre<Telefono[]>`select * from telefono where fk_persona=${n}`
        const [correos] =await dbPostgre<Correo_electronico[]>`select * from correo_electronico where fk_persona=${n}`
        const [fk_usuario]= await dbPostgre<Proveedor[]> `select p.fk_usuario from persona p, usuario u 
                                                    where p.fk_usuario=u.codigo_usu and codigo_com=${n}  `
        return {resultado,telefonos, correos,fk_usuario};
    }
    error(400)
}

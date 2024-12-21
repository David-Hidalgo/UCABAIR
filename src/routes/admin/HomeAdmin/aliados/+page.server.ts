import {dbPostgre } from '$lib/server/db';
import type { Actions,PageServerLoad } from './$types';

export interface Proveedor {
	codigo_com: number | undefined;
	rif_jur: string;
	denominacion_persona_jur: string;
	razon_social_jur: string;
	pagina_web_jur: string;
	//telefono_com: number[];
	//correo_com: string[];
	direccion_com: string;
	monto_acreditado_com: number | undefined;
	fecha_inicio_operaciones_com: Date | undefined;
}




/*export const actions: Actions = {
            delete: async (event) => {
            const formData = await event.request.formData();
            console.log(formData);
            
            const codigo  = formData.get('codigo');

            if (!codigo) {
                return { status: 400, body: { message: 'Invalid data' } };
            }
            const palabra : string = codigo.toString();
            console.log(palabra);
            
            await dbPostgre`CALL eliminar_empleado(${palabra});`;

            return {
                status: 302,
                headers: {
                    location: '/admin/HomeAdmin/empleado'
                }
            };
            }
        }
*/

export const load: PageServerLoad = async ({ params }) => {

    const roltable = await dbPostgre<Proveedor[]>`
    select per.direccion_com,per.monto_acreditado_com,per.fecha_inicio_operacion_com,per.nacionalidad_com,
u.nombre_usu,l.nombre_lug,per.rif_jur,per.denominacion_persona_jur,per.razon_social_jur,per.pagina_web_jur
    from persona per inner join usuario u on per.fk_usuario=u.codigo_usu inner join lugar l on per.fk_lugar=l.codigo_lug
	where tipo_com='proveedor' and tipo_persona_com='juridico';
`;

    return {roltable};
};


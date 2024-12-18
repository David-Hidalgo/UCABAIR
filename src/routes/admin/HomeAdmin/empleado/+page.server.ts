import {dbPostgre } from '$lib/server/db';
import type { Actions,PageServerLoad } from './$types';

export interface Empleado {
	codigo_empleado_per: number | undefined;
	cedula_per: string;
	primer_nombre_per: string;
	segundo_nombre_per: string;
	primer_apellido_per: string;
	segundo_apellido_per: string;
	direccion_per: string;
	fecha_inicio_servicio_per: Date | undefined;
	//experiencia_profesional_per: string;
	//titulacion_per: string;
	sueldo_per: number | undefined;
	//telefono_per: number| undefined;
	//correo_per: string;
	//labor_per: string;
	fk_lugar: number | undefined;
	fk_usuario: number | undefined;
}



export const actions: Actions = {
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


export const load: PageServerLoad = async ({ params }) => {

    const roltable = 	await dbPostgre<Empleado[]>`
    SELECT * FROM empleado;
`
    // console.log(roltable);
    return {roltable};
};


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
    empleado_profesion: Empleado_profesion[];
	sueldo_per: number | undefined;
	telefono_per: Telefono[];
	correo_per: Correo_electronico[];
	//labor_per: string;
	fk_lugar: number | undefined;
    fk_usuario: number | undefined;
}

export interface Usuario {
    codigo_usu: number | undefined;
    nombre_usu: string;
    contrasena_usu: string;
    fk_rol: number | undefined;
}

export interface Profesion {
    codigo_pro : number | undefined,
    nombre_pro : string
};

export interface Empleado_profesion {
    titulacion_ep: string;
    experiencia_profesional_ep: string;
    fk_profesion: number | undefined;
    fk_empleado: number | undefined;
}

export interface Telefono {
    codigo_tel: number | undefined;
    numero_telefono_tel: string;
    codigo_area_tel: string;
    fk_persona: number | undefined;
    fk_empleado: number | undefined;
}

export interface Correo_electronico {
	codigo_ce: number | undefined;
	direccion_correo_ce: string;
	fk_persona: number | undefined;
	fk_empleado: number | undefined;
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

    const roltable = await dbPostgre<Empleado[]>`SELECT * FROM empleado;`;
    const tel_table = await dbPostgre<Telefono[]>`SELECT * FROM telefono;`;
    const email_table = await dbPostgre<Correo_electronico[]>`SELECT * FROM correo_electronico;`;
    const profesion_table = await dbPostgre<Profesion[]>`SELECT * FROM profesion;`;
    const empleado_profesion_table = await dbPostgre<Empleado_profesion[]>`SELECT * FROM empleado_profesion;`;
    const usuario_table = await dbPostgre<Usuario[]>`SELECT * FROM usuario;`;

    return {roltable,tel_table,email_table,profesion_table,empleado_profesion_table,usuario_table};
};


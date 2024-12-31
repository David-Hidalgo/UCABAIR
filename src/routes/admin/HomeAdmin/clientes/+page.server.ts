import {dbPostgre } from '$lib/server/db';
import type { Actions,PageServerLoad } from './$types';

export interface Persona {
	codigo_com: number | undefined;
	direccion_com: string;
	monto_acreditado_com: number | undefined;
	fecha_inicio_operacion_com: Date | undefined;
	tipo_com: string;
	nacionalidad_com: string;
	fk_lugar: number | undefined;
	fk_usuario: number | undefined;
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
    telefonos: Telefono[];
    correos_electronicos: Correo_electronico[];
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

    const nat_table = await dbPostgre<Persona[]>`SELECT * FROM persona WHERE tipo_persona_com = 'natural' and tipo_com ='cliente';`;
    const jur_table = await dbPostgre<Persona[]>`SELECT * FROM persona WHERE tipo_persona_com = 'juridico' and tipo_com ='cliente';`;
    const tel_table = await dbPostgre<Telefono[]>`SELECT * FROM telefono;`;
    const email_table = await dbPostgre<Correo_electronico[]>`SELECT * FROM correo_electronico;`;
    return {nat_table,jur_table,tel_table,email_table};
};


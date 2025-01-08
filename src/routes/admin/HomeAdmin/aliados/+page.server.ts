import { dbPostgre } from '$lib/server/db';
import type { Actions, PageServerLoad } from './$types';

export interface Proveedor {
	codigo_com: number | undefined;
	rif_jur: string;
	denominacion_persona_jur: string;
	razon_social_jur: string;
	pagina_web_jur: string;
	direccion_com: string;
	telefono_com: Telefono[];
	correo_com: Correo_electronico[];
	monto_acreditado_com: number | undefined;
	fecha_inicio_operacion_com: Date;
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
	const roltable = await dbPostgre<Proveedor[]>`SELECT * FROM persona WHERE tipo_com ='proveedor';`;
	const tel_table = await dbPostgre<Telefono[]>`SELECT * FROM telefono;`;
	const email_table = await dbPostgre<Correo_electronico[]>`SELECT * FROM correo_electronico;`;

	return { roltable, tel_table, email_table };
};

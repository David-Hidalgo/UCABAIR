import { dbPostgre } from '$lib/server/db';
import type { Actions,PageServerLoad } from './$types';

export interface Tipo_prueba {
    codigo_tp: number;
    nombre_tp: string;
    descripcion_tp: string;
    duracion_estimada_tp: string;
}

export const actions: Actions = {
    delete: async (event) => {
        const formData = await event.request.formData();
        console.log(formData);

        const codigo_tp = formData.get('codigo');

        if (!codigo_tp) {
            return { status: 400, body: { message: 'Invalid data' } };
        }
        const palabra: string = codigo_tp.toString();
        console.log(palabra);

        await dbPostgre`CALL eliminar_tipo_prueba(${palabra});`;

        return {
            status: 302,
            headers: {
                location: '/admin/HomeAdmin/pruebas/pruebas_catalogo'
            }
        };
    }
};

export const load: PageServerLoad = async ({ params }) => {
    const tptable = await dbPostgre<Tipo_prueba[]>`
    SELECT * FROM tipo_prueba;
    `;
    // console.log(roltable);
    return { tptable };
};
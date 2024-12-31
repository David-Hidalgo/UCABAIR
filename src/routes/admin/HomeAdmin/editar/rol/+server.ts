import { json } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';

export async function PUT({ request }) {
    const { rol, codigo_viejo, privSelected } = await request.json();
    // const userid = cookies.get('userid');
    console.log(rol.codigo_rol, rol.nombre_rol, rol.descripcion_rol, codigo_viejo, privSelected);

    const respuesta =
        await dbPostgre`CALL editar_rol(${rol.codigo_rol}, ${rol.nombre_rol}, ${rol.descripcion_rol}, ${codigo_viejo}, ${dbPostgre.array(privSelected)})`;

    return json({ respuesta }, { status: 201 });
}

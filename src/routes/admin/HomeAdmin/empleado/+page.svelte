<script lang="ts">
	
	import type { ActionData } from './$types';
	import type { PageData } from './$types';
	import type { Empleado, Profesion,Empleado_profesion, Telefono, Correo_electronico, Usuario} from './+page.server.ts';
	import { goto } from '$app/navigation';
	import { toDate } from 'date-fns';
	let { data }: { data: PageData } = $props();

	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	
	let empleados_profesiones: Empleado_profesion[] = new Array();
for (let index = 0; index < data.empleado_profesion_table.length; index++) {
    let empleado_profesion: Empleado_profesion = {
		titulacion_ep: '',
		experiencia_profesional_ep: '',
		fk_profesion: undefined,
		fk_empleado: undefined

    }
	empleado_profesion.titulacion_ep = data.empleado_profesion_table[index].titulacion_ep;
	empleado_profesion.experiencia_profesional_ep = data.empleado_profesion_table[index].experiencia_profesional_ep;
	empleado_profesion.fk_profesion = data.empleado_profesion_table[index].fk_profesion;
	empleado_profesion.fk_empleado = data.empleado_profesion_table[index].fk_empleado;
	empleados_profesiones.push(empleado_profesion);
};

let profesiones: Profesion[] = new Array();
for (let index = 0; index < data.profesion_table.length; index++) {
	let profesion: Profesion = {
		codigo_pro: undefined,
		nombre_pro: ''
	}
	profesion.codigo_pro = data.profesion_table[index].codigo_pro;
	profesion.nombre_pro = data.profesion_table[index].nombre_pro;
	profesiones.push(profesion);
}

let usuarios: Usuario[] = new Array();
for (let index = 0; index < data.usuario_table.length; index++) {
	let usuario: Usuario = {
		codigo_usu: undefined,
		nombre_usu: '',
		contrasena_usu: '',
		fk_rol: undefined
	}
	usuario.codigo_usu = data.usuario_table[index].codigo_usu;
	usuario.nombre_usu = data.usuario_table[index].nombre_usu;
	usuario.contrasena_usu = data.usuario_table[index].contrasena_usu;
	usuario.fk_rol = data.usuario_table[index].fk_rol;
	usuarios.push(usuario);
}

	let telefonos: Telefono[] = new Array();
for (let index = 0; index < data.tel_table.length; index++) {
    let telefono: Telefono = {
        codigo_tel: undefined,
	    numero_telefono_tel: '',
	    codigo_area_tel: '',
	    fk_persona: undefined,
	    fk_empleado: undefined
    }
    telefono.codigo_tel = data.tel_table[index].codigo_tel;
    telefono.numero_telefono_tel = data.tel_table[index].numero_telefono_tel;
    telefono.codigo_area_tel = data.tel_table[index].codigo_area_tel;
    telefono.fk_persona = data.tel_table[index].fk_persona;
    if (telefono.fk_persona === undefined) {
            telefono.numero_telefono_tel = 'No hay telefonos asociados';
        }
    telefono.fk_empleado = data.tel_table[index].fk_empleado;
    telefonos.push(telefono);
};


let correos: Correo_electronico[] = new Array();
for (let index = 0; index < data.email_table.length; index++) {
    let correo: Correo_electronico = {
        codigo_ce: undefined,
        direccion_correo_ce: '',
        fk_persona: undefined,
        fk_empleado: undefined
    }
    correo.codigo_ce = data.email_table[index].codigo_ce;
    correo.direccion_correo_ce = data.email_table[index].direccion_correo_ce;
    correo.fk_persona = data.email_table[index].fk_persona;
        if (correo.fk_persona === undefined) {
            correo.direccion_correo_ce = 'No hay correos asociados';
        }
    correo.fk_empleado = data.email_table[index].fk_empleado;
    correos.push(correo);
};

	let empleados: Empleado[] = new Array();
	for (let index = 0; index < data.roltable.length; index++) {
		let empleado: Empleado = {
			codigo_empleado_per:undefined,
			cedula_per: '',
			primer_nombre_per: '',
			segundo_nombre_per: '',
			primer_apellido_per: '',
			segundo_apellido_per: '',
			direccion_per: '',
			fecha_inicio_servicio_per:new Date(),
			empleado_profesion: [],
			sueldo_per: undefined,
			telefono_per: [],
			correo_per: [],
			//labor_per: '',
			fk_lugar: undefined,
			fk_usuario: undefined,
		};

		empleado.codigo_empleado_per = data.roltable[index].codigo_empleado_per;
		empleado.cedula_per = data.roltable[index].cedula_per;
		empleado.primer_nombre_per = data.roltable[index].primer_nombre_per;
        empleado.segundo_nombre_per = data.roltable[index].segundo_nombre_per;
        empleado.primer_apellido_per = data.roltable[index].primer_apellido_per;
        empleado.segundo_apellido_per = data.roltable[index].segundo_apellido_per;
        empleado.direccion_per = data.roltable[index].direccion_per;
		empleado.telefono_per = telefonos.filter(telefono => telefono.fk_empleado === empleado.codigo_empleado_per);
		empleado.correo_per = correos.filter(correo => correo.fk_empleado === empleado.codigo_empleado_per);
		empleado.fk_usuario = data.roltable[index].fk_usuario;
		empleado.empleado_profesion = empleados_profesiones.filter(empleado_profesion => empleado_profesion.fk_empleado === empleado.codigo_empleado_per);
		empleado.fecha_inicio_servicio_per = data.roltable[index].fecha_inicio_servicio_per;
        empleado.sueldo_per = data.roltable[index].sueldo_per;
       // empleado.fk_lugar = data.roltable[index].fk_lugar;
		empleados.push(empleado);
	};

    async function editarRegistro(empleados: Empleado) {
		/*try {
			const res = await fetch(`http://localhost:4000/mineral/${roles.id}`, {
				method: 'PUT',
				body: JSON.stringify(roles),
				headers: { 'Content-Type': 'application/json' }
			});

			if (res.ok) {
				// Si la solicitud fue exitosa, redirige al usuario
			} else {
				console.error('Error al actualizar el mineral:', res.status);
				// Maneja el error (por ejemplo, muestra un mensaje de error al usuario)
			}
		} catch (error) {
			console.error('Error en la solicitud:', error);
			// Maneja el error (por ejemplo, muestra un mensaje de error al usuario)
		}*/
	}

	async function eliminarRegistro(empleado: Empleado) {
		await fetch(`http://localhost:5173/admin/HomeAdmin/empleado`, {
			method: 'DELETE',

			body: JSON.stringify(empleado.codigo_empleado_per)
			
		});
		location.reload();
	}
</script>

<h2>Empleados</h2>
<table>
	<thead>
		<tr>
			<th>Nombres</th>
            <th>Apellidos</th>
            <th>Cedula</th>
            <th>Direccion</th>
			<th>Telefono</th>
			<th>Correo</th>
			<th>Usuario</th>
			<th>Profesion</th>
			<th>Experiencia</th>
            <th>Fecha inicio servicio</th>
            <th>Sueldo</th>
		</tr>
	</thead>
	<tbody>
		{#each empleados as empleado}
			<tr>
				<td>{empleado.primer_nombre_per}{' '} {empleado.segundo_nombre_per}</td>
                <td>{empleado.primer_apellido_per}{' '}{empleado.segundo_apellido_per}</td>
                <td>{empleado.cedula_per}</td>
                <td>{empleado.direccion_per}</td>
				<td>{empleado.telefono_per.map(tel => tel.numero_telefono_tel).join(', ')}</td>
				<td>{empleado.correo_per.map(correo => correo.direccion_correo_ce).join(', ')}</td>
				<td>{usuarios.find(usuario => usuario.codigo_usu === empleado.fk_usuario)?.nombre_usu}</td>
				<td>{empleado.empleado_profesion.map(profesion => profesiones.find(prof => prof.codigo_pro === profesion.fk_profesion)?.nombre_pro).join(', ')}</td>
				<td>{empleado.empleado_profesion.map(profesion => profesion.experiencia_profesional_ep).join(', ')}</td>
				<td>{empleado.fecha_inicio_servicio_per ? empleado.fecha_inicio_servicio_per.toLocaleString() : 'N/A'}</td>
                <td>{empleado.sueldo_per}</td>
				<td>
					<div class="botonesUD">
						<a href='/admin/HomeAdmin/editar/empleado/{empleado.codigo_empleado_per}'>
							<button onclick={() => editarRegistro(empleado)}>
								<span>✏️</span>
								<!-- Icono de lápiz -->
							</button>
						</a>
						<button onclick={() => eliminarRegistro(empleado)}>
							<span>🗑️</span>
							<!-- Icono de papelera -->
						</button>
					</div>
				</td>
			</tr>
		{/each}
	</tbody>
</table>
<a href="/admin/HomeAdmin/registrar/empleado">
	<button>Registrar Empleado</button>
</a>

<style>
	.botonesUD {
		display: flex;
		background-color: white;
		color: #fff;
		border: none;
		border-radius: 3px;
		padding: 10px 20px;
	}
	table {
		width: 100%;
		border-collapse: collapse;
	}
	th,
	td {
		border: 1px solid #adadad;
		padding: 8px;
		text-align: left;
		font-family: 'Baskervville';
		font-style: light;
		align-items: center;
		text-align: center;
		letter-spacing: -0.03em;
	}
	thead {
		background-color: white;
	}

	button {
		background-color: #050505;
		color: #fff;
		border: none;
		border-radius: 3px;
		padding: 10px 20px;
		cursor: pointer;
		font-size: 16px;
	}
</style>

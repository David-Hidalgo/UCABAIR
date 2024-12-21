<script lang="ts">
	
	import type { ActionData } from './$types';
	import type { PageData } from './$types';
	import type { Empleado } from './+page.server.ts';
	import { goto } from '$app/navigation';
	let { data }: { data: PageData } = $props();

	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}

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
	fecha_inicio_servicio_per:undefined,
	//experiencia_profesional_per: '',
	//titulacion_per: '',
	sueldo_per: undefined,
	//telefono_per: undefined,
	//correo_per: '',
	//labor_per: '',
	fk_lugar: undefined,
	fk_usuario: undefined
		};
		empleado.codigo_empleado_per = data.roltable[index].codigo_empleado_per;
		empleado.cedula_per = data.roltable[index].cedula_per;
		empleado.primer_nombre_per = data.roltable[index].primer_nombre_per;
        empleado.segundo_nombre_per = data.roltable[index].segundo_nombre_per;
        empleado.primer_apellido_per = data.roltable[index].primer_apellido_per;
        empleado.segundo_apellido_per = data.roltable[index].segundo_apellido_per;
        empleado.direccion_per = data.roltable[index].direccion_per;
        empleado.fecha_inicio_servicio_per = data.roltable[index].fecha_inicio_servicio_per;
        empleado.sueldo_per = data.roltable[index].sueldo_per;
        empleado.fk_lugar = data.roltable[index].fk_lugar;
        empleado.fk_usuario = data.roltable[index].fk_usuario;
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
		// goto('/admin/HomeAdmin/empleado')
	}
</script>

<h2>Empleados</h2>
<table>
	<thead>
		<tr>
			<th>Primer nombre</th>
			<th>Segundo nombre</th>
            <th>Primer nombre</th>
            <th>Segundo apellido</th>
            <th>Cedula</th>
            <th>Direccion</th>
            <th>Fecha inicio servicio</th>
            <th>Sueldo</th>
			<th>Estado</th>
			<th>Usuario</th>
		</tr>
	</thead>
	<tbody>
		{#each empleados as empleado}
			<tr>
				<td>{empleado.primer_nombre_per}</td>
				<td>{empleado.segundo_nombre_per}</td>
                <td>{empleado.primer_apellido_per}</td>
                <td>{empleado.segundo_apellido_per}</td>
                <td>{empleado.cedula_per}</td>
                <td>{empleado.direccion_per}</td>
                <td>{empleado.fecha_inicio_servicio_per}</td>
                <td>{empleado.sueldo_per}</td>
				<td>{empleado.fk_usuario}</td>
				<td>{empleado.fk_lugar}</td>
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

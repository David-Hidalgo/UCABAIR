<script lang="ts">
	//import navigate from 'svelte-spa-router';
	// import { createEventDispatcher } from 'svelte';
	import { enhance } from '$app/forms';
	import type { ActionData } from './$types';

	import type { PageData } from './$types';
	import type { Rol } from './+page.server.ts';
	// const dispatch = createEventDispatcher();


	let { data }: { data: PageData } = $props();

	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}

	let roles: Rol[]= new Array();
	for (let index = 0; index < data.roltable.length; index++) {
		let rol: Rol = {
			codigo_rol: 0,
			nombre_rol: '',
			descripcion_rol: ''
		};
		rol.codigo_rol = data.roltable[index].codigo_rol;
		rol.nombre_rol = data.roltable[index].nombre_rol;
		rol.descripcion_rol = data.roltable[index].descripcion_rol;
		roles.push(rol);
	};


	console.log(roles);
	

	async function generarReporte(minerales: Rol[]) {
		//logica para
	}

	//mostrarDatos();
	//
	// Función para editar un registro
	async function editarRegistro(roles: Rol) {
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

	// Función para eliminar un registro
	
	async function eliminarRegistro(roles: Rol) {
		await fetch(`http://localhost:5173/admin/HomeAdmin/roles`, {
			method: 'DELETE',

			body: JSON.stringify(roles.codigo_rol),
		});
	}


</script>

<h2>Roles</h2>
<table>
	<thead>
		<tr>
			<th>ID</th>
			<th>Rol</th>
			<th>Descripcion</th>
		</tr>
	</thead>
	<tbody>
		{#each roles as rol}
		<tr>
			<td>{rol.codigo_rol}</td>
			<td>{rol.nombre_rol}</td>
			<td>{rol.descripcion_rol}</td>
			<td>
				<div class="botonesUD">
					<a href="/admin/HomeAdmin/editar/rol">
						<button onclick={() => editarRegistro(rol)}>
							<span>✏️</span>
							<!-- Icono de lápiz -->
						</button>
					</a>
							<button onclick={() => eliminarRegistro(rol)}>
								<span>🗑️</span>
							<!-- Icono de papelera -->
							</button>
					</div>
				</td>
			</tr>
		{/each}
	</tbody>
</table>
<a href="/admin/HomeAdmin/registrar/rol">
	<button>Registrar Rol</button>
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

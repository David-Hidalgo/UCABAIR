<script lang="ts">
	import navigate from 'svelte-spa-router';
	import { createEventDispatcher } from 'svelte';
	import RegistrarMineral from '$lib/components/registrarMineral.svelte';

	const dispatch = createEventDispatcher();

	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	interface Rol {
		id: string;
		rol: string;
		descripcion: string;
	}

	let rol: Rol = {
		id: '1',
		rol: 'admin',
		descripcion: 'Administrador del sistema'
	};

	export let roles: Rol[] = [];

	async function generarReporte(minerales: Rol[]) {
		//logica para
	}

	/*   async function mostrarDatos() {
    
    const response = await fetch('http://localhost:4000/minerales');
    const data: Rol[] = await response.json();
    rol = data;
    
  } */

	//mostrarDatos();
	//
	// Función para editar un registro
	async function editarRegistro(roles: Rol) {
		try {
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
		}
	}

	// Función para eliminar un registro
	async function eliminarRegistro(roles: Rol) {
		await fetch(`http://localhost:4000/mineral/${roles.id}`, {
			method: 'DELETE'
		});
	}
</script>

<h2>Minerales</h2>
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
				<td>{rol.id}</td>
				<td>{rol.rol}</td>
				<td>{rol.descripcion}</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/editar/rol">
							<button on:click={() => editarRegistro(rol)}>
								<span>✏️</span>
								<!-- Icono de lápiz -->
							</button>
						</a>
						<button on:click={() => eliminarRegistro(rol)}>
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

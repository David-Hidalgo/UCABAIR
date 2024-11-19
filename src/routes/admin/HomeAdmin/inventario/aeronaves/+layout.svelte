<script lang="ts">
	//import navigate from 'svelte-spa-router';
	//import { createEventDispatcher } from 'svelte';
	//import RegistrarMineral from '$lib/components/registrarAeronave.svelte'; HAY QUE CREARLO

	//const dispatch = createEventDispatcher();

	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	
	// Define una interfaz para el tipo de datos que contiene 'datos'
	interface Aeronave {
		id_avi: number;
		nombre_avi: string;
		tipo_avi: string;
		color_avi: string;
		ubicacion_avi: string;
	}

	export let aeronaves: Aeronave[] = [
		{
			id_avi: 1,
			nombre_avi: 'Aeronave 1',
			tipo_avi: 'AU-787',
			color_avi: 'Blanco',
			ubicacion_avi: 'Sede Valencia'
		},
		{
			id_avi: 2,
			nombre_avi: 'Aeronave 2',
			tipo_avi: 'AU-80',
			color_avi: 'Azul',
			ubicacion_avi: 'Sede Caracas'
		},
		{
			id_avi: 3,
			nombre_avi: 'Aeronave 3',
			tipo_avi: 'AU-747',
			color_avi: 'Rojo',
			ubicacion_avi: 'Sede Maracay'
		}
	];

	async function generarReporte(aeronaves: Aeronave[]) {
		//logica para
	}

	async function mostrarDatos() {
		const response = await fetch('http://localhost:4000/aeronave');
		const data: Aeronave[] = await response.json();
		aeronaves = data;
	}

	mostrarDatos();
	//
	// Función para editar un registro
	async function editarRegistro(aeronaves: Aeronave) {
		try {
			const res = await fetch(`http://localhost:4000/mineral/${aeronaves.id_avi}`, {//configurar la ruta
				method: 'PUT',
				body: JSON.stringify(aeronaves),
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
	async function eliminarRegistro(aeronaves: Aeronave) {
		await fetch(`http://localhost:4000/mineral/${minerales.id_mineral}`, {
			method: 'DELETE'
		});
	}
</script>

<h2>Aeronaves</h2>
<table>
	<thead>
		<tr>
			<th>Id</th>
			<th>Nombre</th>
			<th>Tipo</th>
			<th>Color</th>
			<th>Ubicación</th>
		</tr>
	</thead>
	<tbody>
		{#each aeronaves as dato}
			<tr>
				<td>{dato.id_avi}</td>
				<td>{dato.nombre_avi}</td>
				<td>{dato.tipo_avi}</td>
				<td>{dato.color_avi}</td>
				<td>{dato.ubicacion_avi}</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/editar/mineral"> // Hara falta un editar aeronave?
							<button on:click={() => editarRegistro(dato)}>
								<span>✏️</span>
								<!-- Icono de lápiz -->
							</button>
						</a>
						<button on:click={() => eliminarRegistro(dato)}>
							<span>🗑️</span>
							<!-- Icono de papelera -->
						</button>
					</div>
				</td>
			</tr>
		{/each}
	</tbody>
</table>
<a href="/admin/HomeAdmin/registrar/mineral">
	<button>Registrar Mineral</button>
</a>
<a href="/admin/HomeAdmin/reponerInventario">
	<button>Reponer Inventario</button>
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

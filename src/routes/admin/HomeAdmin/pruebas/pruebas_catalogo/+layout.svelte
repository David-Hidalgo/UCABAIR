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
	interface Tipo_Prueba {
		id_tipo_prueba: number;
		nombre_tipo_prueba: string;
		a_probar_prueba: string;
		descripcion_tipo_prueba: string;
		duracion_tipo_prueba: number;
		costo_tipo_prueba: number;
		empleados_necesarios_tipo_prueba: number;
	}

	let tipo_pruebas: Tipo_Prueba[] = [
		{
			id_tipo_prueba: 1,
			nombre_tipo_prueba: 'Prueba de Resistencia',
			a_probar_prueba: 'Piezas',
			descripcion_tipo_prueba: 'Prueba de resistencia de piezas',
			duracion_tipo_prueba: 2,
			costo_tipo_prueba: 100,
			empleados_necesarios_tipo_prueba: 2
		},
		{
			id_tipo_prueba: 2,
			nombre_tipo_prueba: 'Prueba de Color',
			a_probar_prueba: 'Materia Prima',
			descripcion_tipo_prueba: 'Prueba de color de pintura',
			duracion_tipo_prueba: 3,
			costo_tipo_prueba: 200,
			empleados_necesarios_tipo_prueba: 3
		},
		{
			id_tipo_prueba: 3,
			nombre_tipo_prueba: 'Prueba de Vuelo',
			a_probar_prueba: 'Aeronaves',
			descripcion_tipo_prueba: 'Prueba de vuelo de aeronaves',
			duracion_tipo_prueba: 4,
			costo_tipo_prueba: 300,
			empleados_necesarios_tipo_prueba: 4
		}
	];

	async function generarReporte(tipo_pruebas: Tipo_Prueba[]) {
		//logica para
	}

	async function mostrarDatos() {
		const response = await fetch('http://localhost:4000/aeronave');
		const data: Tipo_Prueba[] = await response.json();
		tipo_pruebas = data;
	}

	mostrarDatos();
	//
	// Función para editar un registro
	async function editarRegistro(tipo_pruebas: Tipo_Prueba) {
		/*try {
			const res = await fetch(`http://localhost:4000/aeronave/${tipo_pruebas.id_tipo_prueba}`, {//configurar la ruta
				method: 'PUT',
				body: JSON.stringify(tipo_pruebas),
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
	) {
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
		}*/
	}

	// Función para eliminar un registro
	async function eliminarRegistro(tipo_pruebas: Tipo_Prueba) {
		/*await fetch(`http://localhost:4000/mineral/${aeronaves.id_avi}`, {
			method: 'DELETE'
		});*/
	}
</script>

<h2>Catalogo de Pruebas</h2>
<table>
	<thead>
		<tr>
			<th>Id</th>
			<th>Nombre</th>
			<th>A probar</th>
			<th>Descripción</th>
			<th>Duración</th>
			<th>Costo</th>
			<th>Empleados Necesarios</th>
		</tr>
	</thead>
	<tbody>
		{#each tipo_pruebas as dato}
			<tr>
				<td>{dato.id_tipo_prueba}</td>
				<td>{dato.nombre_tipo_prueba}</td>
				<td>{dato.a_probar_prueba}</td>
				<td>{dato.descripcion_tipo_prueba}</td>
				<td>{dato.duracion_tipo_prueba}</td>
				<td>{dato.costo_tipo_prueba}</td>
				<td>{dato.empleados_necesarios_tipo_prueba}</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/editar/prueba">
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
<a href="/admin/HomeAdmin/registrar/aeronave">
	<button>Registrar Prueba</button>
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

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
	interface Prueba {
		nombre_prueba: string;
		nombre_pieza: string;
		status_prueba: string;
		encargados_prueba: string;
		codigo_pru: string;
		fecha_inicio_pru: string;
		fecha_fin_pru: string;
		fk_tipo_prueba: number;
		fk_equipo_personal: number;
		fk_equipo_personal2: number;
		fk_zona: number;
		fk_zona2: number;
		fk_estatus: number;
		fk_lote_materia_prima: number;
		fk_pieza: number;
		fk_avion: number;
		fk_pieza2: number;
	}

	let pruebas: Prueba[] = [
		{
			nombre_prueba: 'Prueba de Resistencia',
			nombre_pieza: 'Piezas',
			status_prueba: 'En proceso',
			encargados_prueba: 'Juan Perez',
			codigo_pru: '1',
			fecha_inicio_pru: '2021-10-01',
			fecha_fin_pru: '2021-10-02',
			fk_tipo_prueba: 1,
			fk_equipo_personal: 1,
			fk_equipo_personal2: 2,
			fk_zona: 1,
			fk_zona2: 2,
			fk_estatus: 1,
			fk_lote_materia_prima: 1,
			fk_pieza: 1,
			fk_avion: 1,
			fk_pieza2: 2
		},
		{
			nombre_prueba: 'Prueba de Color',
			nombre_pieza: 'Materia Prima',
			status_prueba: 'En proceso',
			encargados_prueba: 'Pedro Perez',
			codigo_pru: '2',
			fecha_inicio_pru: '2021-10-03',
			fecha_fin_pru: '2021-10-04',
			fk_tipo_prueba: 2,
			fk_equipo_personal: 3,
			fk_equipo_personal2: 4,
			fk_zona: 3,
			fk_zona2: 4,
			fk_estatus: 2,
			fk_lote_materia_prima: 2,
			fk_pieza: 2,
			fk_avion: 2,
			fk_pieza2: 3
		},
		{
			nombre_prueba: 'Prueba de Vuelo',
			nombre_pieza: 'Aeronaves',
			status_prueba: 'En proceso',
			encargados_prueba: 'Maria Perez',
			codigo_pru: '3',
			fecha_inicio_pru: '2021-10-05',
			fecha_fin_pru: '2021-10-06',
			fk_tipo_prueba: 3,
			fk_equipo_personal: 5,
			fk_equipo_personal2: 6,
			fk_zona: 5,
			fk_zona2: 6,
			fk_estatus: 3,
			fk_lote_materia_prima: 3,
			fk_pieza: 3,
			fk_avion: 3,
			fk_pieza2: 4
		}
	];

	async function generarReporte(pruebas: Prueba[]) {
		//logica para
	}

	async function mostrarDatos() {
		/*
		const response = await fetch('http://localhost:4000/aeronave');
		const data: Aeronave[] = await response.json();
		aeronaves = data;*/
	}

	mostrarDatos();
	//
	// Función para editar un registro
	async function editarRegistro(pruebas: Prueba) {
		/*try {
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
	async function eliminarRegistro(pruebas: Prueba) {
		/*await fetch(`http://localhost:4000/mineral/${aeronaves.id_avi}`, {
			method: 'DELETE'
		});*/
	}
</script>

<h2>Pruebas Aeronaves</h2>
<table>
	<thead>
		<tr>
			<th>Nombre</th>
			<th>A Probar</th>
			<th>Fecha Inicio y Final</th>
			<th>Encargados</th>
			<th>Estatus</th>
		</tr>
	</thead>
	<tbody>
		{#each pruebas as dato}
			<tr>
				<td>{dato.nombre_prueba}</td>
				<td>{dato.nombre_pieza}</td>
				<td>Inicio:{dato.fecha_inicio_pru} Final:{dato.fecha_fin_pru}</td>
				<a href={`/admin/HomeAdmin/editar/prueba/${dato.codigo_pru}`}>
					<td>{dato.codigo_pru}</td>
				</a>
				<td>{dato.encargados_prueba}</td>
				<td>{dato.status_prueba}</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/editar/mineral">
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

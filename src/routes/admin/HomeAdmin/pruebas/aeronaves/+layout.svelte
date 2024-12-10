<script lang="ts">
	import Combobox from "$lib/components/combobox.svelte";
	//import navigate from 'svelte-spa-router';
	//import { createEventDispatcher } from 'svelte';
	//import RegistrarPieza from '$lib/components/registrarPieza.svelte';

	//const dispatch = createEventDispatcher();

	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let opcionSeleccionada = 'Pieza';
	// Define una interfaz para el tipo de datos que contiene 'datos'
	interface Prueba {
		codigo_pru: number;
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
		fk_pieza2: number;
		fk_avion: number;
	}

	let pruebas: Prueba[] = [
		{
			codigo_pru: 1,
			fecha_inicio_pru: '2021-10-10',
			fecha_fin_pru: '2021-12-10',
			fk_tipo_prueba: Math.floor(Math.random() * 10001),
			fk_equipo_personal: Math.floor(Math.random() * 10001),
			fk_equipo_personal2: Math.floor(Math.random() * 10001),
			fk_zona: Math.floor(Math.random() * 10001),
			fk_zona2: Math.floor(Math.random() * 10001),
			fk_estatus: Math.floor(Math.random() * 10001),
			fk_lote_materia_prima: Math.floor(Math.random() * 10001),
			fk_pieza: Math.floor(Math.random() * 10001),
			fk_pieza2: Math.floor(Math.random() * 10001),
			fk_avion: Math.floor(Math.random() * 10001)
		},
		{
			codigo_pru: 2,
			fecha_inicio_pru: '2024-10-12',
			fecha_fin_pru: '2025-12-01',
			fk_tipo_prueba: Math.floor(Math.random() * 10001),
			fk_equipo_personal: Math.floor(Math.random() * 10001),
			fk_equipo_personal2: Math.floor(Math.random() * 10001),
			fk_zona: Math.floor(Math.random() * 10001),
			fk_zona2: Math.floor(Math.random() * 10001),
			fk_estatus: Math.floor(Math.random() * 10001),
			fk_lote_materia_prima: Math.floor(Math.random() * 10001),
			fk_pieza: Math.floor(Math.random() * 10001),
			fk_pieza2: Math.floor(Math.random() * 10001),
			fk_avion: Math.floor(Math.random() * 10001)
		},
		{
			codigo_pru: 3,
			fecha_inicio_pru: '2022-10-10',
			fecha_fin_pru: '2024-31-10',
			fk_tipo_prueba: Math.floor(Math.random() * 10001),
			fk_equipo_personal: Math.floor(Math.random() * 10001),
			fk_equipo_personal2: Math.floor(Math.random() * 10001),
			fk_zona: Math.floor(Math.random() * 10001),
			fk_zona2: Math.floor(Math.random() * 10001),
			fk_estatus: Math.floor(Math.random() * 10001),
			fk_lote_materia_prima: Math.floor(Math.random() * 10001),
			fk_pieza: Math.floor(Math.random() * 10001),
			fk_pieza2: Math.floor(Math.random() * 10001),
			fk_avion: Math.floor(Math.random() * 10001)
		}
	];

	async function generarReporte(pruebas: Prueba[]) {
		//logica para
	}

	/*ESTA COMENTADO POR QUE NO SE HA IMPLEMENTADO Y ARROJA ERROR CON LA BD
	async function mostrarDatos() {
		const response = await fetch('http://localhost:4000/piezas');
		const data: Pieza[] = await response.json();
		piezas = data;
	}

	mostrarDatos();
	//
	// Función para editar un registro
	async function editarRegistro(piezas: Pieza) {
		try {
			const res = await fetch(`http://localhost:4000/Pieza/${piezas.id_mineral}`, {
				method: 'PUT',
				body: JSON.stringify(piezas),
				headers: { 'Content-Type': 'application/json' }
			});

			if (res.ok) {
				// Si la solicitud fue exitosa, redirige al usuario
			} else {
				console.error('Error al actualizar el Pieza:', res.status);
				// Maneja el error (por ejemplo, muestra un mensaje de error al usuario)
			}
		} catch (error) {
			console.error('Error en la solicitud:', error);
			// Maneja el error (por ejemplo, muestra un mensaje de error al usuario)
		}
	}

	// Función para eliminar un registro
	async function eliminarRegistro(piezas: Pieza) {
		await fetch(`http://localhost:4000/Pieza/${piezas.id_pieza}`, {
			method: 'DELETE'
		});
	}*/
</script>

<h2>Pruebas Piezas</h2>
<table>
	<thead>
		<tr>
			<th>Nombre Prueba</th>
			<th>Aeronave A Probar</th>
			<th>Estatus</th>
			<th>Fecha Inicio y Final (estimado)</th>
			<th>Fecha Inicio y Final (real)</th>
			<th>Encargados</th>
		</tr>
	</thead>
	<tbody>
		{#each pruebas as dato}
			<tr>
				 <td><a href={`/admin/HomeAdmin/editar/Materia_Prima/${dato.codigo_pru}`}>
						FK_tipo_prueba:{dato.fk_tipo_prueba}
					</a>			</td>
				<td>FK_pieza:{dato.fk_pieza}</td>
				<td>FK_estatus:{dato.fk_estatus}</td>
				<td>Inicio:{dato.fecha_fin_pru} Fin:{dato.fecha_fin_pru}</td>
				<td>Inicio:{dato.fecha_fin_pru} Fin:{dato.fecha_fin_pru}</td>
				<td><a href={`/admin/HomeAdmin/editar/Materia_Prima/${dato.codigo_pru}`}>
					Ver encargados
								</a></td>
				<td>
					<div class="botonesUD">
						<!--ESTA COMENTADA PORQUE NO SE HA CREADO LA RUTA PARA EDITAR Y ELIMINAR
						<a href="/admin/HomeAdmin/editar/Pieza">
							<button on:click={() => editarRegistro(dato)}>
								<span>✏️</span>
							</button>
						</a>
						<button on:click={() => eliminarRegistro(dato)}>
							<span>🗑️</span>
						</button>-->
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

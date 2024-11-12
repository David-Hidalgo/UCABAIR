<script lang="ts">
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
	interface Pieza {
		id_pieza: number;
		nombre_pie:string;
		tipo_pieza: string;
		
	}

	export let piezas: Pieza[] = [];

	async function generarReporte(piezas: Pieza[]) {
		//logica para
	}

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
		await fetch(`http://localhost:4000/Pieza/${piezas.id_mineral}`, {
			method: 'DELETE'
		});
	}
</script>

<h2>piezas</h2>
<table>
	<thead>
		<tr>
			<th>Pieza</th>
			<th>Tipo de Pieza</th>
			<th>Utilizacion</th>
			<th>Dureza</th>
			<th>Maleabilidad</th>
			<th>Peso</th>
		</tr>
	</thead>
	<tbody>
		{#each piezas as dato}
			<tr>
				<td>{dato.mi_nombre}</td>
				<td>{dato.mi_tipo}</td>
				<td>{dato.mi_utilizacion}</td>
				<td>{dato.mi_dureza}</td>
				<td>{dato.mi_maleabilidad}</td>
				<td>{dato.mi_peso}</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/editar/Pieza">
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
<a href="/admin/HomeAdmin/registrar/Pieza">
	<button>Registrar Pieza</button>
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

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
	let opcionSeleccionada = 'Mineral';
	// Define una interfaz para el tipo de datos que contiene 'datos'
	interface Materia_Prima {
		id_mp: number;
		nombre_mp: string;
		tipo_mp: string;
		unidad_medida_mp: string;
		cantidad_mp: number;
	}

	export let materia_prima: Materia_Prima[] = [];

	async function generarReporte(materia_prima: Materia_Prima[]) {
		//logica para
	}

	async function mostrarDatos() {
		const response = await fetch('http://localhost:4000/materia_prima');
		const data: Materia_Prima[] = await response.json();
		materia_prima = data;
	}

	mostrarDatos();
	//
	// Función para editar un registro
	async function editarRegistro(materia_prima: Materia_Prima) {
		try {
			const res = await fetch(`http://localhost:4000/Materia_Prima/${materia_prima.id_mp}`, {
				method: 'PUT',
				body: JSON.stringify(materia_prima),
				headers: { 'Content-Type': 'application/json' }
			});

			if (res.ok) {
				// Si la solicitud fue exitosa, redirige al usuario
			} else {
				console.error('Error al actualizar el Materia_Prima:', res.status);
				// Maneja el error (por ejemplo, muestra un mensaje de error al usuario)
			}
		} catch (error) {
			console.error('Error en la solicitud:', error);
			// Maneja el error (por ejemplo, muestra un mensaje de error al usuario)
		}
	}

	// Función para eliminar un registro
	async function eliminarRegistro(materia_prima: Materia_Prima) {
		await fetch(`http://localhost:4000/Materia_Prima/${materia_prima.id_mp}`, {
			method: 'DELETE'
		});
	}
</script>

<h2>Materia Prima</h2>
<table>
	<thead>
		<tr>
			<th>Nombre</th>
			<th>Tipo</th>
			<th>Unidad de medida</th>
			<th>Cantidad</th>
		</tr>
	</thead>
	<tbody>
		{#each materia_prima as dato}
			<tr>
				<td>{dato.nombre_mp}</td>
				<td>{dato.tipo_mp}</td>
				<td>{dato.unidad_medida_mp}</td>
				<td>{dato.cantidad_mp}</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/editar/Materia_Prima">
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
<a href="/admin/HomeAdmin/registrar/Materia_Prima">
	<button>Registrar Materia_Prima</button>
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

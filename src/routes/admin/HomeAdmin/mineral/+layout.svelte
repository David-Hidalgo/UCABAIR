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
	interface Mineral {
		id_mineral: number;
		mi_nombre: string;
		mi_tipo: string; // Valor predeterminado
		mi_utilizacion: string;
		mi_dureza: string;
		mi_maleabilidad: string;
		mi_peso: string;
	}

	export let minerales: Mineral[] = [];

	async function generarReporte(minerales: Mineral[]) {
		//logica para
	}

	async function mostrarDatos() {
		const response = await fetch('http://localhost:4000/minerales');
		const data: Mineral[] = await response.json();
		minerales = data;
	}

	mostrarDatos();
	//
	// Función para editar un registro
	async function editarRegistro(minerales: Mineral) {
		try {
			const res = await fetch(`http://localhost:4000/mineral/${minerales.id_mineral}`, {
				method: 'PUT',
				body: JSON.stringify(minerales),
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
	async function eliminarRegistro(minerales: Mineral) {
		await fetch(`http://localhost:4000/mineral/${minerales.id_mineral}`, {
			method: 'DELETE'
		});
	}
</script>

<h2>Minerales</h2>
<table>
	<thead>
		<tr>
			<th>Mineral</th>
			<th>Tipo de mineral</th>
			<th>Utilizacion</th>
			<th>Dureza</th>
			<th>Maleabilidad</th>
			<th>Peso</th>
		</tr>
	</thead>
	<tbody>
		{#each minerales as dato}
			<tr>
				<td>{dato.mi_nombre}</td>
				<td>{dato.mi_tipo}</td>
				<td>{dato.mi_utilizacion}</td>
				<td>{dato.mi_dureza}</td>
				<td>{dato.mi_maleabilidad}</td>
				<td>{dato.mi_peso}</td>
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

<script lang="ts">
	import { goto } from '$app/navigation';
	import type { Ensamblaje_avion } from '$lib/server/db/schema';
	import type { PageData } from './$types';
	let searchTerm = '';
	const fecha = new Date();
	const fecha_fin_ens = new Date();

	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let opcionSeleccionada = 'nombre_o_denominacions';
	// Define una interfaz para el tipo de datos que contiene 'datos'

	// Ahora declara 'datos' con el tipo explícito 'Dato[]'
	let { data }: { data: PageData } = $props();
	let ensamblajes: Ensamblaje_avion[] = data.ensamblajes;

	function editarRegistro(index: number) {
		// Lógica para editar el registro en 'datos'
		goto(`/admin/HomeAdmin/editar/proyecto/${index}`);
		console.log(`Editando registro en índice ${index}`);
	}

	// Función para eliminar un registro
	function eliminarRegistro(index: number) {
		// Lógica para eliminar el registro en 'datos'
		console.log(`Eliminando registro en índice ${index}`);
	}
</script>

<h2>Ensamblajes</h2>
<table>
	<thead>
		<tr>
			<th>Modelo de avion a ensamblar</th>
			<th>Cliente</th>
			<th>Fecha Inicio</th>
			<th>Fecha Fin (Estimada)</th>
			<th>Estatus</th>
		</tr>
	</thead>
	<tbody>
		{#each ensamblajes as ensamblaje, i}
			<tr>
				<td>{ensamblaje.nombre_ma}</td>
				<td>{ensamblaje.nombre_o_denominacion}</td>
				<td>{ensamblaje.fecha_inicio_ens}</td>
				<td>{ensamblaje.fecha_fin_ens}</td>
				<td>{ensamblaje.nombre_est}</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/ensamblajes/{ensamblaje.codigo_avi}">
							<button>Ver Piezas</button>
						</a>
					</div>
				</td>
			</tr>
		{/each}
	</tbody>
</table>
<a href="/admin/HomeAdmin/registrar/proyecto">
	<button>Iniciar Nuevo Ensamblaje</button>
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

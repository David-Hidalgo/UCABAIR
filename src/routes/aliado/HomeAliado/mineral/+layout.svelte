<script lang="ts">
	import navigate from 'svelte-spa-router';
	import { createEventDispatcher } from 'svelte';
	import RegistrarMineral from '$lib/components/registrarMineral.svelte';

	const dispatch = createEventDispatcher();
	let i = 0;
	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}

	const fecha = new Date();
	// Interfaz para representar un dato
	interface Solicitud_Mineral {
		mineral: string;
		cantidad_a_solicitar: string;
		fecha_solicitud: Date;
		fecha_entrega: Date;
		status: string;
	}

	export let solicitudes: Solicitud_Mineral[] = [
		{
			mineral: 'Hierro',
			cantidad_a_solicitar: '1000',
			fecha_solicitud: fecha,
			fecha_entrega: fecha,
			status: 'Pendiente'
		},
		{
			mineral: 'Cobre',
			cantidad_a_solicitar: '500',
			fecha_solicitud: fecha,
			fecha_entrega: fecha,
			status: 'Pendiente'
		},
		{
			mineral: 'Oro',
			cantidad_a_solicitar: '200',
			fecha_solicitud: fecha,
			fecha_entrega: fecha,
			status: 'Pendiente'
		}
	];

	function aprobarSolicitud(index: number) {}

	function rechazarSolicitud(index: number) {
		// Lógica para editar el registro en 'datos'
		console.log(`Editando registro en índice ${index}`);
	}

	async function mostrarDatos() {
		const response = await fetch('http://localhost:4000/minerales');
		const data: Solicitud_Mineral[] = await response.json();
		solicitudes = data;
	}

	mostrarDatos();
</script>

<h2>Minerales</h2>
<table>
	<thead>
		<tr>
			<th>Mineral</th>
			<th>Cantidad a solicitar</th>
			<th>Fecha de solicitud</th>
			<th>Fecha de entrega</th>
			<th>Estatus</th>
		</tr>
	</thead>
	<tbody>
		{#each solicitudes as solicitud}
			<tr>
				<td>{solicitud.mineral}</td>
				<td>{solicitud.cantidad_a_solicitar}</td>
				<td>{solicitud.fecha_solicitud}</td>
				<td>{solicitud.fecha_entrega}</td>
				<td>{solicitud.status}</td>
				<td>
					<div class="botonesUD">
						<a href="/aliado/HomeAliado/mineral">
							<button on:click={() => aprobarSolicitud(i)}>
								<span>Aprobar</span>
							</button>
						</a>
						<button on:click={() => rechazarSolicitud(i)}>
							<span>Rechazar</span>
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

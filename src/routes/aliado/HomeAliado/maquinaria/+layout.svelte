<script lang="ts">
	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let opcionSeleccionada = 'Maquinaria';
	// Define una interfaz para el tipo de datos que contiene 'datos'
	interface Solicitud_Maquinaria {
		tipo_maquinaria: string;
		marca: string;
		modelo: string;
		cantidad_maquinas: number;
		status: string;
	}

	// Ahora declara 'datos' con el tipo explícito 'Dato[]'
	let solicitudes: Solicitud_Maquinaria[] = [
		{
			tipo_maquinaria: 'Cargadora',
			marca: 'Caterpillar',
			modelo: '345',
			cantidad_maquinas: 2,
			status: 'pendiente'
		},
		{
			tipo_maquinaria: 'Excavadora',
			marca: 'Komatsu',
			modelo: 'PC200',
			cantidad_maquinas: 1,
			status: 'pendiente'
		},
		{
			tipo_maquinaria: 'Retroexcavadora',
			marca: 'JCB',
			modelo: '3CX',
			cantidad_maquinas: 3,
			status: 'pendiente'
		}
		// Agrega más registros según tus necesidades
	];

	function aprobarSolicitud(index: number) {}

	function rechazarSolicitud(index: number) {
		// Lógica para editar el registro en 'datos'
		console.log(`Editando registro en índice ${index}`);
	}
</script>

<h2>Solicitudes de Maquinaria</h2>
<table>
	<thead>
		<tr>
			<th>Tipo de Maquinaria</th>
			<th>Marca</th>
			<th>Modelo</th>
			<th>Cantidad de Maquinas</th>
			<th>Status</th>
		</tr>
	</thead>
	<tbody>
		{#each solicitudes as solicitud, i}
			<tr>
				<td>{solicitud.tipo_maquinaria}</td>
				<td>{solicitud.marca}</td>
				<td>{solicitud.modelo}</td>
				<td>{solicitud.cantidad_maquinas}</td>
				<td>{solicitud.status}</td>
				<td>
					<div class="botonesUD">
						<a href="/aliado/HomeAliado/empleado">
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

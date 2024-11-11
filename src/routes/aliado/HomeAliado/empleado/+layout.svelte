<script lang="ts">
	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let opcionSeleccionada = 'Empleados';
	// Define una interfaz para el tipo de datos que contiene 'datos'
	interface Solicitud_Empleado {
		area_trabajo: string;
		sueldo: string;
		especialidad: string;
		rol: string;
		cantidad_empleados: number;
		status: string;
	}

	// Ahora declara 'datos' con el tipo explícito 'Dato[]'
	let solicitudes: Solicitud_Empleado[] = [
		{
			area_trabajo: 'Ingeniería',
			sueldo: '2500$',
			especialidad: 'Desarrollo de Software',
			rol: 'empleado',
			cantidad_empleados: 5,
			status: 'Pendiente'
		},
		{
			area_trabajo: 'Finanzas',
			sueldo: '3000$',
			especialidad: 'Análisis de datos',
			rol: 'empleado',
			cantidad_empleados: 3,
			status: 'Pendiente'
		},
		{
			area_trabajo: 'Marketing',
			sueldo: '2000$',
			especialidad: 'Publicidad',
			rol: 'empleado',
			cantidad_empleados: 4,
			status: 'Pendiente'
		}
	];

	function aprobarSolicitud(index: number) {
		// Lógica para
	}

	function rechazarSolicitud(index: number) {
		// Lógica para editar el registro en 'datos'
		console.log(`Editando registro en índice ${index}`);
	}
</script>

<h2>Solicitudes de Empleados</h2>
<table>
	<thead>
		<tr>
			<th>Area de Trabajo</th>
			<th>Sueldo</th>
			<th>Especialidad</th>
			<th>Rol</th>
			<th>Cantidad de Empleados</th>
			<th>Status</th>
		</tr>
	</thead>
	<tbody>
		{#each solicitudes as solicitud, i}
			<tr>
				<td>{solicitud.area_trabajo}</td>
				<td>{solicitud.sueldo}</td>
				<td>{solicitud.especialidad}</td>
				<td>{solicitud.rol}</td>
				<td>{solicitud.cantidad_empleados}</td>
				<td>{solicitud.status}</td>
				<td
					><div class="botonesUD">
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

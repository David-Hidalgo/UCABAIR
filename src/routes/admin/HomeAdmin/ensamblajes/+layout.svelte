<script lang="ts">
	import { goto } from '$app/navigation';
	let searchTerm = '';
	const fecha = new Date();
	const fecha_fin_estimada = new Date();

	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let opcionSeleccionada = 'Clientes';
	// Define una interfaz para el tipo de datos que contiene 'datos'
	interface Ensamblaje {
		modelo: string;
		cliente: string; //se puede obtener de otra tabla
		costo: string;
		fecha_inicial: string;
		fecha_fin_estimada: string;
		estatus: string;
	}
	let min = 0;
	let max = 100000;

	function getRandomNumber(min: number, max: number) {
		return Math.floor(Math.random() * (max - min + 1)) + min;
	}

	let numeroAleatorio = getRandomNumber(1, 100);

	// Ahora declara 'datos' con el tipo explícito 'Dato[]'
	let ensamblajes: Ensamblaje[] = [
		{
			modelo: 'Boeing 737',
			cliente: 'Aerolíneas XYZ',
			costo: '$90,000,000',
			fecha_inicial: fecha.toLocaleDateString(),
			fecha_fin_estimada: duracionRandom().toLocaleDateString(),
			estatus: 'En Progreso'
		},
		{
			modelo: 'Airbus A320',
			cliente: 'Vuelo Seguro',
			costo: '$98,000,000',
			fecha_inicial: fecha.toLocaleDateString(),
			fecha_fin_estimada: duracionRandom().toLocaleDateString(),
			estatus: 'En Progreso'
		},
		{
			modelo: 'Embraer E190',
			cliente: 'AeroVenezuela',
			costo: '$50,000,000',
			fecha_inicial: fecha.toLocaleDateString(),
			fecha_fin_estimada: duracionRandom().toLocaleDateString(),
			estatus: 'En Progreso'
		},
		{
			modelo: 'Bombardier CRJ900',
			cliente: 'Regional Air',
			costo: '$45,000,000',
			fecha_inicial: fecha.toLocaleDateString(),
			fecha_fin_estimada: duracionRandom().toLocaleDateString(),
			estatus: 'En Progreso'
		}
		// Tus datos aquí
	];

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

	function duracionRandom() {
		fecha_fin_estimada.setFullYear(fecha_fin_estimada.getFullYear() + getRandomNumber(0, 1));
		fecha_fin_estimada.setMonth(fecha_fin_estimada.getMonth() + getRandomNumber(0, 12));
		fecha_fin_estimada.setDate(fecha_fin_estimada.getDate() + getRandomNumber(0, 30));
		return fecha_fin_estimada;
	}

	async function generarReporte(ensamblajes: Ensamblaje[]) {
		//logica para  ()
	}
</script>

<h2>Ensamblajes</h2>
<table>
	<thead>
		<tr>
			<th>Modelo</th>
			<th>Cliente</th>
			<th>Costo</th>
			<th>Fecha Inicial</th>
			<th>Fecha Fin Estimada</th>
			<th>Estatus</th>
		</tr>
	</thead>
	<tbody>
		{#each ensamblajes as ensamblaje, i}
			<tr>
				<td>{ensamblaje.modelo}</td>
				<td>{ensamblaje.cliente}</td>
				<td>{ensamblaje.costo}</td>
				<td>{ensamblaje.fecha_inicial}</td>
				<td>{ensamblaje.fecha_fin_estimada}</td>
				<td>{ensamblaje.estatus}</td>
				<td>
					<div class="botonesUD">
						<button on:click={() => editarRegistro(i)}>
							<span>✏️</span>
							<!-- Icono de lápiz -->
						</button>
						<button on:click={() => eliminarRegistro(i)}>
							<span>🗑️</span>
							<!-- Icono de papelera -->
						</button>
						<a href="/admin/HomeAdmin/etapas">
							<button>Ver estatus</button>
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

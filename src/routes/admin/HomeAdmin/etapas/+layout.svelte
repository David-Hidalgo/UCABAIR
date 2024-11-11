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
	interface Etapa {
		pieza: string;
		lugar_ensamblaje: string;
		fecha_inicio: string;
		fecha_fin_estimada: string;
		status: string;
	}

	let min = 0;
	let max = 100000;

	function getRandomNumber(min: number, max: number) {
		return Math.floor(Math.random() * (max - min + 1)) + min;
	}

	let numeroAleatorio = getRandomNumber(1, 100);

	// Ahora declara 'datos' con el tipo explícito 'Dato[]'
	let etapas: Etapa[] = [
		{
			pieza: 'Ala',
			lugar_ensamblaje: 'Hangar 1',
			fecha_inicio: fecha.toLocaleDateString(),
			fecha_fin_estimada: duracionRandom().toLocaleDateString(),
			status: 'En Progreso'
		},
		{
			pieza: 'Fuselaje',
			lugar_ensamblaje: 'Hangar 2',
			fecha_inicio: fecha.toLocaleDateString(),
			fecha_fin_estimada: duracionRandom().toLocaleDateString(),
			status: 'En Progreso'
		},
		{
			pieza: 'Cola',
			lugar_ensamblaje: 'Hangar 3',
			fecha_inicio: fecha.toLocaleDateString(),
			fecha_fin_estimada: duracionRandom().toLocaleDateString(),
			status: 'En Progreso'
		},
		{
			pieza: 'Motor',
			lugar_ensamblaje: 'Hangar 4',
			fecha_inicio: fecha.toLocaleDateString(),
			fecha_fin_estimada: duracionRandom().toLocaleDateString(),
			status: 'En Progreso'
		}
		// Tus datos aquí
	];

	function editarRegistro(index: number) {
		// Lógica para editar el registro en 'datos'
		console.log(`Editando registro en índice ${index}`);
		goto(`/admin/HomeAdmin/editar/etapa/${index}`);
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

	function obtenerActividades(index: number) {
		// Lógica para eliminar el registro en 'datos'
		console.log(`Eliminando registro en índice ${index}`);
		//goto(`/admin/HomeAdmin/actividades/${index}`);
		goto(`/admin/HomeAdmin/actividades/`);
	}

	let random = getRandomNumber(0, etapas.length - 1);
	console.log(etapas.length);
	console.log(random);
</script>

<h2>Etapas</h2>
<h2>Ensamblaje {etapas[random].pieza}</h2>
<table>
	<thead>
		<tr>
			<th>Pieza</th>
			<th>Lugar de Ensamblaje</th>
			<th>Fecha de Inicio</th>
			<th>Fecha Fin Estimada</th>
			<th>Status</th>
		</tr>
	</thead>
	<tbody>
		{#each etapas as etapa, i}
			<tr>
				<td>{etapa.pieza}</td>
				<td>{etapa.lugar_ensamblaje}</td>
				<td>{etapa.fecha_inicio}</td>
				<td>{etapa.fecha_fin_estimada}</td>
				<td>{etapa.status}</td>
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
						<button on:click={() => obtenerActividades(i)}>Ver Actividades</button>
					</div>
				</td>
			</tr>
		{/each}
	</tbody>
</table>
<a href="/admin/HomeAdmin/registrar/proyecto/configuracionProyecto/configurarEtapa">
	<button>Registrar Etapa</button>
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

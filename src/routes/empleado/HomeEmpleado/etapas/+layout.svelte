<script lang="ts">
	let searchTerm = '';
	const fecha = new Date();
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let opcionSeleccionada = 'Clientes';
	// Define una interfaz para el tipo de datos que contiene 'datos'
	interface Etapa {
		nombre_etapa: string;
		costo: string;
		fecha_inicio: string;
		fecha_fin_estimada: string;
		cant_actividades: number;
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
			nombre_etapa: 'Análisis',
			costo: '$' + getRandomNumber(min, max),
			fecha_inicio: fecha.toLocaleDateString(),
			fecha_fin_estimada: fecha.toLocaleDateString(),
			cant_actividades: getRandomNumber(1, 10)
		},
		{
			nombre_etapa: 'Diseño',
			costo: '$' + getRandomNumber(min, max),
			fecha_inicio: fecha.toLocaleDateString(),
			fecha_fin_estimada: fecha.toLocaleDateString(),
			cant_actividades: getRandomNumber(1, 10)
		},
		{
			nombre_etapa: 'Desarrollo',
			costo: '$' + getRandomNumber(min, max),
			fecha_inicio: fecha.toLocaleDateString(),
			fecha_fin_estimada: fecha.toLocaleDateString(),
			cant_actividades: getRandomNumber(1, 10)
		}
		// Tus datos aquí
	];
</script>

<h2>Etapas</h2>
<table>
	<thead>
		<tr>
			<th>Etapa</th>
			<th>Costo</th>
			<th>Fecha Inicio</th>
			<th>Fecha Fin Estimada</th>
			<th>cant_actividades</th>
		</tr>
	</thead>
	<tbody>
		{#each etapas as etapa, i}
			<tr>
				<td>{etapa.nombre_etapa}</td>
				<td>{etapa.costo}</td>
				<td>{etapa.fecha_inicio}</td>
				<td>{etapa.fecha_fin_estimada}</td>
				<td>{etapa.cant_actividades}</td>
				<td>
					<div class="botonesUD">
						<a href="/empleado/HomeEmpleado/actividades">
							<button>Ver Actividades</button>
						</a>
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

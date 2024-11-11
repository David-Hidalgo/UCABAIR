<script lang="ts">
	let searchTerm = '';
	const fecha = new Date();
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let opcionSeleccionada = 'Clientes';
	// Define una interfaz para el tipo de datos que contiene 'datos'

	interface Actividad {
		nombre_actividad: string;
		fecha_inicio: string;
		fecha_fin_estimada: string;
	}

	let min = 0;
	let max = 100000;

	function getRandomNumber(min: number, max: number) {
		return Math.floor(Math.random() * (max - min + 1)) + min;
	}

	let numeroAleatorio = getRandomNumber(1, 100);

	let actividades: Actividad[] = [
		{
			nombre_actividad: 'Actividad 1',
			fecha_inicio: '2022-01-01',
			fecha_fin_estimada: '2022-01-15'
		},
		{
			nombre_actividad: 'Actividad 2',
			fecha_inicio: '2022-01-16',
			fecha_fin_estimada: '2022-01-30'
		},
		{
			nombre_actividad: 'Actividad 3',
			fecha_inicio: '2022-02-01',
			fecha_fin_estimada: '2022-02-15'
		}
		// Tus datos aquí
	];

	function editarRegistro(index: number) {
		// Lógica para editar el registro en 'datos'
		console.log(`Editando registro en índice ${index}`);
	}

	// Función para eliminar un registro
	function eliminarRegistro(index: number) {
		// Lógica para eliminar el registro en 'datos'
		console.log(`Eliminando registro en índice ${index}`);
	}
</script>

<table>
	<thead>
		<tr>
			<th>Nombre Actividad</th>
			<th>Fecha Inicio</th>
			<th>Fecha Fin Estimada</th>
		</tr>
	</thead>
	<tbody>
		{#each actividades as actividad, i}
			<tr>
				<td>{actividad.nombre_actividad}</td>
				<td>{actividad.fecha_inicio}</td>
				<td>{actividad.fecha_fin_estimada}</td>
				<div class="botonesUD">
					<a href="/empleado/HomeEmpleado/recursos">
						<button>Ver Recursos</button>
					</a>
				</div>
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

<script lang="ts">
	let searchTerm = '';
	const fecha = new Date();
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let opcionSeleccionada = 'Clientes';
	// Define una interfaz para el tipo de datos que contiene 'datos'
	interface Horario {
		dia_semana: string;
		hora_entrada: string;
		hora_salida: string;
	}

	let min = 0;
	let max = 100000;

	function getRandomNumber(min: number, max: number) {
		return Math.floor(Math.random() * (max - min + 1)) + min;
	}

	let numeroAleatorio = getRandomNumber(1, 100);

	// Ahora declara 'datos' con el tipo explícito 'Dato[]'
	let horarios: Horario[] = [
		{
			dia_semana: 'Lunes',
			hora_entrada: fecha.toLocaleDateString(),
			hora_salida: fecha.toLocaleDateString()
		},
		{
			dia_semana: 'Martes',
			hora_entrada: fecha.toLocaleDateString(),
			hora_salida: fecha.toLocaleDateString()
		},
		{
			dia_semana: 'Miércoles',
			hora_entrada: fecha.toLocaleDateString(),
			hora_salida: fecha.toLocaleDateString()
		},
		{
			dia_semana: 'Jueves',
			hora_entrada: fecha.toLocaleDateString(),
			hora_salida: fecha.toLocaleDateString()
		},
		{
			dia_semana: 'Viernes',
			hora_entrada: fecha.toLocaleDateString(),
			hora_salida: fecha.toLocaleDateString()
		} // Tus datos aquí
	];
</script>

<h2>Horario</h2>
<table>
	<thead>
		<tr>
			<th>Día de la semana</th>
			<th>Hora de entrada</th>
			<th>Hora de salida</th>
		</tr>
	</thead>
	<tbody>
		{#each horarios as horario, i}
			<tr>
				<td>{horario.dia_semana}</td>
				<td>{horario.hora_entrada}</td>
				<td>{horario.hora_salida}</td>
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

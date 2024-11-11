<script lang="ts">
	import { goto } from '$app/navigation';

	let searchTerm = '';
	const fecha = new Date();
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let opcionSeleccionada = 'Clientes';
	// Define una interfaz para el tipo de datos que contiene 'datos'

	interface Actividad {
		id_actividad_organizacion: String;
		id_etapa_organizacion: String;
		id_proyecto_organizacion: String;
		ac_or_descripcion: String;
		ac_or_costo_estimado: String;
		ac_or_duracion: String;
	}

	let min = 0;
	let max = 100000;

	function getRandomNumber(min: number, max: number) {
		return Math.floor(Math.random() * (max - min + 1)) + min;
	}

	let numeroAleatorio = getRandomNumber(1, 100);

	export let actividades: Actividad[] = [];

	async function mostrarDatos() {
		const response = await fetch('http://localhost:4000/actividades');
		const data: Actividad[] = await response.json();
		actividades = data;
	}

	mostrarDatos();
	function editarRegistro(index: number) {
		// Lógica para editar el registro en 'datos'
		console.log(`Editando registro en índice ${index}`);
		goto(`/admin/HomeAdmin/editar/actividad/${index}`);
	}

	// Función para eliminar un registro
	function eliminarRegistro(index: number) {
		// Lógica para eliminar el registro en 'datos'
		console.log(`Eliminando registro en índice ${index}`);
	}
</script>

<table>
	<thead>
		<h2>Actividades</h2>
		<tr>
			<th>Numero Actividad</th>
			<th>Numero Etapa</th>
			<th>Numero Proyecto</th>
			<th>Descripcion</th>
			<th>Costo estimado</th>
			<th>Duracion</th>
		</tr>
	</thead>
	<tbody>
		{#each actividades as actividad, i}
			<tr>
				<td>{actividad.id_actividad_organizacion}</td>
				<td>{actividad.id_etapa_organizacion}</td>
				<td>{actividad.id_proyecto_organizacion}</td>
				<td>{actividad.ac_or_descripcion}</td>
				<td>{actividad.ac_or_costo_estimado}</td>
				<td>{actividad.ac_or_duracion}</td>

				<div class="botonesUD">
					<button on:click={() => editarRegistro(i)}>
						<span>✏️</span>
						<!-- Icono de lápiz -->
					</button>
					<button on:click={() => eliminarRegistro(i)}>
						<span>🗑️</span>
						<!-- Icono de papelera -->
					</button>
					<a href="/admin/HomeAdmin/organizacion">
						<button>Ver Organizacion</button>
					</a>
				</div>
			</tr>
		{/each}
	</tbody>
</table>
<a
	href="/admin/HomeAdmin/registrar/proyecto/configuracionProyecto/configurarEtapa/configurarActividad"
>
	<button>Registrar Actividad</button>
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

<script lang="ts">
	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let opcionSeleccionada = 'Maquinaria';
	// Define una interfaz para el tipo de datos que contiene 'datos'
	interface Maquinaria {
		tipo_maquinaria: string;
		nombre: string;
		placa_identificacion: string;
		marca: string;
		modelo: string;
		estado: string[];
		fecha_adquisicion: Date;
		ubicacion: string;
		valor: string;
		comentario: string;
	}

	// Ahora declara 'datos' con el tipo explícito 'Dato[]'
	let datos: Maquinaria[] = [
		{
			tipo_maquinaria: 'Excavadora',
			nombre: 'CAT 320D',
			placa_identificacion: 'ABC123',
			marca: 'Caterpillar',
			modelo: '320D',
			estado: ['Operativa'],
			fecha_adquisicion: new Date('2022-05-15'),
			ubicacion: 'Obra de construcción',
			valor: 'USD 150,000',
			comentario: 'Buena condición general'
		},
		{
			tipo_maquinaria: 'Grúa',
			nombre: 'Liebherr LTM 1200-5.1',
			placa_identificacion: 'XYZ789',
			marca: 'Liebherr',
			modelo: 'LTM 1200-5.1',
			estado: ['En mantenimiento'],
			fecha_adquisicion: new Date('2021-10-01'),
			ubicacion: 'Depósito',
			valor: 'EUR 800,000',
			comentario: 'Necesita reparaciones'
		}
		// Agrega más registros según tus necesidades
	];

	function generarReporte() {
		// Lógica para
	}

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

<h2>Maquinaria</h2>
<table>
	<thead>
		<tr>
			<th>Tipo de Maquinaria</th>
			<th>Nombre</th>
			<th>Placa</th>
			<th>Marca</th>
			<th>Modelo</th>
			<th>Estado</th>
			<th>Fecha Adquisicion</th>
			<th>Ubicacion</th>
			<th>Valor</th>
			<th>Comentario</th>
		</tr>
	</thead>
	<tbody>
		{#each datos as dato, i}
			<tr>
				<td>{dato.tipo_maquinaria}</td>
				<td>{dato.nombre}</td>
				<td>{dato.placa_identificacion}</td>
				<td>{dato.marca}</td>
				<td>{dato.modelo}</td>
				<td>{dato.estado.join(', ')}</td>
				<td>{dato.fecha_adquisicion.toLocaleDateString()}</td>
				<td>{dato.ubicacion}</td>
				<td>{dato.valor}</td>
				<td>{dato.comentario}</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/editar/maquinaria">
							<button on:click={() => editarRegistro(i)}>
								<span>✏️</span>
								<!-- Icono de lápiz -->
							</button>
						</a>
						<button on:click={() => eliminarRegistro(i)}>
							<span>🗑️</span>
							<!-- Icono de papelera -->
						</button>
					</div>
				</td>
			</tr>
		{/each}
	</tbody>
</table>
<a href="/admin/HomeAdmin/registrar/maquinaria">
	<button>Registrar Maquinaria</button>
</a>
<a href="/admin/HomeAdmin/reponerInventario/solicitarMaquinaria">
	<button>Solicitar Maquinaria</button>
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

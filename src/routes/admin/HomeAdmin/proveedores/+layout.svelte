<script lang="ts">
	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	let opcionSeleccionada = 'Proveedor';
	interface Organizacion {
		id_organizacion: string;
		id_actividad_organizacion: String;
		id_etapa_organizacion: String;
		id_proyecto_organizacion: String;
		id_cargo: String;
		id_equipo: String;
		or_cantidad_equipo: String;
		or_cantidad_cargo: String;
		or_dias_trabajo_cargo: String;
	}

	let organizacion: Organizacion = {
		id_organizacion: '',
		id_actividad_organizacion: '',
		id_etapa_organizacion: '',
		id_proyecto_organizacion: '',
		id_cargo: '',
		id_equipo: '',
		or_cantidad_equipo: '',
		or_cantidad_cargo: '',
		or_dias_trabajo_cargo: ''
	};

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

<h2>Proveedores</h2>
<table>
	<thead>
		<tr>
			<th>Razon Social</th>
			<th>RIF</th>
			<th>Dirección Fiscal</th>
			<th>Teléfono</th>
			<th>Correo</th>
			<th>Capacidad Instalada</th>
		</tr>
	</thead>
	<tbody>
		{#each datos as dato, i}
			<tr>
				<td>{dato.razon_social}</td>
				<td>{dato.rif}</td>
				<td>{dato.direccion_fiscal}</td>
				<td>{dato.telefono}</td>
				<td>{dato.correo}</td>
				<td>{dato.capacidad_instalada}</td>
				<td>
					<div class="botonesUD">
						<a href="/admin/HomeAdmin/editar/proveedor">
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
<a href="/admin/HomeAdmin/registrar/proveedor">
	<button>Registrar Proveedor</button>
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

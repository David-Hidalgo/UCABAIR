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

<h2>Organizacion</h2>
<table>
	<thead>
		<tr>
			<th>ID Organización</th>
			<th>ID Cargo</th>
			<th>ID Equipo</th>
			<th>Cantidad Equipo</th>
			<th>Cantidad Cargo</th>
			<th>Días Trabajo Cargo</th>
		</tr>
	</thead>
	<!--       <tbody>
        {#each organizacion as dato, i}
          <tr>
            <td>{dato.id_organizacion}</td>
            <td>{dato.id_cargo}</td>
            <td>{dato.id_equipo}</td>
            <td>{dato.or_cantidad_equipo}</td>
            <td>{dato.or_cantidad_cargo}</td>
            <td>{dato.or_dias_trabajo_cargo}</td>
              <td>
                <div class="botonesUD">
                  <a href=/admin/HomeAdmin/editar/proveedor>
                      <button on:click={() => editarRegistro(i)}>
                        <span>✏️</span>
                      <-- </button>
                  </a>
                  <button on:click={() => eliminarRegistro(i)}>
                  </button>
                </div>
                </td>
          </tr>
        {/each}
      </tbody> -->
</table>
<a href="/admin/HomeAdmin/registrar/organizacion">
	<button>Registrar Organizacion</button>
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

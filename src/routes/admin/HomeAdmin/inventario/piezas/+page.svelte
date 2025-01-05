<script>
    import Combobox from "$lib/components/combobox.svelte";

    let sedes = [
        { value: 1, label: "Distrito Capital" },
        { value: 2, label: "Miranda" },
        { value: 3, label: "Vargas" },
        { value: 4, label: "Aragua" },
        { value: 5, label: "Carabobo" },
        { value: 6, label: "Lara" },
        { value: 7, label: "Yaracuy" },
        { value: 8, label: "Falcón" },
    ];

</script>


<div class="ComboboxSedes">
    <p>Selecciona una sede:</p>
    <Combobox options={sedes}/>
</div>
<h2>Inventario Piezas</h2>
	<slot/>
<table>
	<thead>
		<tr>
			<th>ID</th>
			<th>Pieza</th>
			<th>Tipo de Pieza</th>
			<th>Precio por unidad</th>
			<th>Cantidad</th>
		</tr>
	</thead>
	<tbody>
		{#each piezas as dato}
			<tr>
				<td><a href={`/admin/HomeAdmin/editar/Materia_Prima/${dato.id_pieza}`}>
						{dato.id_pieza}
					</a>			</td>
				<td>{dato.nombre_pie}</td>
				<td>{dato.tipo_pieza}</td>
				<td>{dato.precio_pieza}</td>
				<td>{dato.cantidad}</td>
				<td>
					<div class="botonesUD">
						<!--ESTA COMENTADA PORQUE NO SE HA CREADO LA RUTA PARA EDITAR Y ELIMINAR
						<a href="/admin/HomeAdmin/editar/Pieza">
							<button on:click={() => editarRegistro(dato)}>
								<span>✏️</span>
							</button>
						</a>
						<button on:click={() => eliminarRegistro(dato)}>
							<span>🗑️</span>
						</button>-->
					</div>
				</td>
			</tr>
		{/each}
	</tbody>
</table>
<a href="/admin/HomeAdmin/registrar/Pieza">
	<button>Registrar Pieza</button>
</a>
<a href="/admin/HomeAdmin/reponerInventario">
	<button>Iniciar Ensamblaje Pieza</button>
</a>
<a href="/admin/HomeAdmin/reponerInventario">
	<button>Solicitar Pieza a Sede</button>
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

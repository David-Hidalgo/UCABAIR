<script lang="ts">
	import { goto } from "$app/navigation";

	let searchTerm = '';
	function search() {
		// Lógica de búsqueda
		console.log(`Buscando: ${searchTerm}`);
	}
	export let codigo_com;
	interface Proveedor {
		codigo_com: number;
		rif_jur: string;
		denominacion_comercial_jur: string;
		razon_social_jur: string;
		pagina_web_jur: string;
		telefono_com: number[];
		correo_com: string[];
		direccion_com: string;
		monto_acreditado_com: number;
		fecha_inicio_operaciones_com: Date;
	}


	let proveedores: Proveedor[] = [{
		codigo_com: Math.floor(Math.random() * 1000),	
		rif_jur: "J-123456789",
		denominacion_comercial_jur: "Tablas S.A.",
		razon_social_jur: "Tablas C.A.",
		pagina_web_jur: " www.tablas.com",
		telefono_com: [ 1234567, 7654321],
		correo_com: ["latabla@hotmail,com","tablasca@hotmail.com" ],
		direccion_com: " Av. Los Tablones, Edif. Tablas, Piso 1, Ofic. 1",
		monto_acreditado_com: 1000000,
		fecha_inicio_operaciones_com: new Date()
	},
	{
		codigo_com: Math.floor(Math.random() * 1000),
		rif_jur: "J-987654321",
		denominacion_comercial_jur: "Sillas S.A.",
		razon_social_jur: "Sillas C.A.",
		pagina_web_jur: " www.sillas.com",
		telefono_com: [ 1234567, 7654321],
		correo_com: ["lasilla@hotmail,com"],
		direccion_com: " Av. Las Sillas, Edif. Sillas, Piso 1, Ofic. 1",
		monto_acreditado_com: 1000000,
		fecha_inicio_operaciones_com: new Date()
	}];

	async function generarReporte(proveedores: Proveedor[]) {
		//logica para
	}

	function editarRegistro(index: number) {
		// Lógica para editar el registro en 'datos'
		console.log(`Editando registro en índice ${index}`);
		goto(`/admin/HomeAdmin/editar/aliado/${index}`);
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
		</tr>
	</thead>
	<tbody>
		{#each proveedores as proveedor, i}
			<tr>
				<td>{proveedor.razon_social_jur}</td>	
				<td>{proveedor.rif_jur}</td>
				<td>{proveedor.direccion_com}</td>
				<td>{proveedor.telefono_com}</td>
				<td>{proveedor.correo_com}</td>
				<td>{proveedor.monto_acreditado_com}</td>
				<td>{proveedor.fecha_inicio_operaciones_com}</td>
				<td>
					<div class="botonesUD">
							<button on:click={() => editarRegistro(proveedor.codigo_com)}>
								<span>✏️</span>
								<!-- Icono de lápiz -->
							</button>
						<button on:click={() => eliminarRegistro(proveedor.codigo_com)}>
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

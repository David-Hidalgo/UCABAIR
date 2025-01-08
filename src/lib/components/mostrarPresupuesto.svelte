<script lang="ts">
	import type {
		Modelo_avion,
		Tipo_pieza,
		Tipo_prueba,
		Estimacion_profesion_empleado,
		Empleado_profesion,
		Configuracion_avion,
		Configuracion_prueba_avion,
		Profesion,
		Configuracion_def,
		Plan_ensamblaje
	} from '$lib/server/db/schema';
	let modelos_avion: Modelo_avion[] = new Array();
	export let tipo_pieza: any[];
	export let tipo_prueba: Tipo_prueba[];
	export let estimacion_profesion_empleado: Estimacion_profesion_empleado[];
	export let modelo_avion_entrante: Modelo_avion;
	export let configuracion_avion: Configuracion_avion[];
	export let configuracion_prueba_avion: Configuracion_prueba_avion[];
	export let profesion: any[];
	export let datos_ensamblaje: Plan_ensamblaje[];
	let modelo_avion: Modelo_avion = {
		codigo_ma: 0,
		nombre_ma: '',
		descripcion_ma: '',
		precio_unidad_ma: 0,
		fk_modelo_avion: 0
	};
	modelo_avion.codigo_ma = modelo_avion_entrante.codigo_ma;
	modelo_avion.nombre_ma = modelo_avion_entrante.nombre_ma;
	modelo_avion.descripcion_ma = modelo_avion_entrante.descripcion_ma;
	modelo_avion.precio_unidad_ma = modelo_avion_entrante.precio_unidad_ma;
	modelo_avion.fk_modelo_avion = modelo_avion_entrante.fk_modelo_avion;
</script>

<div class="presupuesto">
	<h1>Presupuesto de ensamblaje de {modelo_avion.nombre_ma}</h1>

	<!-- <h2>Datos de la empresa</h2>
	<p>Nombre: {empresa.nombre}</p>
	<p>RIF: {empresa.rif}</p>
	<p>Dirección: {empresa.direccion}</p>
	<p>Correo: {empresa.correo}</p>
	<p>Teléfono: {empresa.telefono}</p> -->

	<h2>Detalles del ensamblaje</h2>
	<table>
		<thead>
			<tr>
				<th>Descripcion</th>
				<th>Duracion</th>
			</tr>
		</thead>
		<tbody>
			{#each datos_ensamblaje as dato}
				<tr>
					<td>{dato.descripcion_pe}</td>
					<td>{dato.duracion_estimada_pe}</td>
				</tr>
			{/each}
		</tbody>
	</table>
	<h2>Cargos</h2>
	<table>
		<thead>
			<tr>
				<th>Personal Requerido</th> 
				<th>Cantidad de personal</th>
			</tr>
		</thead>
		<tbody>
			{#each profesion as profesionales}
				<tr>
					<td> {profesionales.nombre_pro}</td>
					<td> {profesionales.cantidad_empleado_epp}</td>
				</tr>
			{/each}
			
		</tbody>
	</table>
	
	<h2>Costos de elaboracion de piezas</h2>
	<table>
		<thead>
			<tr>
				<th>Pieza</th>
				<th>Precio unitario</th>
				<th>Cantidad de piezas</th>
				<th>Costo total de pieza</th>
				
			</tr>
		</thead>
		<tbody>
			{#each tipo_pieza as tPieza}
				<tr>
					<td>{tPieza.nombre_tp}</td>
					<td>{tPieza.precio_unidad_tp}</td>
					<td>{tPieza.cantidad_pieza_ca}</td>
					<td>{tPieza.precio_total}</td>
				</tr>
			{/each}
		</tbody>
		<tfoot>
			<tr>
				<td>Total</td>
				<td></td>
				<td></td>
				
				<td>{tipo_pieza.reduce((acc, curr) => acc + curr.precio_total, 0)}</td>
			</tr>
		</tfoot>
	</table>
	<!--<h2>Costos de materia prima</h2>
	<table>
		<thead>
			<tr>
				<th>A Ensamblar</th>
				<th>Material Necesario</th>
				<th>Cantidad</th>
				<th>Costo</th>
			</tr>
		</thead>
		<tbody>
			{#each materias_primas as materia_prima, i}
				<tr>
					<td>{materia_prima.pieza}</td>
					<td
						>{#each materia_prima.materiales as material, i}
							<tr>
								<td>{material.nombre}</td>
								<td>{material.cantidad}</td>
								<td>{material.costo}</td>
							</tr>
						{/each}
					</td>
					<td>{materia_prima.materiales.reduce((acc, curr) => acc + curr.costo, 0)}</td>
				</tr>
			{/each}
		</tbody>
	</table> -->
</div>

<style>
	.presupuesto {
		padding-left: 20px;
		border: 1px solid black;
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
		text-align: left;
		letter-spacing: -0.03em;
	}
	thead {
		background-color: white;
	}

	h2 {
		text-decoration: underline;
	}

	h1 {
		text-decoration: underline;
		text-align: center;
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

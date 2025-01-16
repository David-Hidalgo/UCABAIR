<script lang="ts">
	import type { PageData } from './$types';
	import MostrarPresupuesto from '$lib/components/mostrarPresupuesto.svelte';
	import type {Modelo_avion,Plan_ensamblaje,Profesion,Caracteristica,Caracteristica_modelo,
				Avion} from '$lib/server/db/schema';
	let { data }: { data: PageData } = $props();
	const modelo_avion: Modelo_avion = {
		codigo_ma: data.modelo_avion.codigo_ma,
		nombre_ma: data.modelo_avion.nombre_ma,
		descripcion_ma: data.modelo_avion.descripcion_ma,
		fk_modelo_avion: data.modelo_avion.fk_modelo_avion,
		precio_unidad_ma: data.modelo_avion.precio_unidad_ma
	};

	const planes_ensamblaje: Plan_ensamblaje[] = data.resultado.map((plan: any) => {
		return {
			codigo_pe: plan.codigo_pe,
			duracion_estimada_pe: plan.duracion_estimada_pe,
			descripcion_pe: plan.descripcion_pe
		};
	});
	const profesionales: any[] = data.profesion_table;

	const caracteristicas: Caracteristica[] = data.caracteristica_table;
	const caracteristicas_modelo: Caracteristica_modelo[] = data.caracteristica_modelo_table;
	import { writable } from 'svelte/store';
	const mostrarPresupuesto = writable(false);

	function togglePresupuesto() {
		mostrarPresupuesto.update((value) => !value);
	}

	let avion: Avion ={
		codigo_avi:0,
		color_avi:"",
		nombre_avi:"",
		matricula_avi:0,
		fk_modelo_avion:0,
		fk_venta:0,
		fk_almacen:0,
		fk_ensamblaje:0,
		fk_almacen2:0
	}
</script>

<div class="avion-details">
	<h1><strong>{modelo_avion.nombre_ma}</strong></h1>
	<p><strong>Descripción:</strong> {modelo_avion.descripcion_ma}</p>
	<p><strong>Modelo:</strong> {modelo_avion.fk_modelo_avion}</p>
	<p><strong>Nombre:</strong> {avion.nombre_avi}</p>
	<p><strong>Color:</strong></p>
	<select bind:value={avion.color_avi}>
		<option value="" disabled selected>Seleccione un color</option>
		<option value="Rojo">Rojo</option>
		<option value="Azul">Azul</option>
		<option value="Verde">Verde</option>
		<option value="Amarillo">Amarillo</option>
		<option value="Negro">Negro</option>
		<option value="Blanco">Blanco</option>
		<option value="Gris">Gris</option>
		<option value="Naranja">Naranja</option>
		<option value="Rosa">Rosa</option>
		<option value="Morado">Morado</option>
		<option value="Marrón">Marrón</option>
	</select>

	<p><strong>Precio por Unidad:</strong> {modelo_avion.precio_unidad_ma}</p>
	<h2><strong>Especificaciones:</strong></h2>
	<table>
		<thead>
			<tr>
				<th>Característica</th>
				<th>Valor</th>
				<th>Unidad de Medida</th>
			</tr>
		</thead>
		<tbody>
			{#each caracteristicas_modelo as caracteristica_modelo}
				{#each caracteristicas as caracteristica}
					{#if caracteristica.codigo_car == caracteristica_modelo.fk_caracteristica && caracteristica_modelo.fk_modelo_avion == modelo_avion.codigo_ma}
						<tr>
							<td>{caracteristica.nombre_car}</td>
							<td>{caracteristica_modelo.valor_cm}</td>
							<td>{caracteristica_modelo.unidad_medida_cm}</td>
						</tr>
					{/if}
				{/each}
			{/each} <!--Hola -->
		</tbody>
	</table>
</div>
<div class="botones">
	<button onclick={togglePresupuesto}>
		{#if $mostrarPresupuesto}
			Ocultar Presupuesto
		{:else}
			Mostrar Presupuesto
		{/if}
	</button>
	<a href="/cliente/pago/{modelo_avion.codigo_ma}">
		<button>Proceder al pago</button>
	</a>
</div>
{#if $mostrarPresupuesto}
	<div class="Presupuesto">
		<MostrarPresupuesto
			modelo_avion_entrante={modelo_avion}
			datos_ensamblaje={planes_ensamblaje}
			tipo_prueba={data.tp_table}
			tipo_pieza={data.p_table}
			configuracion_avion={data.ca_table}
			configuracion_prueba_avion={data.cpa_table}
			estimacion_profesion_empleado={data.epe_table}
			profesion={profesionales}
		/>
	</div>
{/if}

<style>
	.botones {
		display: flex;
		justify-content: space-between;
		margin: 20px;
	}
	.avion-details {
		margin: 20px;
		padding: 20px;
		border: 1px solid #ccc;
		border-radius: 5px;
		background-color: #f9f9f9;
	}
	.avion-details h2 {
		margin-bottom: 10px;
	}
	.avion-details p {
		margin: 5px 0;
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

	.Presupuesto {
		margin: 0 170px 0 170px;
	}
</style>

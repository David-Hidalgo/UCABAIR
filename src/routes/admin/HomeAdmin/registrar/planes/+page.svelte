<script lang="ts">
	import type { ActionData, PageData } from './$types';
	import { enhance } from '$app/forms';
	import { goto } from '$app/navigation';
	let { data, form }: { data: PageData; form: ActionData } = $props();
	let sedes = data.sedes ?? [];
	let sedeSeleccionada: number = $state(-1);
	let Piezas = data.piezas ?? [];
	let PiezasSeleccionadas: number = $state(-1);
	let plan_embalaje = data.plan_embalaje ?? [];
	let plan_embalaje_seleccionado: number = $state(-1);
	let plan_transporte = data.plan_transporte ?? [];
	let plan_transporte_seleccionado: number = $state(-1);
	let plan_prueba = data.tiposPruebas ?? [];
	let plan_prueba_seleccionada: number = $state(-1);
	let profesiones = data.profesiones ?? [];
	let profesiones_embalaje: [] = $state([]);
	let profesiones_transporte: [] = $state([]);
	let profesiones_tipos_pruebas: [] = $state([]);
	let cod_ma: number = data.cod_ma;

	let botonPresionado = $state('');

	function mostrarContenido(boton: string) {
		botonPresionado = boton;
	}
</script>

<h1>Configuracion del avion</h1>

<form method="POST" action="?/ConfiguracionAvion" use:enhance>
	<input type="hidden" name="cod_ma" value={cod_ma} />
	<div>
		<label>
			Piezas
			<select
				multiple
				name="fk_pieza"
				style="width: 300px; height: 350px;"
				bind:value={PiezasSeleccionadas}
			>
				{#each Piezas as pieza}
					<option value={pieza.codigo_tp}>{pieza.nombre_tp}</option>
				{/each}
			</select>
		</label>
		<label>
			Sede
			<select name="fk_sede" bind:value={sedeSeleccionada}>
				{#each sedes as sede}
					<option value={sede.codigo_sed}>{sede.nombre_sed}</option>
				{/each}
			</select>
		</label>
	</div>
	<button type="submit" onclick={async () => goto('/admin/HomeAdmin/inventario/aeronaves')}
		>Enviar</button
	>
</form>

<h2>Registrar Planes</h2>

<div>
	<button type="button" onclick={() => mostrarContenido('boton1')}>Embalaje</button>
	<button type="button" onclick={() => mostrarContenido('boton2')}>Transporte</button>
	<button type="button" onclick={() => mostrarContenido('boton3')}>Prueba</button>
</div>

{#if botonPresionado === 'boton1'}
	<!-- Contenido para el botón 1 -->
	<form method="POST" action="?/PlanEmbalaje" use:enhance>
		<input type="hidden" name="cod_ma" value={cod_ma} />
		<!-- {#if form?.incorrect}<p class="error">Invalid credentials!</p>{/if} -->
		<div>
			<label>
				Plan de Embalaje
				<select name="fk_plan_embalaje" bind:value={plan_embalaje_seleccionado}>
					{#each plan_embalaje as plan}
						<option value={plan.codigo_ep}>{plan.duracion_estimada_ep}</option>
					{/each}
				</select>
			</label>
			<label>
				Profesionales
				<select multiple name="fk_profesional_embalaje" bind:value={profesiones_embalaje}>
					{#each profesiones as profesion}
						<option value={profesion.codigo_pro}>{profesion.nombre_pro}</option>
					{/each}
				</select>
			</label>
			<label>
				Sede
				<select name="fk_sede">
					{#each sedes as sede}
						<option value={sede.codigo_sed}>{sede.nombre_sed}</option>
					{/each}
				</select>
			</label>
		</div>
		<button type="submit">Enviar</button>
	</form>
{/if}
{#if botonPresionado === 'boton2'}
	<!-- Contenido para el botón 2 -->
	<form method="POST" action="?/PlanTransporte" use:enhance>
		<input type="hidden" name="cod_ma" value={cod_ma} />
		<div>
			<label>
				Plan de Transporte
				<select name="fk_plan_transporte" bind:value={plan_transporte_seleccionado}>
					{#each plan_transporte as plan}
						<option value={plan.codigo_pt}>{plan.descripcion_pt}</option>
					{/each}
				</select>
			</label>
			<label>
				Profesionales
				<select multiple name="fk_profesional_transporte" bind:value={profesiones_transporte}>
					{#each profesiones as profesion}
						<option value={profesion.codigo_pro}>{profesion.nombre_pro}</option>
					{/each}
				</select>
			</label>
			<label>
				Sede
				<select name="fk_sede" bind:value={sedeSeleccionada}>
					{#each sedes as sede}
						<option value={sede.codigo_sed}>{sede.nombre_sed}</option>
					{/each}
				</select>
			</label>
		</div>
		<button type="submit">Enviar</button>
	</form>
{/if}
{#if botonPresionado === 'boton3'}
	<!-- Contenido para el botón 3 -->
	<form method="POST" action="?/PlanPrueba" use:enhance>
		<input type="hidden" name="cod_ma" value={cod_ma} />
		<div>
			<label>
				Plan de Prueba
				<select name="fk_plan_prueba" bind:value={plan_prueba_seleccionada}>
					{#each plan_prueba as plan}
						<option value={plan.codigo_tp}>{plan.nombre_tp}</option>
					{/each}
				</select>
			</label>
			<label>
				Profesionales
				<select multiple name="fk_profesional_prueba" bind:value={profesiones_tipos_pruebas}>
					{#each profesiones as profesion}
						<option value={profesion.codigo_pro}>{profesion.nombre_pro}</option>
					{/each}
				</select>
			</label>
			<label>
				Sede
				<select name="fk_sede" bind:value={sedeSeleccionada}>
					{#each sedes as sede}
						<option value={sede.codigo_sed}>{sede.nombre_sed}</option>
					{/each}
				</select>
			</label>
		</div>
		<button type="submit">Enviar</button>
	</form>
{/if}

<style>
	/* Estilos generales para el formulario */
	form {
		max-width: 100%;
		margin: 0 auto;
		padding: 20px;
		border: 1px solid #ccc;
		border-radius: 5px;
		background-color: #f9f9f9;
		display: flex;
		flex-direction: column;
	}

	/* Estilos para las etiquetas y campos de entrada */
	label {
		display: block;
		margin-bottom: 10px;
		font-weight: bold;
	}

	input {
		width: 40%;
		padding: 10px;
		margin-bottom: 15px;
		border: 1px solid #ccc;
		border-radius: 3px;
		font-size: 14px;
	}

	/* Estilos para el botón de envío */
	button {
		background-color: #050505;
		color: #fff;
		border: none;
		border-radius: 3px;
		padding: 10px 20px;
		cursor: pointer;
		font-size: 16px;
	}

	select {
		background-color: white;
		color: black;
		border: none;
		border-radius: 3px;
		border: solid black 1px;
		padding: 10px;
		cursor: pointer;
		font-size: 16px;
		width: 40%;
		margin-bottom: 15px;
	}
</style>

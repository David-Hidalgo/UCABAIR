<script lang="ts">
	import type { ActionData, PageData } from './$types';
	import { enhance } from '$app/forms';
	let { data, form }: { data: PageData; form: ActionData } = $props();
	let sedes = data.sedes ?? [];
	let sedeSeleccionada: any = $state(null);
	let Piezas = data.piezas ?? [];
	let PiezasSeleccionadas: any = $state(null);
	let plan_embalaje = data.plan_embalaje ?? [];
	let plan_embalaje_seleccionado: any = $state(null);
	let plan_transporte = data.plan_transporte ?? [];
	let plan_transporte_seleccionado: any = $state(null);
	let plan_prueba = data.tiposPruebas ?? [];
	let plan_prueba_seleccionada: any = $state(null);
	let profesiones = data.profesiones ?? [];
	let profesiones_embalaje: [] = $state([]);
	let profesiones_transporte: [] = $state([]);
	let profesiones_tipos_pruebas: [] = $state([]);
	let cod_ma = data.cod_ma;
</script>

<form method="POST" action="?/PlanAvion" use:enhance>
	{#if form?.incorrect}<p class="error">Invalid credentials!</p>{/if}
	<input type="hidden" name="cod_ma" value={cod_ma} />
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
	</div>
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
	</div>
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
	</div>
	<label>
		Sede
		<select name="fk_sede" bind:value={sedeSeleccionada}>
			{#each sedes as sede}
				<option value={sede.codigo_sed}>{sede.nombre_sed}</option>
			{/each}
		</select>
	</label>
	<label>
		Pieza
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
	<button type="submit">Enviar</button>
</form>

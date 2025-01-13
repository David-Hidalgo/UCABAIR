<script lang="ts">
	import { goto } from '$app/navigation';
	import { page } from '$app/stores';
	import Combobox from './combobox.svelte';
	// Interfaz para representar un dato

	interface Proyecto {
		codigo_ens: number;
		aeronave_ens: { value: number; label: string }[];
		fecha_inicio: string;
		fecha_fin_ens: string;
		fk_plan_ensamblaje: number;
		fk_pieza: number;
		fk_lote_materia_prima: number;
		fk_pieza2: number;
		fk_estatus: number;
		fk_equipo_personal: number;
		fk_equipo_personal2: number;
	}

	let proyecto: Proyecto = {
		codigo_ens: 0,
		aeronave_ens: [
			{ value: 1, label: 'Au-80' },
			{ value: 2, label: 'Au-747Plus' },
			{ value: 3, label: 'Au-802A' },
			{ value: 4, label: 'Au-747Gold' },
			{ value: 5, label: 'Au-802F' },
			{ value: 6, label: 'Au-747Platinum' },
			{ value: 7, label: 'Au-802B' }
		],
		fecha_inicio: '',
		fecha_fin_ens: '',
		fk_plan_ensamblaje: 0,
		fk_pieza: 0,
		fk_lote_materia_prima: 0,
		fk_pieza2: 0,
		fk_estatus: 0,
		fk_equipo_personal: 0,
		fk_equipo_personal2: 0
	};

	// Función para manejar el envío del formulario
	async function registrarDato() {
		console.log(proyecto);
		/*const res = await fetch(`/proyecto`, {
			method: 'POST',
			body: JSON.stringify(proyecto),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		console.log(data);*/
		alert('Se agregó exitosamente el proyecto');
		goto('/admin/HomeAdmin/registrar/proyecto/configuracionProyecto');
	}
</script>

<form on:submit|preventDefault={registrarDato}>
	<h2>Registrar Proyecto</h2>

	<label for="codigo_ens">Código de Ensamblaje (generado por sistema)</label>
	<input type="number" id="codigo_ens" bind:value={proyecto.codigo_ens} required />

	<label for="aeronave_ens">Seleccione el modelo que desea ensamblar:</label>
	<select id="aeronave_ens" bind:value={proyecto.fk_plan_ensamblaje}>
		{#each proyecto.aeronave_ens as aeronave}
			<option value={aeronave.value}>{aeronave.label}</option>
		{/each}
	</select>
	<button type="submit">Mostrar Presupuesto Ensamblaje</button>
</form>

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
</style>

<script lang="ts">
	import type { Tipo_prueba } from '$lib/server/db/schema';
	export let id_editar: Tipo_prueba | undefined;
	import { goto } from '$app/navigation';

	let tipo_prueba: Tipo_prueba;
	let codigo_viejo: number;
	if (id_editar != undefined) {
		tipo_prueba = id_editar;
		if (id_editar.codigo_tp) codigo_viejo = id_editar.codigo_tp;
	} else {
		tipo_prueba = {
			codigo_tp: undefined,
			nombre_tp: '',
			descripcion_tp: '',
			duracion_estimada_tp: ''
		};
	}
	async function decide() {
		if (id_editar == undefined) {
			registrarTipoPrueba();
		} else {
			actualizarTipoPrueba();
		}
	}
	// Función para manejar el envío del formulario
	async function actualizarTipoPrueba() {
		console.log(tipo_prueba);
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/editar/prueba`, {
			method: 'PUT',
			body: JSON.stringify({ tipo_prueba: tipo_prueba, codigo_viejo: codigo_viejo }),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		goto('/admin/HomeAdmin/pruebas/pruebas_catalogo');
	}
	async function registrarTipoPrueba() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/prueba`, {
			method: 'POST',
			body: JSON.stringify(tipo_prueba),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		goto('/admin/HomeAdmin/pruebas/pruebas_catalogo');
	}
</script>

<form on:submit|preventDefault={decide}>
	<h2>Registrar Tipo de Prueba</h2>

	<label for="codigo_tp">Codigo Tipo de Prueba</label>
	{#if id_editar}
		<input id="codigo_tp" bind:value={tipo_prueba.codigo_tp} readonly />
	{:else}
		<input id="codigo_tp" bind:value={tipo_prueba.codigo_tp} />
	{/if}

	<label for="nombre_tp">Nombre Tipo Prueba</label>
	<input id="nombre_tp" bind:value={tipo_prueba.nombre_tp} />

	<label for="descripcion_tp">Descripcion Tipo Prueba</label>
	<input id="descripcion_tp" bind:value={tipo_prueba.descripcion_tp} />

	<label for="precio_unidad_ma">Duracion Estimada de la prueba</label>
	<input id="precio_unidad_ma" bind:value={tipo_prueba.duracion_estimada_tp} />

	<button type="submit">Registrar Tipo Prueba</button>
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

	input,

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

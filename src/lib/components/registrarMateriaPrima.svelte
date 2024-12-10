<script lang="ts">
	import { goto } from '$app/navigation';
	// Interfaz para representar un dato
	interface Materia_Prima {
		codigo_tmp: number;
		nombre_tmp: string;
		descripcion_tmp: string;
		precio_tmp: number;
		unidad_medida_tmp: string;
		cantidad_tmp: number;
	}

	export let materia_prima: Materia_Prima = {
		codigo_tmp: 0,
		nombre_tmp: '',
		descripcion_tmp: '',
		precio_tmp: 0,
		unidad_medida_tmp: '',
		cantidad_tmp: 0
	};

	// Función para manejar el envío del formulario
	function registrarDato() {
		// Aquí iría la lógica para procesar los datos del formulario
		console.log('Registrando dato:', materia_prima);
		goto('/admin/HomeAdmin/inventario/materia_prima');
		alert('Se agregó exitosamente la materia prima');
	}
</script>

<form on:submit|preventDefault={registrarDato}>
	<h2>Registrar Materia Prima</h2>

	<label for="codigo_tmp">Código</label>
	<input id="codigo_tmp" bind:value={materia_prima.codigo_tmp} />

	<label for="nombre_tmp">Nombre</label>
	<input id="nombre_tmp" bind:value={materia_prima.nombre_tmp} />

	<label for="descripcion_tmp">Descripción</label>
	<input id="descripcion_tmp" bind:value={materia_prima.descripcion_tmp} />

	<label for="precio_tmp">Precio</label>
	<input id="precio_tmp" bind:value={materia_prima.precio_tmp} />

	<label for="unidad_medida_tmp">Unidad de Medida</label>
	<input id="unidad_medida_tmp" bind:value={materia_prima.unidad_medida_tmp} />

	<label for="cantidad_tmp">Cantidad a Registrar</label>
	<input id="cantidad_tmp" bind:value={materia_prima.cantidad_tmp} />

	<button type="submit">Registrar Materia Prima</button>
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

<script lang="ts">
	import { goto } from '$app/navigation';

	interface Modelo_Avion {
		codigo_ma: string;
		nombre_ma: string;
		descripcion_ma: string;
		precio_unidad_ma:number;
		fk_modelo_avion: string;
	}

	let aeronave: Modelo_Avion = {
		codigo_ma: '',
		nombre_ma: '',
		descripcion_ma: '',
		precio_unidad_ma:0,
		fk_modelo_avion: ''
	};

	// Función para manejar el envío del formulario
	async function registrarAeronave() {
		console.log('Se agregará:',aeronave);
		const res = await fetch(`http://localhost:4000/mineral`, {
			method: 'POST',
			body: JSON.stringify(aeronave),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		console.log(data);
		goto('/admin/HomeAdmin/mineral');
		alert('Se agregó exitosamente el mineral');
	}
</script>

<form on:submit|preventDefault={registrarAeronave}>
	<h2>Registrar Aeronave</h2>

	<label for="codigo_ma">Codigo Aeronave</label>
	<input id="codigo_ma" bind:value={aeronave.codigo_ma} />

	<label for="nombre_ma">Nombre Aeronave</label>
	<input id="nombre_ma" bind:value={aeronave.nombre_ma} />

	<label for="descripcion_ma">Descripcion Aeronave</label>
	<input id="descripcion_ma" bind:value={aeronave.descripcion_ma} />

	<label for="precio_unidad_ma">Precio Unidad Aeronave</label>
	<input id="precio_unidad_ma" bind:value={aeronave.precio_unidad_ma} />

	<button type="submit">Registrar Aeronave</button>
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
	select {
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

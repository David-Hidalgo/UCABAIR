<script lang="ts">
	import Combobox from './combobox.svelte';
	import { goto } from '$app/navigation';

	const fecha = new Date();
	// Interfaz para representar un dato
	interface Solicitud_Compra {
		mineral: string;
		cantidad_a_solicitar: string;
		fecha_solicitud: Date;
		fecha_entrega: Date;
	}

	let solicitud_compra: Solicitud_Compra = {
		mineral: '',
		cantidad_a_solicitar: '',
		fecha_solicitud: new Date(),
		fecha_entrega: new Date()
	};

	interface Aliado {
		rif: string;
	}

	/* async function obtenerDatos() {
        const response = await fetch('http://localhost:4000/aliados');
        const data: Aliado[] = await response.json();
        aliados = data;
    }; */

	// Función para manejar el envío del formulario
	function registrarDato() {
		// Aquí iría la lógica para procesar los datos del formulario
		console.log('Registrando dato:', solicitud_compra);
		goto('/admin/HomeAdmin/mineral');
		alert('La solicitud fue realizada con exito');
	}
</script>

<form on:submit|preventDefault={registrarDato}>
	<h2>Solicitud A Aliado</h2>

	<label for="mineral">Mineral</label>
	<input id="mineral" bind:value={solicitud_compra.mineral} />

	<label for="cantidad_a_extraer">Cantidad a Solicitar</label>
	<input id="cantidad_a_extraer" bind:value={solicitud_compra.cantidad_a_solicitar} />

	<label for="fecha_estimada">Fecha Estimada Entrega</label>
	<input id="fecha_estimada" bind:value={solicitud_compra.fecha_entrega} />

	<!-- <Combobox options={aliados} /> -->

	<button type="submit">Registrar configuracion inicial Proyecto</button>
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

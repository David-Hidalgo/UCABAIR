<script lang="ts">
	import { goto } from '$app/navigation';

	//import Combobox from "./combobox.svelte.js";

	const fecha = new Date();
	// Interfaz para representar un dato
	interface Solicitud_Empleado {
		area_trabajo: string;
		sueldo: string;
		especialidad: string;
		rol: string;
	}

	// Ahora declara 'datos' con el tipo explícito 'Dato[]'
	let solicitud: Solicitud_Empleado = {
		area_trabajo: 'Ingeniería',
		sueldo: '2500$',
		especialidad: 'Desarrollo de Software',
		rol: 'empleado'
	};

	/* async function obtenerDatos() {
        const response = await fetch('http://localhost:4000/aliados');
        const data: Aliado[] = await response.json();
        aliados = data;
    }; */

	// Función para manejar el envío del formulario
	function registrarDato() {
		// Aquí iría la lógica para procesar los datos del formulario
		console.log('Registrando dato:', solicitud);
		goto('/admin/HomeAdmin/empleado');
		alert('La solicitud fue realizada con exito');
	}
</script>

<form on:submit|preventDefault={registrarDato}>
	<h2>Solicitud de Personal</h2>

	<label for="area_trabajo">Area de Trabajo</label>
	<input id="area_trabajo" bind:value={solicitud.area_trabajo} />

	<label for="sueldo">Sueldo</label>
	<input id="sueldo" bind:value={solicitud.sueldo} />

	<label for="especialidad">Especialidad</label>
	<input id="especialidad" bind:value={solicitud.especialidad} />

	<label for="rol">Rol</label>
	<input id="rol" bind:value={solicitud.rol} />

	<!-- <Combobox options={aliados} /> -->

	<button type="submit">Registrar Solicitud de Personal</button>
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

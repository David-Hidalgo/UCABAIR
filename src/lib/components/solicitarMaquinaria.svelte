<script lang="ts">
	//import Combobox from "./combobox.svelte";
	import { goto } from '$app/navigation';
	const fecha = new Date();
	// Interfaz para representar un dato
	interface Solicitud_Maquinaria {
		tipo_maquinaria: string[];
		marca: string;
		modelo: string;
		cantidad_maquinas: number;
	}

	// Ahora declara 'datos' con el tipo explícito 'Dato[]'
	let solicitud: Solicitud_Maquinaria = {
		tipo_maquinaria: ['Excavadora', 'Perforadora'],
		marca: 'Caterpillar',
		modelo: '320D',
		cantidad_maquinas: 2
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
		goto('/admin/HomeAdmin/maquinaria');
		alert('La solicitud fue realizada con exito');
	}
</script>

<form on:submit|preventDefault={registrarDato}>
	<h2>Solicitud Maquinaria</h2>

	<label for="tipo_maquinaria">Tipo Maquinaria</label>
	<input id="maquinaria" bind:value={solicitud.tipo_maquinaria} />

	<label for="marca">Marca</label>
	<input id="marca" bind:value={solicitud.marca} />

	<label for="modelo">Modelo</label>
	<input id="modelo" bind:value={solicitud.modelo} />

	<label for="cantidad_maquinaria">Cantidad</label>
	<input id="cantidad_maquinaria" bind:value={solicitud.cantidad_maquinas} />

	<!-- <Combobox options={aliados} /> -->

	<button type="submit">Registrar Solicitud</button>
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

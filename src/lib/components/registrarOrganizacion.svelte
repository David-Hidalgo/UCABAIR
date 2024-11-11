<script lang="ts">
	import { goto } from '$app/navigation';
	// Interfaz para representar un proveedor
	interface Organizacion {
		id_organizacion: string;
		id_actividad_organizacion: String;
		id_etapa_organizacion: String;
		id_proyecto_organizacion: String;
		id_cargo: String;
		id_equipo: String;
		or_cantidad_equipo: String;
		or_cantidad_cargo: String;
		or_dias_trabajo_cargo: String;
	}

	let organizacion: Organizacion = {
		id_organizacion: '',
		id_actividad_organizacion: '',
		id_etapa_organizacion: '',
		id_proyecto_organizacion: '',
		id_cargo: '',
		id_equipo: '',
		or_cantidad_equipo: '',
		or_cantidad_cargo: '',
		or_dias_trabajo_cargo: ''
	};

	// Función para manejar el envío del formulario
	function registrarOrganizacion() {
		// Aquí iría la lógica para procesar los datos del formulario
		console.log('Registrando organizacion:', organizacion);
		goto('/admin/HomeAdmin/organizacion');
		alert('Se agregó exitosamente la organizacion');
	}
</script>

<form on:submit|preventDefault={registrarOrganizacion}>
	<h2>Registrar Organizacion</h2>

	<label for="id_organizacion">ID_Organizacion</label>
	<input id="id_organizacion" bind:value={organizacion.id_organizacion} />

	<label for="id_actividad_organizacion">ID Actividad Organizacion</label>
	<input id="id_actividad_organizacion" bind:value={organizacion.id_actividad_organizacion} />

	<label for="id_etapa_organizacion">ID Etapa Organizacion</label>
	<input id="id_etapa_organizacion" bind:value={organizacion.id_etapa_organizacion} />

	<label for="id_proyecto_organizacion">ID Proyecto Organizacion</label>
	<input id="id_proyecto_organizacion" bind:value={organizacion.id_proyecto_organizacion} />

	<label for="id_cargo">ID Cargo</label>
	<input id="id_cargo" bind:value={organizacion.id_cargo} />

	<label for="id_equipo">ID Equipo</label>
	<input id="id_equipo" bind:value={organizacion.id_equipo} />

	<label for="or_cantidad_equipo">Cantidad Equipo</label>
	<input id="or_cantidad_equipo" bind:value={organizacion.or_cantidad_equipo} />

	<label for="or_cantidad_cargo">Cantidad Cargo</label>
	<input id="or_cantidad_cargo" bind:value={organizacion.or_cantidad_cargo} />

	<label for="or_dias_trabajo_cargo">Dias Trabajo Cargo</label>
	<input id="or_dias_trabajo_cargo" bind:value={organizacion.or_dias_trabajo_cargo} />

	<!-- Agrega más campos según la interfaz Proveedor -->
	<!-- Ejemplo: teléfono, correo, capacidad instalada -->
	<button type="submit">Registrar Organizacion</button>
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

<script lang="ts">
	import { goto } from '$app/navigation';
	// Interfaz para representar un empleado
	interface Empleado {
		cedula: string;
		nombre: string[];
		apellido: string[];
		telefono: string[];
		correo: string[];
		area_trabajo: string;
		sueldo: string;
		especialidad: string;
	}

	let empleado: Empleado = {
		cedula: '',
		nombre: [],
		apellido: [],
		telefono: [],
		correo: [],
		area_trabajo: '',
		sueldo: '',
		especialidad: ''
	};

	// Función para manejar el envío del formulario
	function registrarEmpleado() {
		// Aquí iría la lógica para procesar los datos del formulario
		console.log('Registrando empleado:', empleado);
		goto('/admin/HomeAdmin/empleado');
		alert('Se agregó exitosamente el empleado');
	}
</script>

<form on:submit|preventDefault={registrarEmpleado}>
	<h2>Registrar Empleado</h2>

	<label for="cedula">Cédula</label>
	<input id="cedula" bind:value={empleado.cedula} />

	<label for="nombre">Nombre</label>
	<input id="nombre" bind:value={empleado.nombre} />

	<label for="apellido">Apellido</label>
	<input id="apellido" bind:value={empleado.apellido} />

	<label for="telefonos">Nombres</label>
	<input id="telefonos" bind:value={empleado.telefono} />

	<label for="correo">Correos</label>
	<input id="correo" bind:value={empleado.correo} />

	<label for="areatrabajo">Area de Trabajo</label>
	<input id="areatrabajo" bind:value={empleado.area_trabajo} />

	<label for="sueldo">Sueldo</label>
	<input id="sueldo" bind:value={empleado.sueldo} />

	<label for="especialidad">Especialidad</label>
	<input id="especialidad" bind:value={empleado.especialidad} />

	<button type="submit">Registrar Empleado</button>
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

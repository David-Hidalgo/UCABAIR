<script lang="ts">
	import { goto } from '$app/navigation';
	export const cedula: string = '';
	// Interfaz para representar un empleado
	interface Cliente {
		cedula: string;
		nombre: string[];
		apellido: string[];
		telefono: string[];
		correo: string[];
		direccion: string;
	}

	let cliente: Cliente = {
		cedula: 'V-2871812729',
		nombre: [],
		apellido: [],
		telefono: [],
		correo: [],
		direccion: ''
	};

	// Función para manejar el envío del formulario
	function registrarEmpleado() {
		// Aquí iría la lógica para procesar los datos del formulario
		console.log('Registrando cliente:', cliente);
		goto('/admin/HomeAdmin/clientes');
		alert('Se agregó exitosamente el cliente');
	}
</script>

<form on:submit|preventDefault={registrarEmpleado}>
	<h2>Registrar Cliente</h2>

	<label for="cedula">Cédula</label>
	<input id="cedula" bind:value={cliente.cedula} />

	<label for="nombre">Nombre</label>
	<input id="nombre" bind:value={cliente.nombre} />

	<label for="apellido">Apellido</label>
	<input id="apellido" bind:value={cliente.apellido} />

	<label for="telefonos">Nombres</label>
	<input id="telefonos" bind:value={cliente.telefono} />

	<label for="correo">Correos</label>
	<input id="correo" bind:value={cliente.correo} />

	<label for="direccion">Direccion</label>
	<input id="direccion" bind:value={cliente.direccion} />

	<button type="submit">Registrar Cliente</button>
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

<script lang="ts">
	export let id_editar: number;
	console.log(id_editar);
	import { goto } from '$app/navigation';

	// Interfaz para representar un empleado
	interface Rol {
		id_rol: number;
		nombre_rol: string;
		descripcion_rol: string;
	}
	let rol: Rol = {
		id_rol: 0,
		nombre_rol: '',
		descripcion_rol: ''
	};

	// Función para manejar el envío del formulario
	async function registrarRol() {
		/*const res = await fetch(`http://localhost:4000/rol`, {
			method: 'POST',
			body: JSON.stringify(rol),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		console.log(data);*/
		alert('Rol agregado con exito');
		goto('/admin/HomeAdmin/roles');
	}
</script>

<form on:submit|preventDefault={registrarRol}>
	<h2>Registrar Rol</h2>

	<label for="rol">Rol</label>
	<input id="rol" bind:value={rol.id_rol} />

	<label for="nombreRol">Nombre del Rol</label>
	<input id="nombreRol" bind:value={rol.nombre_rol} />

	<label for="descripcionRol">Descripción del Rol</label>
	<input id="descripcionRol" bind:value={rol.descripcion_rol} />

	<button type="submit">Registrar Rol</button>
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

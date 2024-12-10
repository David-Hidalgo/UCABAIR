<script lang="ts">
	import type { Rol } from '$lib/server/db/schema';
	export let id_editar: Rol | undefined;

	
	import { goto } from '$app/navigation';


	// Interfaz para representar un empleado
	let rol: Rol;
	let codigo_viejo: number;
	if (id_editar!=undefined) {
		rol = id_editar;
		if (id_editar.codigo_rol)
		codigo_viejo=id_editar.codigo_rol
	} else {
		rol = {
			codigo_rol: undefined,
			nombre_rol: '',
			descripcion_rol: ''
		};
	}
	async function decide() {
		
		if (id_editar==undefined) {
			registrarRol();
		} else {
			actualizarRol()
		}
	}
	// Función para manejar el envío del formulario
	async function registrarRol() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/rol`, {
			method: 'POST',
			body: JSON.stringify(rol),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();

		alert('Rol agregado con exito');
		goto('/admin/HomeAdmin/roles');
	}
</script>

<form on:submit|preventDefault={decide}>
	<h2>Registrar Rol</h2>

	<label for="rol">Rol</label>
	<input id="rol" bind:value={rol.codigo_rol} />

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

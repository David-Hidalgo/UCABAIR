<script lang="ts">
	import type { Empleado } from '$lib/server/db/schema';
	export let id_editar: Empleado | undefined;
	import { goto } from '$app/navigation';
	import { format } from 'date-fns';
	$: empleado.fecha_inicio_servicio_per = format(new Date(empleado.fecha_inicio_servicio_per), 'yyyy-MM-dd');

	let empleado: Empleado;
	let codigo_viejo: number;

	if (id_editar!=undefined) {
		empleado = id_editar;
		if (id_editar.codigo_empleado_per)
		codigo_viejo=id_editar.codigo_empleado_per
	} else {
		empleado = {
	codigo_empleado_per: 817,
	cedula_per: '',
	primer_nombre_per: '',
	segundo_nombre_per: '',
	primer_apellido_per: '',
	segundo_apellido_per: '',
	direccion_per: '',
	fecha_inicio_servicio_per: new Date(),
	//experiencia_profesional_per: '',
	//titulacion_per: '',
	sueldo_per: 0,
	//telefono_per: '',
	//correo_per: '',
	//labor_per: '',
	fk_lugar: Math.floor(Math.random() * 100),
	fk_usuario: 188
		};
	}
	async function decide() {
		
		if (id_editar==undefined) {
			registrarEmpleado();
		} else {
			actualizarEmpleado()
		}
	}

	// Función para manejar el envío del formulario
	async function actualizarEmpleado() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/editar/empleado`, {
			method: 'PUT',
			body: JSON.stringify({empleado:empleado , codigo_viejo:codigo_viejo}),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		alert('Empleado modificado con exito');
		goto('/admin/HomeAdmin/empleado');
	}
	async function registrarEmpleado() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/empleado`, {
			method: 'POST',
			body: JSON.stringify(empleado),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		//location.reload();
	}
</script>

<form on:submit|preventDefault={registrarEmpleado}>
	<h2>Registrar Empleado</h2>

	<label for="cedula">Cédula</label>
	<input id="cedula" bind:value={empleado.cedula_per} />

	<label for="primerNombre">Primer Nombre</label>
	<input id="primerNombre" bind:value={empleado.primer_nombre_per} />

	<label for="segundoNombre">Segundo Nombre</label>
	<input id="segundoNombre" bind:value={empleado.segundo_nombre_per} />

	<label for="primerApellido">Primer Apellido</label>
	<input id="primerApellido" bind:value={empleado.primer_apellido_per} />

	<label for="segundoApellido">Segundo Apellido</label>
	<input id="segundoApellido" bind:value={empleado.segundo_apellido_per} />

	<label for="direccion">Dirección</label>
	<input id="direccion" bind:value={empleado.direccion_per} />

	<label for="fechaInicio">Fecha de Inicio de Servicio</label>
	<input id="fechaInicio" type="date" bind:value={empleado.fecha_inicio_servicio_per} />
	
	<label for="sueldo">Sueldo</label>
	<input id="sueldo" bind:value={empleado.sueldo_per} />

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

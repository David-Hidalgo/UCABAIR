<script lang="ts">
	import { goto } from '$app/navigation';
	export let message;
	// Interfaz para representar un empleado
	interface Empleado {
		cedula_per: string;
		primer_nombre_per: string;
		segundo_nombre_per: string;
		primer_apellido_per: string;
		segundo_apellido_per: string;
		direccion_per: string;
		fecha_inicio_servicio_per: Date;
		experiencia_profesional_per: string;
		titulacion_per: string;
		sueldo_per: number;
		telefono_per: string[];
		correo_per: string[];
		labor_per:string;
	}

	let empleado: Empleado = {
		cedula_per: '',
		primer_nombre_per: '',
		segundo_nombre_per: '',
		primer_apellido_per: '',
		segundo_apellido_per: '',
		direccion_per: '',
		fecha_inicio_servicio_per: new Date(),
		experiencia_profesional_per: '',
		titulacion_per: '',
		sueldo_per: 0,
		telefono_per: [],
		correo_per: [],
		labor_per:''
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

	<label for="experiencia">Experiencia Profesional</label>
	<input id="experiencia" bind:value={empleado.experiencia_profesional_per} />

	<label for="titulacion">Titulación</label>
	<input id="titulacion" bind:value={empleado.titulacion_per} />

	<label for="sueldo">Sueldo</label>
	<input id="sueldo" bind:value={empleado.sueldo_per} />

	<label for="telefono">Teléfono</label>
	<input id="telefono" bind:value={empleado.telefono_per} />

	<label for="correo">Correo</label>
	<input id="correo" bind:value={empleado.correo_per} />

	<label for="labor">Labor</label>
	<input id="labor" bind:value={empleado.labor_per} />

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

<script lang="ts">
	import { goto } from '$app/navigation';
	// Interfaz para representar un dato
	const fecha = new Date();

	interface Empleados {
		cant_empleados: string;
		area_trabajo: string;
		sueldo: string;
	}

	let empleados: Empleados = {
		cant_empleados: '',
		area_trabajo: '',
		sueldo: ''
	};

	// Función para manejar el envío del formulario
	function registrarDato() {
		//goto("admin/HomeAdmin");
		// Aquí iría la lógica para procesar los datos del formulario
		console.log('Registrando dato:', empleados);
		goto(
			'/admin/HomeAdmin/registrar/proyecto/configuracionProyecto/configurarEtapa/configurarActividad/asignarEmpleado'
		);
		alert('Se agregó exitosamente el empleado');
	}
</script>

<form on:submit|preventDefault={registrarDato}>
	<div class="agregarEmpleado">
		<label for="cant_empleados">Cantidad de Empleados</label>
		<input id="cant_empleados" bind:value={empleados.cant_empleados} />

		<label for="area_trabajo">Area De Trabajo</label>
		<select id="area_trabajo" bind:value={empleados.area_trabajo}>
			<option value="Geologo">Geologo</option>
			<option value="Minero">Minero</option>
		</select>

		<label for="sueldo">Sueldo</label>
		<input id="sueldo" bind:value={empleados.sueldo} />
	</div>
	<button type="submit">Asignar empleados</button>
</form>

<style>
	/* Estilos generales para el formulario */
	.agregarEmpleado {
		display: flex;
		justify-content: space-between;
	}

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
		width: 20%;
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

<script lang="ts">
	import { goto } from '$app/navigation';
	export let cedula_nat ;
	// Interfaz para representar un empleado
	interface Cliente {
		cedula_nat: number;
		primer_nombre_nat: string;
		segundo_nombre_nat: string;
		primer_apelido_nat: string;
		segundo_apelido_nat: string;
		telefono_com: number[];
		correo_com: string[];
		direccion_com: string;
		monto_acreditado_com: number;
		fecha_inicio_operaciones_com: Date;
		tipo_com: string;
	}

	let cliente: Cliente = {
		cedula_nat: cedula_nat,
		primer_nombre_nat: '',
		segundo_nombre_nat: '',
		primer_apelido_nat: '',
		segundo_apelido_nat: '',
		telefono_com: [],
		correo_com: [],
		direccion_com: '',
		monto_acreditado_com: 0,
		fecha_inicio_operaciones_com: new Date(),
		tipo_com: ''
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
	<input id="cedula" bind:value={cliente.cedula_nat} />

	<label for="primerNombre">Primer Nombre</label>
	<input id="primerNombre" bind:value={cliente.primer_nombre_nat} />

	<label for="segundoNombre">Segundo Nombre</label>
	<input id="segundoNombre" bind:value={cliente.segundo_nombre_nat} />

	<label for="primerApellido">Primer Apellido</label>
	<input id="primerApellido" bind:value={cliente.primer_apelido_nat} />

	<label for="segundoApellido">Segundo Apellido</label>
	<input id="segundoApellido" bind:value={cliente.segundo_apelido_nat} />

	<label for="telefono">Teléfono</label>
	<input id="telefono" bind:value={cliente.telefono_com} />

	<label for="correo">Correo</label>
	<input id="correo" bind:value={cliente.correo_com} />

	<label for="direccion">Dirección</label>
	<input id="direccion" bind:value={cliente.direccion_com} />

	<label for="montoAcreditado">Monto Acreditado</label>
	<input id="montoAcreditado" bind:value={cliente.monto_acreditado_com} />

	<label for="fechaInicio">Fecha de Inicio de Operaciones</label>
	<input type="date" id="fechaInicio" bind:value={cliente.fecha_inicio_operaciones_com} />

	<label for="tipo">Tipo de Cliente</label>
	<select id="tipo" bind:value={cliente.tipo_com}>
		<option value="natural">Natural</option>
		<option value="juridico">Jurídico</option>
	</select>

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

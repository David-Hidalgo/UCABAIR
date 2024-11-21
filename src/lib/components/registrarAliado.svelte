<script lang="ts">
	//import { goto } from '$app/navigation';
	export let rif;
	// Interfaz para representar un proveedor
	interface Aliado {
		razon_social: string;
		rif: string;
		direccion_fiscal: string;
		telefono: string[];
		correo: string[];
		monto_acreditado: string;
	}

	let aliados: Aliado = {
		razon_social: '',
		rif: 'J-2892781991',
		direccion_fiscal: '',
		telefono: [],
		correo: [],
		monto_acreditado: ''
	};

	// Función para manejar el envío del formulario
	function registrarProveedor() {
		// Aquí iría la lógica para procesar los datos del formulario
		console.log('Registrando proveedor:', aliados);
		//goto('/admin/HomeAdmin/aliados');
		alert('Se agregó exitosamente el aliado');
	}
</script>

<form on:submit|preventDefault={registrarProveedor}>
	<h2>Registrar Aliado</h2>

	<label for="razonSocial">Razón Social</label>
	<input id="razonSocial" bind:value={aliados.razon_social} />

	<label for="rif">RIF</label>
	<input id="rif" bind:value={aliados.rif} />

	<label for="direccionFiscal">Dirección Fiscal</label>
	<input id="direccionFiscal" bind:value={aliados.direccion_fiscal} />

	<label for="telefono">Telefono</label>
	<input id="telefono" bind:value={aliados.telefono} />

	<label for="correo">Correo</label>
	<input id="correo" bind:value={aliados.correo} />

	<label for="montoAcreditado">Monto Acreditado</label>
	<input id="capacidadinstalada" bind:value={aliados.monto_acreditado} />

	<!-- Agrega más campos según la interfaz Proveedor -->
	<!-- Ejemplo: teléfono, correo, capacidad instalada -->
	<button type="submit">Registrar Aliados</button>
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

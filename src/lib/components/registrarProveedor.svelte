<script lang="ts">
	//import { goto } from '$app/navigation';
	// Interfaz para representar un proveedor
	export let codigo_com;
	interface Proveedor {
		codigo_com: number;
		rif_jur: string;
		denominacion_comercial_jur: string;
		razon_social_jur: string;
		pagina_web_jur: string;
		telefono_com: string[];
		correo_com: string[];
		direccion_com: string;
		monto_acreditado_com: number;
		fecha_inicio_operaciones_com: Date;
	}


	let proveedor: Proveedor = {
		codigo_com: codigo_com,
		telefono_com: [],
		correo_com: [],
		direccion_com: '',
		monto_acreditado_com: 0,
		fecha_inicio_operaciones_com: new Date(),
		rif_jur: "",
		denominacion_comercial_jur: "",
		razon_social_jur: "",
		pagina_web_jur: ""
	};

	// Función para manejar el envío del formulario
	function registrarProveedor() {
		// Aquí iría la lógica para procesar los datos del formulario
		console.log('Registrando proveedor:', proveedor);
		//goto('/admin/HomeAdmin/aliados');
		alert('Se agregó exitosamente el aliado');
	}
</script>

<form on:submit|preventDefault={registrarProveedor}>
	<h2>Registrar Aliado</h2>

	<label for="codigo">Código</label>
	<input type="number" id="codigo" bind:value={proveedor.codigo_com} required>

	<label for="rif">RIF</label>
	<input type="text" id="rif" bind:value={proveedor.rif_jur} required>

	<label for="denominacion_comercial">Denominación Comercial</label>
	<input type="text" id="denominacion_comercial" bind:value={proveedor.denominacion_comercial_jur} required>

	<label for="razon_social">Razón Social</label>
	<input type="text" id="razon_social" bind:value={proveedor.razon_social_jur} required>

	<label for="pagina_web">Página Web</label>
	<input type="text" id="pagina_web" bind:value={proveedor.pagina_web_jur} required>

	<label for="telefono">Teléfono</label>
	<input type="text" id="telefono" bind:value={proveedor.telefono_com} required>

	<label for="correo">Correo</label>
	<input type="text" id="correo" bind:value={proveedor.correo_com} required>

	<label for="direccion">Dirección</label>
	<input type="text" id="direccion" bind:value={proveedor.direccion_com} required>

	<label for="monto_acreditado">Monto Acreditado</label>
	<input type="number" id="monto_acreditado" bind:value={proveedor.monto_acreditado_com} required>

	<label for="fecha_inicio_operaciones">Fecha de Inicio de Operaciones</label>
	<input type="date" id="fecha_inicio_operaciones" bind:value={proveedor.fecha_inicio_operaciones_com} required>


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

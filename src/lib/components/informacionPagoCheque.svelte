<script lang="ts">
	import type { Modo_pago } from '$lib/server/db/schema';
	let export modo_pago: Modo_pago;

	let modo_pago: Modo_pago;
	modo_pago = {
		codigo_mp: undefined,
		tipo_mp: '',
		numero_tarjeta_tar: undefined,
		banco_tar: '',
		cvv_tar: undefined,
		mes_vencimiento_tar: undefined,
		ano_vencimiento_tar: undefined,
		nombre_tar: '',
		fecha_emision_tar: undefined,
		numero_transferencia_tran: undefined,
		fecha_emision_tran: undefined,
		numero_cuenta_tran: undefined,
		numero_cheque_che: undefined,
		banco_che: '',
		fecha_emision_che: new Date(),
		beneficiario_che: '',
		denominacion_efe: ''
	};

	let componenteActual = 'A';

	function registrarDato() {
		
	}
</script>

<h2>Cheque</h2>
<form on:submit|preventDefault={registrarDato}>
	<div class="form-group">
		<label for="banco">Banco</label>
		<input type="text" id="banco" bind:value={modo_pago.banco_che} />
	</div>
	<div class="form-group">
		<label for="numero_cheque">Numero de cheque</label>
		<input type="text" id="numero_cheque" bind:value={modo_pago.numero_cheque_che} />
	</div>
	<div class="form-group">
		<label for="beneficiario">Beneficiario</label>
		<input type="text" id="beneficiario" bind:value={modo_pago.beneficiario_che} />
	</div>
	<div class="form-group">
		<label for="fecha_emision">Fecha de emisión</label>
		<input type="date" id="fecha_emision" bind:value={modo_pago.fecha_emision_che} />
	</div>

	<button type="submit">Registrar</button>
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

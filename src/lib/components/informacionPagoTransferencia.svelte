<script lang="ts">
	import type { Modo_pago } from '$lib/server/db/schema';
	import { date } from 'drizzle-orm/mysql-core';
	export let id_editar: number;

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
		console.log('Registrando dato:', modo_pago);
	}
</script>

<h2>Transferencia</h2>
<form on:submit|preventDefault={registrarDato}>
	<div class="form-group">
		<label for="banco">Banco</label>
		<input type="text" id="banco" bind:value={modo_pago.banco_tar} />
	</div>
	<div class="form-group">
		<label for="numero_transferencia">Numero de transferencia</label>
		<input type="text" id="numero_transferencia" bind:value={modo_pago.numero_transferencia_tran} />
	</div>
	<div class="form-group">
		<label for="numero_cuenta">Número de Cuenta</label>
		<input type="text" id="numero_cuenta" bind:value={modo_pago.numero_cuenta_tran} />
	</div>
	<div class="form-group">
		<label for="nombre">Nombre del titular de la cuenta</label>
		<input type="text" id="nombre" bind:value={modo_pago.nombre_tar} />
	</div>
	<div class="form-group">
		<label for="fecha_transferencia">Fecha en la que se realizó</label>
		<input type="date" id="fecha_transferencia" bind:value={modo_pago.fecha_emision_tran} />
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

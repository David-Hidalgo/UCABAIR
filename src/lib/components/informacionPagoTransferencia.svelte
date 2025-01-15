<script lang="ts">
	import type { Modo_pago, Moneda } from '$lib/server/db/schema';
	import { date } from 'drizzle-orm/mysql-core';
	import { goto } from '$app/navigation';
	let {
		modo_pago = $bindable(),
		moneda,
		modopago
	}: { modo_pago: Modo_pago; moneda: Moneda; modopago: any } = $props();
	moneda = {
		codigo_mon: undefined,
		nombre_mon: '',
		tasa_cambio_mon: 0,
		fecha_inicio_mon: new Date(),
		fecha_fin_mon: new Date()
	};
	modo_pago = {
		codigo_mp: 0,
		tipo_mp: 'transferencia',
		numero_tarjeta_tar: 0,
		banco_tar: '',
		cvv_tar: 0,
		mes_vencimiento_tar: 0,
		ano_vencimiento_tar: 0,
		nombre_tar: '',
		fecha_emision_tar: new Date(),
		numero_transferencia_tran: undefined,
		fecha_emision_tran: new Date(),
		numero_cuenta_tran: undefined,
		numero_cheque_che: 0,
		banco_che: '',
		fecha_emision_che: new Date(),
		beneficiario_che: '',
		denominacion_efe: ''
	};

	let componenteActual = 'A';

	async function registrarMetodoPago() {
		const res = await fetch(`/cliente/pago`, {
			method: 'POST',
			body: JSON.stringify(modo_pago),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		console.log(data);
		modo_pago.codigo_mp = data.ret;
		modopago('metodopago');
	}
</script>

<h2>Transferencia</h2>
<form onsubmit={registrarMetodoPago}>
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

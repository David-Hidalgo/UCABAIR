<script lang="ts">
	// import { goto } from '$app/navigation';
	import type { Modo_pago, Moneda } from '$lib/server/db/schema';
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
		tipo_mp: 'tarjeta',
		numero_tarjeta_tar: undefined,
		banco_tar: '',
		cvv_tar: 0,
		mes_vencimiento_tar: undefined,
		ano_vencimiento_tar: undefined,
		nombre_tar: '',
		fecha_emision_tar: new Date(),
		numero_transferencia_tran: 0,
		fecha_emision_tran: new Date(),
		numero_cuenta_tran: 0,
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

<h2>Tarjeta</h2>
<form onsubmit={registrarMetodoPago}>
	<div class="form-group">
		<label for="tipo">Tipo de Tarjeta</label>
		<select id="tipo" bind:value={modo_pago.tipo_mp}>
			<option value="credito">Crédito</option>
			<option value="debito">Débito</option>
		</select>
	</div>
	<div class="form-group">
		<strong>Moneda seleccionada:</strong>
		{#if moneda.codigo_mon}
			{moneda.nombre_mon}
		{:else}
			No se ha seleccionado una moneda
		{/if}
	</div>
	<div class="form-group">
		<label for="banco">Banco</label>
		<input type="text" id="banco" bind:value={modo_pago.banco_tar} />
	</div>
	<div class="form-group">
		<label for="numero">Número de Tarjeta</label>
		<input type="text" id="numero" bind:value={modo_pago.numero_tarjeta_tar} />
	</div>
	<div class="form-group">
		<label for="nombre">Nombre del Titular</label>
		<input type="text" id="nombre" bind:value={modo_pago.nombre_tar} />
	</div>
	<div class="form-group">
		<label for="mes_expiracion">Mes de Expiración</label>
		<select id="mes_expiracion" bind:value={modo_pago.mes_vencimiento_tar}>
			{#each Array.from({ length: 12 }, (_, i) => i + 1) as mes}
				<option value={mes}>{mes}</option>
			{/each}
		</select>
	</div>
	<div class="form-group">
		<label for="anio_expiracion">Año de Expiración</label>
		<input type="text" id="ano_expiracion" bind:value={modo_pago.ano_vencimiento_tar} />
		<div class="form-group">
			<label for="cvv">CVV</label>
			<input type="text" id="cvv" bind:value={modo_pago.cvv_tar} />
		</div>
		<button type="submit">Confirmar Pago</button>
	</div>
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

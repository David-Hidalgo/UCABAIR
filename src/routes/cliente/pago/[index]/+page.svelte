<script lang="ts">
	import { page } from '$app/stores';
	import InformacionPagoTarjeta from '$lib/components/informacionPagoTarjeta.svelte';
	import InformacionPagoTransferencia from '$lib/components/informacionPagoTransferencia.svelte';
	import InformacionPagoCheque from '$lib/components/informacionPagoCheque.svelte';
	import type {
		Modelo_avion,
		Persona,
		Telefono,
		Correo_electronico,
		Modo_pago,
		Moneda
	} from '$lib/server/db/schema';
	let { data }: { data: PageData } = $props();
	import type { PageData } from './$types';
	let id_editar = Number($page.params.index);
	import { writable } from 'svelte/store';
	import { goto } from '$app/navigation';
	let modo_pago: Modo_pago = $state({
		codigo_mp: undefined,
		tipo_mp: '',
		numero_tarjeta_tar: undefined,
		banco_tar: '',
		cvv_tar: undefined,
		mes_vencimiento_tar: undefined,
		ano_vencimiento_tar: undefined,
		nombre_tar: '',
		fecha_emision_tar: new Date(),
		numero_transferencia_tran: undefined,
		fecha_emision_tran: new Date(),
		numero_cuenta_tran: undefined,
		numero_cheque_che: undefined,
		banco_che: '',
		fecha_emision_che: new Date(),
		beneficiario_che: '',
		denominacion_efe: ''
	});

	let monedas: Moneda[] = new Array();
	for (let index = 0; index < data.mon_table.length; index++) {
		let moneda: Moneda = {
			codigo_mon: undefined,
			nombre_mon: '',
			tasa_cambio_mon: 0,
			fecha_inicio_mon: new Date(),
			fecha_fin_mon: new Date()
		};
		moneda.codigo_mon = data.mon_table[index].codigo_mon;
		moneda.nombre_mon = data.mon_table[index].nombre_mon;
		moneda.tasa_cambio_mon = data.mon_table[index].tasa_cambio_mon;
		moneda.fecha_inicio_mon = data.mon_table[index].fecha_inicio_mon;
		moneda.fecha_fin_mon = data.mon_table[index].fecha_fin_mon;
		monedas.push(moneda);
	}

	let telefonos: Telefono[] = new Array();
	for (let index = 0; index < data.tel_table.length; index++) {
		let telefono: Telefono = {
			codigo_tel: undefined,
			numero_telefono_tel: '',
			codigo_area_tel: '',
			fk_persona: undefined,
			fk_empleado: undefined
		};
		telefono.codigo_tel = data.tel_table[index].codigo_tel;
		telefono.numero_telefono_tel = data.tel_table[index].numero_telefono_tel;
		telefono.codigo_area_tel = data.tel_table[index].codigo_area_tel;
		telefono.fk_persona = data.tel_table[index].fk_persona;
		if (telefono.fk_persona === undefined) {
			telefono.numero_telefono_tel = 'No hay telefonos asociados';
		}
		telefono.fk_empleado = data.tel_table[index].fk_empleado;
		telefonos.push(telefono);
	}

	let correos: Correo_electronico[] = new Array();
	for (let index = 0; index < data.email_table.length; index++) {
		let correo: Correo_electronico = {
			codigo_ce: undefined,
			direccion_correo_ce: '',
			fk_persona: undefined,
			fk_empleado: undefined
		};
		correo.codigo_ce = data.email_table[index].codigo_ce;
		correo.direccion_correo_ce = data.email_table[index].direccion_correo_ce;
		correo.fk_persona = data.email_table[index].fk_persona;
		if (correo.fk_persona === undefined) {
			correo.direccion_correo_ce = 'No hay correos asociados';
		}
		correo.fk_empleado = data.email_table[index].fk_empleado;
		correos.push(correo);
	}
	const persona: Persona = {
		codigo_com: data.persona.codigo_com,
		direccion_com: data.persona.direccion_com,
		monto_acreditado_com: data.persona.monto_acreditado_com,
		fecha_inicio_operacion_com: data.persona.fecha_inicio_operacion_com,
		tipo_com: data.persona.tipo_com,
		nacionalidad_com: data.persona.nacionalidad_com,
		fk_lugar: data.persona.fk_lugar,
		fk_usuario: data.persona.fk_usuario,
		tipo_persona_com: data.persona.tipo_persona_com,
		rif_jur: data.persona.rif_jur,
		denominacion_persona_jur: data.persona.denominacion_persona_jur,
		razon_social_jur: data.persona.razon_social_jur,
		pagina_web_jur: data.persona.pagina_web_jur,
		cedula_nat: data.persona.cedula_nat,
		primer_nombre_nat: data.persona.primer_nombre_nat,
		segundo_nombre_nat: data.persona.segundo_nombre_nat,
		primer_apellido_nat: data.persona.primer_apellido_nat,
		segundo_apellido_nat: data.persona.segundo_apellido_nat,
		telefonos: [],
		correos_electronicos: []
	};
	const avion_a_pagar: Modelo_avion = {
		codigo_ma: data.avion.codigo_ma,
		nombre_ma: data.avion.nombre_ma,
		descripcion_ma: data.avion.descripcion_ma,
		fk_modelo_avion: data.avion.fk_modelo_avion,
		precio_unidad_ma: data.avion.precio_unidad_ma
	};

	const selectedComponent = writable(InformacionPagoTarjeta);
	function seleccionarComponente(tipoPago: string) {
		switch (tipoPago) {
			case 'tarjeta':
				selectedComponent.set(InformacionPagoTarjeta);
				break;
			case 'transferencia':
				selectedComponent.set(InformacionPagoTransferencia);
				break;
			case 'cheque':
				selectedComponent.set(InformacionPagoCheque);
				break;
		}
	}
	let selectedMoneda = writable(monedas[0]);
</script>

<h1>Información De Pago</h1>
<div class="InformacionPago">
	<div class="DatosCliente">
		{#if persona.tipo_persona_com === 'natural'}
			<h3>Datos del Cliente:</h3>
			<p>Cedula:{persona.cedula_nat}</p>
			<h3>Nombres y Apellidos:</h3>
			<p>
				{persona.primer_nombre_nat}
				{persona.segundo_nombre_nat}
				{persona.primer_apellido_nat}
				{persona.segundo_apellido_nat}
			</p>
		{:else}
			<h3>RIF:</h3>
			<p>{persona.rif_jur}</p>
			<h3>Denominacion:</h3>
			<p>{persona.denominacion_persona_jur}</p>
			<h3>Razon Social:</h3>
			<p>{persona.razon_social_jur}</p>
			<h3>Pagina Web:</h3>
			<p>{persona.pagina_web_jur}</p>
		{/if}
		<h3>Telefonos:</h3>
		{#each telefonos as telefono}
			{#if persona.codigo_com === telefono.fk_persona}
				<p>{telefono.numero_telefono_tel}</p>
			{/if}
		{/each}
		<h3>Correos:</h3>
		{#each correos as correo}
			{#if persona.codigo_com === correo.fk_persona}
				<p>{correo.direccion_correo_ce}</p>
			{/if}
		{/each}
		<p>Direccion:{persona.direccion_com}</p>
		<p>Monto Acreditado:{persona.monto_acreditado_com}</p>
		<p>Nacionalidad:{persona.nacionalidad_com}</p>
	</div>
	<div>
		<h3>Modelo:</h3>
		<p>{avion_a_pagar.nombre_ma}</p>
	</div>
	<div>
		<h3>Monto en Bs:</h3>
		<p>{avion_a_pagar.precio_unidad_ma} Bs</p>
		<h3>Seleccione la moneda para la cual desea el tipo de cambio:</h3>
		<select bind:value={$selectedMoneda}>
			{#each monedas as moneda}
				<option value={moneda}>{moneda.nombre_mon}</option>
			{/each}
		</select>
		<h3>Monto en Moneda Extranjera:</h3>
		<p>{(avion_a_pagar.precio_unidad_ma / $selectedMoneda.tasa_cambio_mon).toFixed(2)}{$selectedMoneda.nombre_mon}</p>
		<h3 style="color: red;">Al pagar en monedas extranjeras se debe cancelar el 3% sobre el total en dicha moneda</h3>
		<p>{(((avion_a_pagar.precio_unidad_ma / $selectedMoneda.tasa_cambio_mon) * 0.03) + (avion_a_pagar.precio_unidad_ma / $selectedMoneda.tasa_cambio_mon)).toFixed(2)} {$selectedMoneda.nombre_mon}</p>
	</div>
</div>

<div>
	<button onclick={() => seleccionarComponente('tarjeta')}>Tarjeta</button>
	<button onclick={() => seleccionarComponente('transferencia')}>Transferencia</button>
	<button onclick={() => seleccionarComponente('cheque')}>Cheque</button>
</div>

{#if $selectedComponent === InformacionPagoTarjeta}
	<InformacionPagoTarjeta
		modopago={(string1:string) => {
			console.log(modo_pago.codigo_mp);
			fetch(`/cliente/pago/registrarVenta`, {
				method: 'POST',
				body: JSON.stringify({modo_pago:modo_pago.codigo_mp, moneda:$selectedMoneda,precioAvion:avion_a_pagar.precio_unidad_ma, codigo_com:persona.codigo_com}),
				headers: { 'Content-Type': 'application/json' }
			});
			console.log(string1);
		}}
		moneda={$selectedMoneda}
		bind:modo_pago
	/>
{:else if $selectedComponent === InformacionPagoTransferencia}
	<InformacionPagoTransferencia moneda={$selectedMoneda} bind:modo_pago />
{:else if $selectedComponent === InformacionPagoCheque}
	<InformacionPagoCheque moneda={$selectedMoneda} bind:modo_pago />
{/if}

<style>
	.InformacionPago {
		margin-bottom: 20px;
		background-color: #f0f0f0;
		padding: 10px;
		border-radius: 5px;
	}

	.InformacionPago div {
		text-align: left;
	}

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

<script lang="ts">
	import { page } from '$app/stores';
	import InformacionPagoTarjeta from '$lib/components/informacionPagoTarjeta.svelte';
	import InformacionPagoTransferencia from '$lib/components/informacionPagoTransferencia.svelte';
	import InformacionPagoCheque from '$lib/components/informacionPagoCheque.svelte';
	import type { Modelo_avion } from '$lib/server/db/schema';
	let { data }: { data: PageData } = $props();
	import type { PageData } from './$types';
	let id_editar = Number($page.params.index);
	import { writable } from 'svelte/store';
	const avion_a_pagar :Modelo_avion={
		codigo_ma: data.avion.codigo_ma,
		nombre_ma: data.avion.nombre_ma,
		descripcion_ma: data.avion.descripcion_ma,
		fk_modelo_avion: data.avion.fk_modelo_avion,
		precio_unidad_ma: data.avion.precio_unidad_ma
	}

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

	async function registrarMetodoPago() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/materia_prima`, {
			method: 'POST',
			body: JSON.stringify(modo_pago),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();

		alert('Rol agregado con exito');
		goto('/admin/HomeAdmin/inventario/materia_prima');
	}
</script>
<h1>Información De Pago</h1>
<div class="InformacionPago">
	<div>
		<h3>Modelo:</h3> <p>{avion_a_pagar.nombre_ma}</p>
	</div>
	<div>
		<h3>Monto:</h3> <p>{avion_a_pagar.precio_unidad_ma}</p>
	</div>
</div>

<div>
	<button onclick={() => seleccionarComponente('tarjeta')}>Tarjeta</button>
	<button onclick={() => seleccionarComponente('transferencia')}>Transferencia</button>
	<button onclick={() => seleccionarComponente('cheque')}>Cheque</button>
</div>

{#if $selectedComponent === InformacionPagoTarjeta}
	<InformacionPagoTarjeta />
{:else if $selectedComponent === InformacionPagoTransferencia}
	<InformacionPagoTransferencia />
{:else if $selectedComponent === InformacionPagoCheque}
	<InformacionPagoCheque />
{/if}

<style>

	.InformacionPago {
		display: flex;
		justify-content: space-between;
		margin-bottom: 20px;
		background-color: #f0f0f0;
		padding: 10px;
		border-radius: 5px;
	}

	.InformacionPago div {
		text-align: center;
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
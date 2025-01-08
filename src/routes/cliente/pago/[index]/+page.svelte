<script lang="ts">
	import { page } from '$app/stores';
	import InformacionPagoTarjeta from '$lib/components/informacionPagoTarjeta.svelte';
	import InformacionPagoTransferencia from '$lib/components/informacionPagoTransferencia.svelte';
	import InformacionPagoCheque from '$lib/components/informacionPagoCheque.svelte';
	let id_editar = Number($page.params.index);

	let selectedComponent = InformacionPagoTarjeta;

	function seleccionarComponente(tipoPago: string) {
		switch (tipoPago) {
			case 'tarjeta':
				selectedComponent = InformacionPagoTarjeta;
				break;
			case 'transferencia':
				selectedComponent = InformacionPagoTransferencia;
				break;
			case 'cheque':
				selectedComponent = InformacionPagoCheque;
				break;
			default:
				selectedComponent = null;
		}
	}
</script>

<div class="InformacionPago">
	<h1>Información De Pago del modelo: {id_editar}</h1>
	<p>Nombre: Juan Pérez</p>
	<p>Dirección: Calle Falsa 123</p>
	<p>Teléfono: +58 123-4567890</p>
	<p>Email: juan.perez@example.com</p>
	<p>Total avion: 20181912719$</p>
</div>

<div>
	<button on:click={() => seleccionarComponente('tarjeta')}>Tarjeta</button>
	<button on:click={() => seleccionarComponente('transferencia')}>Transferencia</button>
	<button on:click={() => seleccionarComponente('cheque')}>Cheque</button>
</div>

{#if selectedComponent}
	<svelte:component this={selectedComponent} />
{/if}

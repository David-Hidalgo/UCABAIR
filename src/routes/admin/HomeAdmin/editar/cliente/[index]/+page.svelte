<script lang="ts">
	import { page } from '$app/stores';
	import { onMount } from 'svelte';
	import type { PageData } from './$types';
	import EditarClienteNat from '$lib/components/registrarClienteNat.svelte';
	import EditarClienteJur from '$lib/components/registrarClienteJur.svelte';
	let { data }: { data: PageData } = $props();
	let tipo: string | null = $state(null);

	onMount(() => {
		const urlParams = new URLSearchParams($page.url.search);
		tipo = urlParams.get('tipo');
	});
</script>

{#if tipo === 'natural'}
	<EditarClienteNat fk_usuario={data.fk_usuario} codigo_com={data.resultado.codigo_com} id_editar={data.resultado} />
{:else if tipo === 'juridico'}
	<EditarClienteJur fk_usuario={data.fk_usuario} codigo_com={data.resultado.codigo_com} id_editar={data.resultado} />
{/if}

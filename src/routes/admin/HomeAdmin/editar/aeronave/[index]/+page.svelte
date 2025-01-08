<script lang="ts">
	import type { PageData } from './$types';
	import EditarAeronave from '$lib/components/registrarAeronave.svelte';

	let { data }: { data: PageData } = $props();
</script>

<div class="EditarRol">
	<EditarAeronave id_editar={data.resultado} modelos_avion={data.modelos_avion} />
</div>

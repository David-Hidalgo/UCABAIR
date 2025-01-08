<script lang="ts">
	import type { PageData } from './$types';
	import RegistrarAeronave from '$lib/components/registrarAeronave.svelte';
	let { data }: { data: PageData } = $props();
</script>

<RegistrarAeronave id_editar={undefined} modelos_avion={data.modelos_avion} />

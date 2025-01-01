<script lang="ts">
	import type { PageData } from './$types';
	import RegistrarTipoPrueba from '$lib/components/registrarTipoPrueba.svelte';
	let { data }: { data: PageData }=$props();
</script>


		<RegistrarTipoPrueba id_editar={undefined} />
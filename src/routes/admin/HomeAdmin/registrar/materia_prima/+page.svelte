<script lang="ts">
	import type { PageData } from './$types';
	import RegistrarTipoMateriaPrima from '$lib/components/registrarMateriaPrima.svelte';
	let { data }: { data: PageData }=$props();
</script>


		<RegistrarTipoMateriaPrima id_editar={undefined}/>
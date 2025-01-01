<script lang="ts">
    import type { PageData } from './$types';
	import EditarTipoPrueba from '$lib/components/registrarTipoPrueba.svelte';
	let { data }: { data: PageData }=$props();
</script>

	<div class="EditarTipoPrueba">
		<EditarTipoPrueba id_editar={data.resultado} />
	</div>
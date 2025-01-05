<script lang="ts">
    import type { PageData } from './$types';
	import EditarTipoMateriaPrima from '$lib/components/registrarMateriaPrima.svelte';
	let { data }: { data: PageData }=$props();
</script>

	<div class="EditarMateriaPrima">
		<EditarTipoMateriaPrima id_editar={data.resultado}/>
	</div>

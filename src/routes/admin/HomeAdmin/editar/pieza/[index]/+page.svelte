<script lang="ts">
    import type { PageData } from './$types';
	import EditarTipoPieza from '$lib/components/registrarTipoPieza.svelte';
	let { data }: { data: PageData }=$props();
</script>

	<div class="EditarTipoPrueba">
		<EditarTipoPieza id_editar={data.resultado} piezas_fk={data.piezas_fk}/>
	</div>
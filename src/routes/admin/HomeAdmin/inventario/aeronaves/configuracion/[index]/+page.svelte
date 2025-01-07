<script lang="ts">
    import type { PageData } from './$types';
	import MostrarPresupuesto from '$lib/components/mostrarPresupuesto.svelte';
	let { data }: { data: PageData }=$props();
</script>

	<div class="EditarRol">
		<MostrarPresupuesto id_editar={data.ma_table}/>
	</div>

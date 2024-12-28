<script lang="ts">
    import type { PageData } from './$types';
	import EditarTipoPrueba from '$lib/components/registrarTipoPrueba.svelte';
	let { data }: { data: PageData }=$props();
</script>

	<div class="EditarRol">
		<!-- <EditarRol bind:rif={codigo_rol}/> -->
		<EditarTipoPrueba id_editar={data.resultado} />
	</div>

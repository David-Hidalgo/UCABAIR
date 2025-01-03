<script lang="ts">
    import type { PageData } from './$types';
	import EditarRol from '$lib/components/registrarRol.svelte';
	let { data }: { data: PageData }=$props();
</script>

	<div class="EditarRol">
		<EditarRol id_editar={data.resultado} privilegios={data.permisos}/>
	</div>

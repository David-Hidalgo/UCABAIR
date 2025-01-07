<script lang="ts">
	import type { PageData } from './$types';
	import RegistrarSolicitud from '$lib/components/registrarSolicitud.svelte';
	let { data }: { data: PageData }=$props();
</script>


		<RegistrarSolicitud id_editar={undefined} datos_solicitud={data.resultado} />
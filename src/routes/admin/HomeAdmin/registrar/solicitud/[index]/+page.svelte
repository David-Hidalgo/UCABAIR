<script lang="ts">
	import type { PageData } from './$types';
	import RegistrarSolicitud from '$lib/components/registrarSolicitud.svelte';
	let { data }: { data: PageData } = $props();
</script>

<div class="EditarMateriaPrima">
	<RegistrarSolicitud
		datos_solicitud={data.datos_solicitud}
		materia_prima={data.materia_prima}
		proveedores={data.proveedor}
	/>
</div>

<script lang="ts">
	import type { PageData } from './$types';
	import RegistrarTipoPieza from '$lib/components/registrarTipoPieza.svelte';
	let { data }: { data: PageData } = $props();
</script>

<RegistrarTipoPieza id_editar={undefined} piezas_fk={data.piezas_fk} />

<script lang="ts">
	import type { PageData } from './$types';
	import RegistrarRol from '$lib/components/registrarRol.svelte';
	let { data }: { data: PageData }=$props();
</script>


		<RegistrarRol id_editar={undefined} privilegios={data.permisos} />
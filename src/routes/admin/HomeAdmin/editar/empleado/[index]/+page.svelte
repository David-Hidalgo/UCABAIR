
<script lang="ts">
	import type { PageData } from './$types';
	import Editar from '$lib/components/registrarEmpleado.svelte';
	let { data }: { data: PageData }=$props();
</script>

<div class="Editar">
		<Editar correos={data.correos} telefonos={data.telefonos} fk_usuario={data.fk_usuario.valueOf()}  id_editar={data.resultado}  />
	</div>
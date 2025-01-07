<script lang="ts">
	import type { PageData } from './$types';
	import Editar from '$lib/components/registrarProveedor.svelte';
	let { data }: { data: PageData }=$props();
</script>

<div class="Editar">
		<Editar  telefonos={data.telefonos} fk_usuario={data.fk_usuario.fk_usuario} correos={data.correos}  id_editar={data.resultado} />
	</div>




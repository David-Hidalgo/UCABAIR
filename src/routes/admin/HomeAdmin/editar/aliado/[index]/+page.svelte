<script>
	import { page } from '$app/stores';
	import Editar from '$lib/components/registrarProveedor.svelte';
	let codigo_com = Number($page.params.index);
</script>

<Editar codigo_com={codigo_com} />

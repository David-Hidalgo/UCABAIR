<script>
	import { page } from '$app/stores';
	import Editar from '$lib/components/registrarEmpleado.svelte';
	let cedula_per = Number($page.params.index);
	console.log(cedula_per);
</script>

<Editar cedula_per={cedula_per} />

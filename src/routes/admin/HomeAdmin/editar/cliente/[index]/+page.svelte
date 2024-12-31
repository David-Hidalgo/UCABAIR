<script>
	import { page } from '$app/stores';
	import Editar from '$lib/components/registrarClienteNat.svelte';
	let cedula_nat = Number($page.params.index);
	console.log(cedula_nat);
</script>

<Editar cedula_nat={cedula_nat} />

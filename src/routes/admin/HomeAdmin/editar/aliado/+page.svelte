<script>
	import Modificar from '$lib/components/registrarProveedor.svelte';
	//import rif from '$lib/components/registrarAliado.svelte'
	/**
	 * @type {any}
	 */
	let rif_aliado;
</script>

	<div class="RegistroAliado">
		<Modificar bind:rif={rif_aliado} />
	</div>
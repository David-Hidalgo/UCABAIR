<script>
	import Modificar from '$lib/components/registrarAliado.svelte';
	//import rif from '$lib/components/registrarAliado.svelte'
	/**
	 * @type {any}
	 */
	let rif_aliado;
</script>

<body>
	<div class="RegistroAliado">
		<Modificar bind:rif={rif_aliado} />
	</div>
</body>

<script>
	import Modificar from '$lib/components/registrarProveedor.svelte';
	/**
	 * @type {any}
	 */
	let rif_proveedor;
</script>

<body>
	<div class="RegistrarProveedor">
		<Modificar bind:rif={rif_proveedor} />
	</div>
</body>

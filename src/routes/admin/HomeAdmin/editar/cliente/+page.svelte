<script>
	import Modificar from '$lib/components/registrarCliente.svelte';
	/**
	 * @type {any}
	 */
	let cedula_cliente;
</script>

<body>
	<div class="RegistrarCliente">
		<Modificar bind:cedula={cedula_cliente} />
	</div>
</body>

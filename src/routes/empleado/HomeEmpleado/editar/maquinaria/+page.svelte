<script>
	import Modificar from '$lib/components/registrarMaquinaria.svelte';
	/**
	 * @type {any}
	 */
	let placa_maquinaria;
</script>

<body>
	<div class="RegistrarMaquinaria">
		<Modificar bind:placa_identificacion={placa_maquinaria} />
	</div>
</body>

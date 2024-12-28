<script>
	import EditarTipoPrueba from '$lib/components/registrarTipoPrueba.svelte';
	//import codigo_rol from '$lib/components/registrarRol.svelte'
	/**
	 * @type {any}
	 */
	let codigo_tp;
</script>

	<div class="EditarRol">
		<b>HOLA AQUI ESOT</b>
		<!-- <EditarRol bind:rif={codigo_rol}/> -->
		<EditarTipoPrueba id_editar={codigo_tp} />
	</div>

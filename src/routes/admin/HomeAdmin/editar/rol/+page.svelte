<script>
	import EditarRol from '$lib/components/registrarRol.svelte';
	//import codigo_rol from '$lib/components/registrarRol.svelte'
	/**
	 * @type {any}
	 */
	let codigo_rol;
</script>

<EditarRol privilegios{null} id_editar={codigo_rol} />

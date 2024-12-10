<script>
	import EditarRol from '$lib/components/registrarRol.svelte';
	//import codigo_rol from '$lib/components/registrarRol.svelte'
	/**
	 * @type {any}
	 */
	let codigo_rol;
</script>

<body>
	<div class="EditarRol">
		<b>HOLA AQUI ESOT</b>
		<!-- <EditarRol bind:rif={codigo_rol}/> -->
		<EditarRol id_editar={codigo_rol} />
	</div>
</body>

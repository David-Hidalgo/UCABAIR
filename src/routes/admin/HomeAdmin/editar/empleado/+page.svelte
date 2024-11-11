<script>
	import Modificar from '$lib/components/registrarEmpleado.svelte';
	/**
	 * @type {any}
	 */
	let cedula_empleado;
</script>

<body>
	<div class="RegistrarEmpleado">
		<Modificar bind:cedula={cedula_empleado} />
	</div>
</body>

<script>
	import Registro from '$lib/components/configurarProyecto.svelte';
	console.log('Hola desde la consolaaaaanaskanska');
</script>

<body>
	<div class="RegistrarProyecto">
		<Registro />
		<a href="/admin/HomeAdmin/registrar/proyecto/configuracionProyecto/configurarEtapa">
			<button>Configurar Etapas</button>
		</a>
	</div>
</body>

<style>
	button {
		background-color: #050505;
		color: #fff;
		border: none;
		border-radius: 3px;
		padding: 10px 20px;
		cursor: pointer;
		font-size: 16px;
	}
</style>
